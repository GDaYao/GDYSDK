////  GDYSDKSystemMgr.h
//  GDYSDK
//
//  Created on 2019/7/11.
//  
//

/** func: 所有 系统方法 使用
 *
 */


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GDYSDKSystemMgr : NSObject

#pragma mark - get app config
/*获取当前App的版本号信息*/
+ (NSString *)getAppVersion;
/*获取当前App的build版本号信息*/
+ (NSString *)getAppBuildVersion;
/*获取当前App的包名信息*/
+ (NSString *)getAppBundleId;
/*获取当前App的名称信息*/
+ (NSString *)getAppDisplayName;

#pragma mark - get device config
/*获取当前设备的UDID值*/
+ (NSString *)getDeviceUDIDValueString;
/* 获取当前设备的UDID-存储到KeyChain中  */
+ (NSString *)getDeviceUDIDValueFromKeychain;
/*获取当前设备的通讯运营商名称*/
+ (NSString *)getDeviceCarrierName;
/*获取当前设备的型号名称*/
+ (NSString *)getDeviceModel;
/*获取当前设备的操作系统版本号*/
+ (NSString *)getDeviceOSVersion;

#pragma mark -  获取SSID（Service Set Identifier)
+ (NSString *)getDeviceWifiName;
#pragma mark - 获取BSSID即mac地址。
+ (NSString *)getDeviceWifiMac;


#pragma mark - 获取 ip地址+设备Mac地址-网络唯一地址
+ (NSString *)getDeviceIPAddress:(BOOL)preferIPv4;
//+ (nullable NSString *)geDevicetMacAddress;

#pragma mark - get system languages/ 获的当前系统使用语言
/**
 多语言适配中使用，有些地区因为使用语言相通但是语言代码不同，如zh-Hans，还有zh_Hans-CN则只使用前面匹配即可

 @return 返回多语言代码.
 */
+ (NSString*)getPreferredLanguage;




@end

NS_ASSUME_NONNULL_END
