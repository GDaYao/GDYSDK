////  GDYSDKSystemMgr.m
//  GDYSDK
//
//  Created on 2019/7/11.
//  
//

#import "GDYSDKSystemMgr.h"


#import "GDYSDKKeychainItemWrapper.h"
// 获取当前设备通讯运营商
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>
// 获取当前设备型号名称
#import "sys/utsname.h"

// 获取网络状态
#import <GDYSDK/GDYReachability.h>
#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>

// 获取SSID+BSSID
#import <SystemConfiguration/CaptiveNetwork.h>
#import <NetworkExtension/NetworkExtension.h>

// 设备ip-address/Mac-address
#import <ifaddrs.h>
#import <resolv.h>
#import <arpa/inet.h>
#import <net/if.h>
#import <netdb.h>
#import <netinet/ip.h>
#import <net/ethernet.h>
#import <net/if_dl.h>

#define MDNS_PORT       5353
#define QUERY_NAME      "_apple-mobdev2._tcp.local"
#define DUMMY_MAC_ADDR  @"02:00:00:00:00:00"
#define IOS_CELLULAR    @"pdp_ip0"
#define IOS_WIFI        @"en0"
#define IOS_VPN         @"utun0"
#define IP_ADDR_IPv4    @"ipv4"
#define IP_ADDR_IPv6    @"ipv6"




@implementation GDYSDKSystemMgr

#pragma mark - get app config
/*获取当前App的版本号信息*/
+ (NSString *)getAppVersion {
    NSBundle *currentBundle = [NSBundle mainBundle];
    NSDictionary *infoDictionary = [currentBundle infoDictionary];
    return [infoDictionary objectForKey:@"CFBundleShortVersionString"];
}
/*获取当前App的build版本号信息*/
+ (NSString *)getAppBuildVersion {
    NSBundle *currentBundle = [NSBundle mainBundle];
    NSDictionary *infoDictionary = [currentBundle infoDictionary];
    return [infoDictionary objectForKey:@"CFBundleVersion"];
}
/*获取当前App的包名信息*/
+ (NSString *)getAppBundleId {
    NSBundle *currentBundle = [NSBundle mainBundle];
    NSDictionary *infoDictionary = [currentBundle infoDictionary];
    return [infoDictionary objectForKey:@"CFBundleIdentifier"];
}

/** 更改包名 || 修改包名
 *
 */
+ (void)changeBundleId {
    
#ifdef DEBUG
    NSBundle *currentBundle = [NSBundle mainBundle];
    NSDictionary *infoDictionary = [currentBundle infoDictionary];
    [infoDictionary setValue:@"" forKey:@"CFBundleIdentifier"];
#else
    if ([@"" isEqualToString:@""] ) {
        NSBundle *currentBundle = [NSBundle mainBundle];
        NSDictionary *infoDictionary = [currentBundle infoDictionary];
        [infoDictionary setValue:kFormalBundleId forKey:@"CFBundleIdentifier"];
    }
#endif
}


/*获取当前App的名称信息 -- 需要判断是否国际化，二者获取方式有差别*/
+ (NSString *)getAppDisplayNameWithIsInternational:(BOOL)isInternational {
    if (isInternational == YES) {
        // 获取国际化名称
        NSString *appNameStr = [[NSBundle mainBundle] localizedStringForKey:@"CFBundleDisplayName" value:nil table:@"InfoPlist"];
        return appNameStr;
    }
    NSBundle *currentBundle = [NSBundle mainBundle];
    NSDictionary *infoDictionary = [currentBundle infoDictionary];
    NSString *appName = [infoDictionary objectForKey:@"CFBundleDisplayName"];
    if (appName.length==0 || appName ==nil) {
        appName =    [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleNameKey];
    }
    return appName;
}

