//
//  NoticMgr.h

// func: manager or create app notic(two method)
/**
 *  notic manager class only show add notic(通知) method.
 *  so this isn't register notic and trigger notic action.(所以这里没有给出在AppDelegate class中注册通知的方法并且没有通知触发后的相应行为方法)
 */


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@interface NoticMgr : NSObject

#pragma mark - 判断通知权限
+ (void)getLocalNoticAuthorizedWithCompleteBlock:(void(^)(BOOL getAuthorized) )completeBlock;

#pragma mark - ---- 'UNUserNotificationCenter' ----
#pragma mark send UNUser notic use 'UNUserNotificationCenter'
+ (void)addAppNoticWithResourcePath:(NSString *)srcPath noticTitle:(NSString *)noticTitle noticSubtitle:(NSString *)subtitle noticBody:(NSString *)bodyStr noticTime:(NSTimeInterval)timeInterval;

#pragma mark set specifilly 'int time'
+ (void)addAppNoticWithResourcePath:(NSString *)srcPath noticId:(NSString *)noticId noticTitle:(NSString *)noticTitle noticSubtitle:(NSString *)subtitle noticBody:(NSString *)bodyStr noticWeekday:(NSInteger)weekdayTime hour:(NSInteger)hourTime mintute:(int)minute;

// 根据 identifier 取消指定的通知
- (void)removeLocalNotification:(NSString*)identifier;
// 移除全部通知
- (void)cancelAllLocalNotification;


#pragma mark - ---- `UILocalNotification notic` ----
+ (void)addLocalNotificationWithNoticTitle:(NSString *)title noticBody:(NSString *)bodyStr compDay:(NSInteger)day compHour:(NSInteger)hour compMinute:(NSInteger)minute compSecond:(NSInteger)second;

#pragma mark - cancel all 'UILocalNotification'
+ (void)cancelLocalNotic;
#pragma mark - cancel specifilly "UILocalNotification"
+ (void)cancelSpecifiedWithLocalNoticKey:(NSString *)localNoticStr;




@end

NS_ASSUME_NONNULL_END
