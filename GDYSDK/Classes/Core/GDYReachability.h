
#import <Foundation/Foundation.h>
#import <SystemConfiguration/SystemConfiguration.h>

/**
 function: 网络监测方法
 */

/**
 Usage:
 --- 可在需要使用网络直接使用下面的方法判断
 --- 会在网络改变后（无网络）给予弹框无网络提示
 
 #pragma mark - all network relative
 - (void)isNetworkingAndAddObserveNotificationCenter{
 if (![ToolMgr isNetworking]) {
 [self alertShow:NSLocalizedString(@"noNetwokingMsg", @"您的网络已断开，请开启网络以便给您更好的体验！")];
 }
 
 [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(addObserveNetWorkIsChange:) name:kReachabilityChangedNotificationInGDY object:nil];
 // 获取访问指定站点的Reachability的对象
 GDYReachability *hostReach=[GDYReachability reachabilityForInternetConnection];
 // 让Reachability对象开启被监听状态
 [hostReach startNotifier];
 }
 - (void)addObserveNetWorkIsChange:(NSNotification *)notification{
 // selector
 if (![ToolMgr isNetworking]) {
 [self alertShow:NSLocalizedString(@"noNetwokingMsg", @"您的网络已断开，请开启网络以便给您更好的体验！")];
 }
 }
 - (void)alertShow:(NSString *)alertMsg{
 //package alert show
 UIAlertView *alertV = [[UIAlertView alloc]initWithTitle:NSLocalizedString(@"drawPresentNullShowTitle", @"温馨提示") message:alertMsg delegate:self cancelButtonTitle:NSLocalizedString(@"goodBtn_title", @"好的") otherButtonTitles:nil];
 [alertV show];
 }
*/



#ifndef NS_ENUM
#define NS_ENUM(_type, _name) enum _name : _type _name; enum _name : _type
#endif

// 注意const常量这里的监听名已改变
extern NSString *const kReachabilityChangedNotificationInGDY;

typedef NS_ENUM(NSInteger, NetworkStatus) {
    // Apple NetworkStatus Compatible Names.
    NotReachable = 0,
    ReachableViaWiFi = 2,
    ReachableViaWWAN = 1
};

@class GDYReachability;

typedef void (^NetworkReachable)(GDYReachability * reachability);
typedef void (^NetworkUnreachable)(GDYReachability * reachability);


@interface GDYReachability : NSObject

@property (nonatomic, copy) NetworkReachable    reachableBlock;
@property (nonatomic, copy) NetworkUnreachable  unreachableBlock;

@property (nonatomic, assign) BOOL reachableOnWWAN;


+(GDYReachability*)reachabilityWithHostname:(NSString*)hostname;
// This is identical to the function above, but is here to maintain
//compatibility with Apples original code. (see .m)
+(GDYReachability*)reachabilityWithHostName:(NSString*)hostname;
+(GDYReachability*)reachabilityForInternetConnection;
+(GDYReachability*)reachabilityWithAddress:(void *)hostAddress;
+(GDYReachability*)reachabilityForLocalWiFi;

-(GDYReachability *)initWithReachabilityRef:(SCNetworkReachabilityRef)ref;

-(BOOL)startNotifier;
-(void)stopNotifier;

-(BOOL)isReachable;
-(BOOL)isReachableViaWWAN;
-(BOOL)isReachableViaWiFi;

// WWAN may be available, but not active until a connection has been established.
// WiFi may require a connection for VPN on Demand.
-(BOOL)isConnectionRequired; // Identical DDG variant.
-(BOOL)connectionRequired; // Apple's routine.
// Dynamic, on demand connection?
-(BOOL)isConnectionOnDemand;
// Is user intervention required?
-(BOOL)isInterventionRequired;

-(NetworkStatus)currentReachabilityStatus;
-(SCNetworkReachabilityFlags)reachabilityFlags;
-(NSString*)currentReachabilityString;
-(NSString*)currentReachabilityFlags;




@end