#pragma mark - get device config
/*获取当前设备的UDID值*/
+ (NSString *)getDeviceUDIDValueString {
    return [[[UIDevice currentDevice] identifierForVendor] UUIDString];
}
/* 获取当前设备的UDID-存储到KeyChain中  */
+ (NSString *)getDeviceUDIDValueFromKeychain {
    NSString *identifier = @"GetUDIDIdentifier";
    GDYSDKKeychainItemWrapper *keyChainWrapper = [[GDYSDKKeychainItemWrapper alloc] initWithIdentifier:identifier accessGroup:nil];
    NSArray *UUID = [keyChainWrapper objectForKey:(__bridge id)kSecValueData];
    if (UUID == nil || UUID.count == 0) {
        UUID = @[ [[[UIDevice currentDevice] identifierForVendor] UUIDString] ];
        [keyChainWrapper setObject:UUID forKey:(__bridge id)kSecValueData];
        return [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    }
    return UUID[0];
}

/*获取当前设备的通讯运营商名称*/
+ (NSString *)getDeviceCarrierName
{
    CTTelephonyNetworkInfo *info = [CTTelephonyNetworkInfo new];
    CTCarrier *carrier = [info subscriberCellularProvider];
    return [carrier carrierName];
}

/*获取当前设备的型号名称- iPhone1,1,... */
+ (NSString *)getDeviceModel {
    NSString *platform = nil;
    struct utsname systemInfo;
    uname(&systemInfo);
    platform = [NSString stringWithCString:systemInfo.machine
                                  encoding:NSUTF8StringEncoding];
    return [NSString stringWithFormat:@"%@",platform];
}

// judge machine type
/**
 need import "#import <sys/utsname.h>"
 */
+ (NSString*)getDeviceType {
    struct utsname systemInfo;
    
    uname(&systemInfo);
    
    NSString *platform = [NSString stringWithCString: systemInfo.machine encoding:NSASCIIStringEncoding];
    
    if([platform isEqualToString:@"iPhone1,1"]) return@"iPhone 2G";
    
    if([platform isEqualToString:@"iPhone1,2"]) return@"iPhone 3G";
    
    if([platform isEqualToString:@"iPhone2,1"]) return@"iPhone 3GS";
    
    if([platform isEqualToString:@"iPhone3,1"]) return@"iPhone 4";
    
    if([platform isEqualToString:@"iPhone3,2"]) return@"iPhone 4";
    
    if([platform isEqualToString:@"iPhone3,3"]) return@"iPhone 4";
    
    if([platform isEqualToString:@"iPhone4,1"]) return@"iPhone 4S";
    
    if([platform isEqualToString:@"iPhone5,1"]) return@"iPhone 5";
    
    if([platform isEqualToString:@"iPhone5,2"]) return@"iPhone 5";
    
    if([platform isEqualToString:@"iPhone5,3"]) return@"iPhone 5c";
    
    if([platform isEqualToString:@"iPhone5,4"]) return@"iPhone 5c";
    
    if([platform isEqualToString:@"iPhone6,1"]) return@"iPhone 5s";
    
    if([platform isEqualToString:@"iPhone6,2"]) return@"iPhone 5s";
    
    if([platform isEqualToString:@"iPhone7,1"]) return@"iPhone 6 Plus";
    
    if([platform isEqualToString:@"iPhone7,2"]) return@"iPhone 6";
    
    if([platform isEqualToString:@"iPhone8,1"]) return@"iPhone 6s";
    
    if([platform isEqualToString:@"iPhone8,2"]) return@"iPhone 6s Plus";
    
    if([platform isEqualToString:@"iPhone8,4"]) return@"iPhone SE";
    
    if([platform isEqualToString:@"iPhone9,1"]) return@"iPhone 7";
    
    if([platform isEqualToString:@"iPhone9,2"]) return@"iPhone 7 Plus";
    
    if([platform isEqualToString:@"iPhone10,1"]) return@"iPhone 8";
    
    if([platform isEqualToString:@"iPhone10,4"]) return@"iPhone 8";
    
    if([platform isEqualToString:@"iPhone10,2"]) return@"iPhone 8 Plus";
    
    if([platform isEqualToString:@"iPhone10,5"]) return@"iPhone 8 Plus";
    
    // iPhone X
    if([platform isEqualToString:@"iPhone10,3"]) return@"iPhone X";
    
    if([platform isEqualToString:@"iPhone10,6"]) return@"iPhone X";
    if([platform isEqualToString:@"iPhone11,2"]) return@"iPhone XS";
    if([platform isEqualToString:@"iPhone11,4"]) return@"iPhone XS Max";
    if([platform isEqualToString:@"iPhone11,6"]) return@"iPhone XS Max";
    if([platform isEqualToString:@"iPhone11,8"]) return@"iPhone XR";
    
    // iPhone 11 ++
    if([platform isEqualToString:@"iPhone12,1"]) return @"iPhone 11";
    if([platform isEqualToString:@"iPhone12,3"]) return @"iPhone 11 Pro";
    if([platform isEqualToString:@"iPhone12,5"]) return @"iPhone 11 Pro Max";
    if([platform isEqualToString:@"iPhone12,8"]) return @"iPhone SE(2ed generation)";
    
    // iPhone 12 ++
    if([platform isEqualToString:@"iPhone13,1"]) return @"iPhone 12 mini";
    if([platform isEqualToString:@"iPhone13,2"]) return @"iPhone 12";
    if([platform isEqualToString:@"iPhone13,3"]) return @"iPhone 12  Pro";
    if([platform isEqualToString:@"iPhone13,4"]) return @"iPhone 12  Pro Max";
    
    // iPhone 13 ++
    if([platform isEqualToString:@"iPhone14,2"]) return @"iPhone 13 Pro";
    if([platform isEqualToString:@"iPhone14,3"]) return @"iPhone 13 Pro Max";
    if([platform isEqualToString:@"iPhone14,4"]) return @"iPhone 13 Mini";
    if([platform isEqualToString:@"iPhone14,5"]) return @"iPhone 13";
    
    // iPod
    if([platform isEqualToString:@"iPod1,1"]) return@"iPod Touch 1G";
    if([platform isEqualToString:@"iPod2,1"]) return@"iPod Touch 2G";
    if([platform isEqualToString:@"iPod3,1"]) return@"iPod Touch 3G";
    if([platform isEqualToString:@"iPod4,1"]) return@"iPod Touch 4G";
    if([platform isEqualToString:@"iPod5,1"]) return@"iPod Touch 5G";
    if([platform isEqualToString:@"iPod7,1"]) return @"iPod Touch 6";
    if([platform isEqualToString:@"iPod9,1"]) return @"iPod Touch 7";
    
    // iPad
    if([platform isEqualToString:@"iPad1,1"]) return@"iPad 1G";
    
    if([platform isEqualToString:@"iPad2,1"]) return@"iPad 2";
    
    if([platform isEqualToString:@"iPad2,2"]) return@"iPad 2";
    
    if([platform isEqualToString:@"iPad2,3"]) return@"iPad 2";
    
    if([platform isEqualToString:@"iPad2,4"]) return@"iPad 2";
    
    if([platform isEqualToString:@"iPad2,5"]) return@"iPad Mini 1G";
    
    if([platform isEqualToString:@"iPad2,6"]) return@"iPad Mini 1G";
    
    if([platform isEqualToString:@"iPad2,7"]) return@"iPad Mini 1G";
    
    if([platform isEqualToString:@"iPad3,1"]) return@"iPad 3";
    
    if([platform isEqualToString:@"iPad3,2"]) return@"iPad 3";
    
    if([platform isEqualToString:@"iPad3,3"]) return@"iPad 3";
    
    if([platform isEqualToString:@"iPad3,4"]) return@"iPad 4";
    
    if([platform isEqualToString:@"iPad3,5"]) return@"iPad 4";
    
    if([platform isEqualToString:@"iPad3,6"]) return@"iPad 4";
    
    if([platform isEqualToString:@"iPad4,1"]) return@"iPad Air";
    
    if([platform isEqualToString:@"iPad4,2"]) return@"iPad Air";
    
    if([platform isEqualToString:@"iPad4,3"]) return@"iPad Air";
    
    if([platform isEqualToString:@"iPad4,4"]) return@"iPad Mini 2G";
    
    if([platform isEqualToString:@"iPad4,5"]) return@"iPad Mini 2G";
    
    if([platform isEqualToString:@"iPad4,6"]) return@"iPad Mini 2G";
    
    if([platform isEqualToString:@"iPad4,7"]) return@"iPad Mini 3";
    
    if([platform isEqualToString:@"iPad4,8"]) return@"iPad Mini 3";
    
    if([platform isEqualToString:@"iPad4,9"]) return@"iPad Mini 3";
    
    if([platform isEqualToString:@"iPad5,1"]) return@"iPad Mini 4";
    
    if([platform isEqualToString:@"iPad5,2"]) return@"iPad Mini 4";
    
    if([platform isEqualToString:@"iPad5,3"]) return@"iPad Air 2";
    
    if([platform isEqualToString:@"iPad5,4"]) return@"iPad Air 2";
    
    if([platform isEqualToString:@"iPad6,3"]) return@"iPad Pro 9.7";
    
    if([platform isEqualToString:@"iPad6,4"]) return@"iPad Pro 9.7";
    
    if([platform isEqualToString:@"iPad6,7"]) return@"iPad Pro 12.9";
    
    if([platform isEqualToString:@"iPad6,8"]) return@"iPad Pro 12.9";
    
    if([platform isEqualToString:@"iPad6,11"]) return @"iPad 5";
    if([platform isEqualToString:@"iPad6,12"]) return @"iPad 5";
    if([platform isEqualToString:@"iPad7,1"]) return @"iPad Pro 2(12.9-inch)";
    if([platform isEqualToString:@"iPad7,2"]) return @"iPad Pro 2(12.9-inch)";
    if([platform isEqualToString:@"iPad7,3"]) return @"iPad Pro (10.5-inch)";
    if([platform isEqualToString:@"iPad7,4"]) return @"iPad Pro (10.5-inch)";
    if([platform isEqualToString:@"iPad7,5"]) return @"iPad 6";
    if([platform isEqualToString:@"iPad7,6"]) return @"iPad 6";
    if([platform isEqualToString:@"iPad7,11"]) return @"iPad 7";
    if([platform isEqualToString:@"iPad7,12"]) return @"iPad 7";
    if([platform isEqualToString:@"iPad8,1"]) return @"iPad Pro (11-inch) ";
    if([platform isEqualToString:@"iPad8,2"]) return @"iPad Pro (11-inch) ";
    if([platform isEqualToString:@"iPad8,3"]) return @"iPad Pro (11-inch) ";
    if([platform isEqualToString:@"iPad8,4"]) return @"iPad Pro (11-inch) ";
    if([platform isEqualToString:@"iPad8,5"]) return @"iPad Pro 3 (12.9-inch) ";
    if([platform isEqualToString:@"iPad8,6"]) return @"iPad Pro 3 (12.9-inch) ";
    if([platform isEqualToString:@"iPad8,7"]) return @"iPad Pro 3 (12.9-inch) ";
    if([platform isEqualToString:@"iPad8,8"]) return @"iPad Pro 3 (12.9-inch) ";
    if([platform isEqualToString:@"iPad11,1"]) return @"iPad mini 5";
    if([platform isEqualToString:@"iPad11,2"]) return @"iPad mini 5";
    if([platform isEqualToString:@"iPad11,3"]) return @"iPad Air 3";
    if([platform isEqualToString:@"iPad11,4"]) return @"iPad Air 3";
    
    if([platform isEqualToString:@"i386"]) return@"iPhone Simulator";
    
    if([platform isEqualToString:@"x86_64"]) return@"iPhone Simulator";
    
    return platform;
    
}


/* 获取当前设备的操作系统版本号 */
+ (NSString *)getDeviceOSVersion {
    return [[UIDevice currentDevice] systemVersion];
}

/* 当前设备名称--即用户可在设置中自定义的名称     */
+ (NSString *)getDeviceName {
    return [[UIDevice currentDevice] name];
}
/*   设备类别 --- 只有 'iPhone/iPad' 并没有过多区分   */
+ (NSString *)getDeviceBand {
    return [[UIDevice currentDevice] model];
}
/*   设备本地化版本  -- 'iPhone/iPad' */
+ (NSString *)getDeviceLocalizedModel {
    return [[UIDevice currentDevice] localizedModel];
}
/* 设备运行系统名称 -- 'iOS'     */
+ (NSString *)getDeviceSystemName {
    return [[UIDevice currentDevice] systemName];
}


#pragma mark - 获取网络状态
/** need import
 #import <GDYSDK/GDYReachability.h>
 #import <CoreTelephony/CTCarrier.h>
 #import <CoreTelephony/CTTelephonyNetworkInfo.h>
 */
+ (NSString *)GDYSDKGetDeviceNetworkStatus
{
    NSString *netconnType = @"";
    
    GDYReachability *reach = [GDYReachability reachabilityWithHostName:@"www.apple.com"];
    
    switch ([reach currentReachabilityStatus]) {
        case NotReachable:// 没有网络
        {
            
            netconnType = @"no network";
        }
            break;
            
        case ReachableViaWiFi:// Wifi
        {
            netconnType = @"Wifi";
        }
            break;
            
        case ReachableViaWWAN: // 手机自带网络
        {
            // 获取手机网络类型
            CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
            
            NSString *currentStatus = info.currentRadioAccessTechnology;
            
            if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyGPRS"]) {
                
                netconnType = @"GPRS";
            }else if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyEdge"]) {
                
                netconnType = @"2.75G EDGE";
            }else if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyWCDMA"]){
                
                netconnType = @"3G";
            }else if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyHSDPA"]){
                
                netconnType = @"3.5G HSDPA";
            }else if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyHSUPA"]){
                
                netconnType = @"3.5G HSUPA";
            }else if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyCDMA1x"]){
                
                netconnType = @"2G";
            }else if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyCDMAEVDORev0"]){
                
                netconnType = @"3G";
            }else if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyCDMAEVDORevA"]){
                
                netconnType = @"3G";
            }else if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyCDMAEVDORevB"]){
                
                netconnType = @"3G";
            }else if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyeHRPD"]){
                
                netconnType = @"HRPD";
            }else if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyLTE"]){
                
                netconnType = @"4G";
            }
        }
            break;
            
        default:
            break;
    }
    
    return netconnType;
}


#pragma mark - 无网络权限时 - 可提示直接跳转设置开启网络权限
+ (void)showAlertV:(NSString *)title msg:(NSString *)showMessage withOkBtn:(NSString *)okStr withErorBtn:(NSString *)errorStr cancelBlock:(void(^)(BOOL isCancel))cancelBlock {
    if (!title) {
        title = @"";
    }
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:showMessage preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:okStr style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // 跳转进入 "设置" 界面
        NSURL * url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        if([[UIApplication sharedApplication] canOpenURL:url]) {
            if (@available(iOS 10.0, *)) {
                [[UIApplication sharedApplication]openURL:url options:nil completionHandler:nil];
            } else {
                // Fallback on earlier versions
                [[UIApplication sharedApplication] openURL:url];
            }
        }
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:errorStr style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        cancelBlock(YES);
    }];
    [alertVC addAction:okAction];
    [alertVC addAction:cancelAction];
    
    UIWindow *topWindow = [UIApplication sharedApplication].keyWindow;
    if ([UIApplication sharedApplication].delegate.window.rootViewController.presentedViewController == nil) {
        [topWindow.rootViewController presentViewController:alertVC animated:YES completion:nil];
    }
    
}


#pragma mark -  获取SSID（Service Set Identifier），服务集标识，也就是WiFi网络所取的名字。

/**
    CNCopySupportedInterfaces 和CNCopyCurrentNetworkInfo两个类 使用
 need import:
    #import <SystemConfiguration/CaptiveNetwork.h>
    #import <NetworkExtension/NetworkExtension.h>
 */
+ (NSString *)getDeviceWifiName
{
    NSArray *ifs = CFBridgingRelease(CNCopySupportedInterfaces());
    id info = nil;
    for (NSString *ifname in ifs) {
        info = (__bridge_transfer id)CNCopyCurrentNetworkInfo((CFStringRef) ifname);
        if (info && [info count]) {
            break;
        }
    }
    NSDictionary *dic = (NSDictionary *)info;
    NSString *ssid = [[dic objectForKey:@"SSID"] lowercaseString];
    // 获取网络状态为nil
    return ssid;
}
#pragma mark - 获取BSSID即mac地址。
+ (NSString *)getDeviceWifiMac
{
    NSArray *ifs = CFBridgingRelease(CNCopySupportedInterfaces());
    id info = nil;
    for (NSString *ifname in ifs) {
        info = (__bridge_transfer id)CNCopyCurrentNetworkInfo((CFStringRef) ifname);
        if (info && [info count]) {
            break;
        }
    }
    NSDictionary *dic = (NSDictionary *)info;
    NSString *bssid = [dic objectForKey:@"BSSID"];
    
    return bssid;
}


#pragma mark - 获取 ip地址+设备Mac地址-网络唯一地址
/*
 * TODO: 获取设备当前网络IP地址
 */
+ (NSString *)getDeviceIPAddress:(BOOL)preferIPv4
{
    NSArray *searchArray = preferIPv4 ?
    @[ IOS_VPN @"/" IP_ADDR_IPv4, IOS_VPN @"/" IP_ADDR_IPv6, IOS_WIFI @"/" IP_ADDR_IPv4, IOS_WIFI @"/" IP_ADDR_IPv6, IOS_CELLULAR @"/" IP_ADDR_IPv4, IOS_CELLULAR @"/" IP_ADDR_IPv6 ] :
    @[ IOS_VPN @"/" IP_ADDR_IPv6, IOS_VPN @"/" IP_ADDR_IPv4, IOS_WIFI @"/" IP_ADDR_IPv6, IOS_WIFI @"/" IP_ADDR_IPv4, IOS_CELLULAR @"/" IP_ADDR_IPv6, IOS_CELLULAR @"/" IP_ADDR_IPv4 ] ;
    
    NSDictionary *addresses = [self getIPAddr];
    
    __block NSString *address;
    [searchArray enumerateObjectsUsingBlock:^(NSString *key, NSUInteger idx, BOOL * _Nonnull stop) {
        address = addresses[key];
        //筛选出IP地址格式
        if([self isValidatIP:address]) *stop = YES;
    }];
    return address ? address : @"0.0.0.0";
}
+ (BOOL)isValidatIP:(NSString *)ipAddress {
    if (ipAddress.length == 0) {
        return NO;
    }
    NSString *urlRegEx = @"^([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\."
    "([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\."
    "([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\."
    "([01]?\\d\\d?|2[0-4]\\d|25[0-5])$";
    
    NSError *error;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:urlRegEx options:0 error:&error];
    
    if (regex != nil) {
        NSTextCheckingResult *firstMatch=[regex firstMatchInString:ipAddress options:0 range:NSMakeRange(0, [ipAddress length])];
        return firstMatch;
    }
    return NO;
}
+ (NSDictionary *)getIPAddr
{
    NSMutableDictionary *addresses = [NSMutableDictionary dictionaryWithCapacity:8];
    
    // retrieve the current interfaces - returns 0 on success
    struct ifaddrs *interfaces;
    if(!getifaddrs(&interfaces)) {
        // Loop through linked list of interfaces
        struct ifaddrs *interface;
        for(interface=interfaces; interface; interface=interface->ifa_next) {
            if(!(interface->ifa_flags & IFF_UP) /* || (interface->ifa_flags & IFF_LOOPBACK) */ ) {
                continue; // deeply nested code harder to read
            }
            const struct sockaddr_in *addr = (const struct sockaddr_in*)interface->ifa_addr;
            char addrBuf[ MAX(INET_ADDRSTRLEN, INET6_ADDRSTRLEN) ];
            if(addr && (addr->sin_family==AF_INET || addr->sin_family==AF_INET6)) {
                NSString *name = [NSString stringWithUTF8String:interface->ifa_name];
                NSString *type;
                if(addr->sin_family == AF_INET) {
                    if(inet_ntop(AF_INET, &addr->sin_addr, addrBuf, INET_ADDRSTRLEN)) {
                        type = IP_ADDR_IPv4;
                    }
                } else {
                    const struct sockaddr_in6 *addr6 = (const struct sockaddr_in6*)interface->ifa_addr;
                    if(inet_ntop(AF_INET6, &addr6->sin6_addr, addrBuf, INET6_ADDRSTRLEN)) {
                        type = IP_ADDR_IPv6;
                    }
                }
                if(type) {
                    NSString *key = [NSString stringWithFormat:@"%@/%@", name, type];
                    addresses[key] = [NSString stringWithUTF8String:addrBuf];
                }
            }
        }
        // Free memory
        freeifaddrs(interfaces);
    }
    return [addresses count] ? addresses : nil;
}

/*
 * TODO:获取设备物理地址 -- 请在工程中添加 <libresolv.9.tbd>系统libraries
 *  s.libraries = 'resolv.9.tbd'
 */
+ (nullable NSString *)geDevicetMacAddress {
   /*
    res_9_init();
    int len;
    //get currnet ip address
    NSString *ip = [self currentIPAddressOf:IOS_WIFI];
    if(ip == nil) {
        fprintf(stderr, "could not get current IP address of en0\n");
        return DUMMY_MAC_ADDR;
    }//end if
    
    //set port and destination
    _res.nsaddr_list[0].sin_family = AF_INET;
    _res.nsaddr_list[0].sin_port = htons(MDNS_PORT);
    _res.nsaddr_list[0].sin_addr.s_addr = [self IPv4Pton:ip];
    _res.nscount = 1;
    
    unsigned char response[NS_PACKETSZ];
    
    
    //send mdns query
    if((len = res_9_query(QUERY_NAME, ns_c_in, ns_t_ptr, response, sizeof(response))) < 0) {
        
        fprintf(stderr, "res_search(): %s\n", hstrerror(h_errno));
        return DUMMY_MAC_ADDR;
    }//end if
    
    //parse mdns message
    ns_msg handle;
    if(ns_initparse(response, len, &handle) < 0) {
        fprintf(stderr, "ns_initparse(): %s\n", hstrerror(h_errno));
        return DUMMY_MAC_ADDR;
    }//end if
    
    //get answer length
    len = ns_msg_count(handle, ns_s_an);
    if(len < 0) {
        fprintf(stderr, "ns_msg_count return zero\n");
        return DUMMY_MAC_ADDR;
    }//end if
    
    //try to get mac address from data
    NSString *macAddress = nil;
    for(int i = 0 ; i < len ; i++) {
        ns_rr rr;
        ns_parserr(&handle, ns_s_an, 0, &rr);
        
        if(ns_rr_class(rr) == ns_c_in &&
           ns_rr_type(rr) == ns_t_ptr &&
           !strcmp(ns_rr_name(rr), QUERY_NAME)) {
            char *ptr = (char *)(ns_rr_rdata(rr) + 1);
            int l = (int)strcspn(ptr, "@");
            
            char *tmp = calloc(l + 1, sizeof(char));
            if(!tmp) {
                perror("calloc()");
                continue;
            }//end if
            memcpy(tmp, ptr, l);
            macAddress = [NSString stringWithUTF8String:tmp];
            free(tmp);
        }//end if
    }//end for each
    macAddress = macAddress ? macAddress : DUMMY_MAC_ADDR;
    return macAddress;
    */
    return @"";
}//end getMacAddressFromMDNS

+ (nonnull NSString *)currentIPAddressOf: (nonnull NSString *)device {
    struct ifaddrs *addrs;
    NSString *ipAddress = nil;
    
    if(getifaddrs(&addrs) != 0) {
        return @"";
    }//end if
    
    //get ipv4 address
    for(struct ifaddrs *addr = addrs ; addr ; addr = addr->ifa_next) {
        if(!strcmp(addr->ifa_name, [device UTF8String])) {
            if(addr->ifa_addr) {
                struct sockaddr_in *in_addr = (struct sockaddr_in *)addr->ifa_addr;
                if(in_addr->sin_family == AF_INET) {
                    ipAddress = [self IPv4Ntop:in_addr->sin_addr.s_addr];
                    break;
                }//end if
            }//end if
        }//end if
    }//end for
    
    freeifaddrs(addrs);
    return ipAddress;
}//end currentIPAddressOf:
+ (nullable NSString *)IPv4Ntop: (in_addr_t)addr {
    char buffer[INET_ADDRSTRLEN] = {0};
    return inet_ntop(AF_INET, &addr, buffer, sizeof(buffer)) ?
    [NSString stringWithUTF8String:buffer] : nil;
}//end IPv4Ntop:

+ (in_addr_t)IPv4Pton: (nonnull NSString *)IPAddr {
    in_addr_t network = INADDR_NONE;
    return inet_pton(AF_INET, [IPAddr UTF8String], &network) == 1 ?
    network : INADDR_NONE;
}//end IPv4Pton:


#pragma mark - 获取地区标识：如en_Zh
+ (NSString *)getCurrentLocale {
    NSLocale *locale = [NSLocale currentLocale];
    NSString *country = [locale localeIdentifier];
    return country;
}

#pragma mark - 获取设备国家代码
+ (NSString *)getCurrentCountryCode {
    NSLocale *locale = [NSLocale currentLocale];
    return locale.countryCode;
}


#pragma mark - get system languages
/**
  英语: en 繁体: zh-Hant 简体中文: zh-Hans 日语: ja 韩语: ko  俄语: ru 德语: de 法语: fr
 */
+ (NSString*)getPreferredLanguage {
    NSUserDefaults* defs = [NSUserDefaults standardUserDefaults];
    NSArray* languages = [defs objectForKey:@"AppleLanguages"];
    NSString* preferredLang = [languages objectAtIndex:0];
    
    if ( (preferredLang.length>=2) && ([[preferredLang substringWithRange:NSMakeRange(0, 2)] isEqualToString:@"en"]) ) {
        return @"en";
    }else if ((preferredLang.length>=7) && ([[preferredLang substringWithRange:NSMakeRange(0, 7)] isEqualToString:@"zh-Hans"]) ) {
        return @"zh-Hans";
    } else if ((preferredLang.length>=7) && ([[preferredLang substringWithRange:NSMakeRange(0, 7)] isEqualToString:@"zh-Hant"]) ) {
        return @"zh-Hant";
    }else if ((preferredLang.length>=2)&& ([[preferredLang substringWithRange:NSMakeRange(0, 2)] isEqualToString:@"ja"]) ) {
        return @"ja";
    }else if ((preferredLang.length>=2)&& ([[preferredLang substringWithRange:NSMakeRange(0, 2)] isEqualToString:@"ko"]) ) {
        return @"ko";
    }else if ((preferredLang.length>=2)&& ([[preferredLang substringWithRange:NSMakeRange(0, 2)] isEqualToString:@"ru"]) ) {
        return @"ru";
    }else if ((preferredLang.length>=2)&& ([[preferredLang substringWithRange:NSMakeRange(0, 2)] isEqualToString:@"de"]) ) {
        return @"de";
    }else if ((preferredLang.length>=2)&& ([[preferredLang substringWithRange:NSMakeRange(0, 2)] isEqualToString:@"fr"]) ) {
        return @"fr";
    }
    else{
        return @"en";
    }
    // NSLog(@"Preferred Language:%@", preferredLang);
    return preferredLang;
}





@end
