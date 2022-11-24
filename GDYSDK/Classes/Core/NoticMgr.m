//
//  NoticMgr.m


#import "NoticMgr.h"
#import <UserNotifications/UserNotifications.h>


@implementation NoticMgr


#pragma mark - 判断通知权限
+ (void)getLocalNoticAuthorizedWithCompleteBlock:(void(^)(BOOL getAuthorized) )completeBlock {
    
    if ( [[UIDevice currentDevice].systemVersion floatValue] >= 10.0) {
        if (@available(iOS 10.0, *)) {
            UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
            
            [center requestAuthorizationWithOptions:(UNAuthorizationOptionAlert | UNAuthorizationOptionBadge | UNAuthorizationOptionSound) completionHandler:^(BOOL granted, NSError * _Nullable error) {
                
                completeBlock(granted);
                
                if (granted) {
                    // 具体判断获取哪些通知类型:如状态栏、锁屏、声音开启等。
                    [center getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings * _Nonnull settings) {
                        if (settings.authorizationStatus == UNAuthorizationStatusAuthorized){
                            NSLog(@"log-被授权发送通知");
                        }else{
                            NSLog(@"log-未被授权发送通知");
                        }
                    }];
                }
            }];
        }
        
    } else if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0){
        
        if (@available(iOS 8.0, *)) {
            if ([[UIApplication sharedApplication] respondsToSelector:@selector(registerUserNotificationSettings:)]) {
                UIUserNotificationSettings* notificationSettings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound categories:nil];
                [[UIApplication sharedApplication] registerUserNotificationSettings:notificationSettings];
            } else {
                [[UIApplication sharedApplication] registerForRemoteNotificationTypes: (UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)];
            }
        }
    }
    
}

#pragma mark - ---- 'UNUserNotificationCenter' ----

#pragma mark send UNUser notic use 'UNUserNotificationCenter'
/*
 need import "#import <UserNotifications/UserNotifications.h>"
 */
+ (void)addAppNoticWithResourcePath:(NSString *)srcPath noticTitle:(NSString *)noticTitle noticSubtitle:(NSString *)subtitle noticBody:(NSString *)bodyStr noticTime:(NSTimeInterval)timeInterval{
    // ex:
    //  NSString *imageFile = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"jpg"];

    if (@available(iOS 10.0, *)) {
        UNMutableNotificationContent *noticeContent = [self packageUNUserNotificationCenterWithResourcePath:srcPath noticTitle:noticTitle noticSubtitle:subtitle noticBody:bodyStr];

        // *** if repeats is YES,then 'triggerWithTimeInterval' time interval value more than 60S ***
        UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:timeInterval repeats:NO];
        
        NSString *requestIdentifier = @"AppNoticIdentifier";
        UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:requestIdentifier content:noticeContent trigger:trigger];
        [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
            NSLog(@"UNUserNoti： %@", error);
        }];
    } else {
        // Fallback on earlier versions
    }
    
}


#pragma mark set specifilly 'int time'
+ (void)addAppNoticWithResourcePath:(NSString *)srcPath noticId:(NSString *)noticId noticTitle:(NSString *)noticTitle noticSubtitle:(NSString *)subtitle noticBody:(NSString *)bodyStr noticWeekday:(NSInteger)weekdayTime hour:(NSInteger)hourTime mintute:(int)minute {
    
    if (@available(iOS 10.0, *)) {
        UNMutableNotificationContent *noticeContent = [self packageUNUserNotificationCenterWithResourcePath:srcPath noticTitle:noticTitle noticSubtitle:subtitle noticBody:bodyStr];
        
        NSDateComponents *components = [[NSDateComponents alloc] init];
        components.weekday = weekdayTime;
        components.hour = hourTime;
        if(minute != 0){
            components.minute = minute;
        }
        
        UNCalendarNotificationTrigger *calendarTrigger = [UNCalendarNotificationTrigger triggerWithDateMatchingComponents:components repeats:YES];
        
        //NSString *requestIdentifier = [NSString stringWithFormat:@"weekendID-%ld",weekdayTime];
        
        UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:noticId content:noticeContent trigger:calendarTrigger];
        [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
            NSLog(@"notic-send error： %@", error);
        }];
    } else {
        // Fallback on earlier versions
    }
    
}


//  "UNUserNotificationCenter" package
+ (UNMutableNotificationContent *)packageUNUserNotificationCenterWithResourcePath:(NSString *)srcPath noticTitle:(NSString *)noticTitle noticSubtitle:(NSString *)subtitle noticBody:(NSString *)bodyStr  API_AVAILABLE(ios(10.0)){
    if (@available(iOS 10.0, *)) {
        UNMutableNotificationContent *noticeContent = [[UNMutableNotificationContent alloc] init];
        UNNotificationAttachment *imageAttachment = [UNNotificationAttachment attachmentWithIdentifier:@"imageAttachment" URL:[NSURL fileURLWithPath:srcPath] options:nil error:nil];
        noticeContent.attachments = @[imageAttachment];
        noticeContent.title = noticTitle;
        noticeContent.subtitle = subtitle;
        noticeContent.body = bodyStr;
        noticeContent.sound = [UNNotificationSound defaultSound];
        return noticeContent;
    } else {
        // Fallback on earlier versions
    }
    return nil;
}

// 获取已经添加的通知
- (void)getAleradyAddNotification {
    [[UNUserNotificationCenter currentNotificationCenter] getPendingNotificationRequestsWithCompletionHandler:^(NSArray<UNNotificationRequest *> * _Nonnull requests) {
        
        if (requests.count>0) {
        }
        
    }];
}


#pragma mark - 移除通知
// 根据 identifier 取消指定的通知
- (void)removeLocalNotification:(NSString*)identifier {
    if (@available(iOS 10.0, *)) {
        @try {
            UNUserNotificationCenter* center = [UNUserNotificationCenter currentNotificationCenter];
            [center removePendingNotificationRequestsWithIdentifiers:@[identifier]];
        } @catch (NSException *exception) {
            NSLog(@"log-remove notic catch");
        } @finally {
            
        }
    } else {
        // Fallback on earlier versions
    }
}
// 移除全部通知
- (void)cancelAllLocalNotification
{
    if (@available(iOS 10.0, *)) {
        UNUserNotificationCenter* center = [UNUserNotificationCenter currentNotificationCenter];
        [center removeAllDeliveredNotifications];
        [center removeAllPendingNotificationRequests];
    } else {
        // Fallback on earlier versions
    }
}



#pragma mark - UILocalNotification notic
+ (void)addLocalNotificationWithNoticTitle:(NSString *)title noticBody:(NSString *)bodyStr compDay:(NSInteger)day compHour:(NSInteger)hour compMinute:(NSInteger)minute compSecond:(NSInteger)second {
    
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    NSDateComponents *dateComponents = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay|NSCalendarUnitWeekday fromDate:[NSDate date]];
    dateComponents.day = day;
    dateComponents.hour = hour;
    dateComponents.minute = 0;
    dateComponents.second = 0;
    NSDate *fireDate = [calendar dateFromComponents:dateComponents];
    // ULocalNotification
    UILocalNotification *notification=[[UILocalNotification alloc]init];
    notification.fireDate = fireDate;
    //notification.repeatInterval = NSCalendarUnitWeekOfYear;
    notification.timeZone = [NSTimeZone defaultTimeZone];
    notification.repeatCalendar = [NSCalendar currentCalendar];
    notification.alertBody = bodyStr;
    if (@available(iOS 8.2, *)) {
        notification.alertTitle = title;
    } else {
     // earlier version
    }
    notification.applicationIconBadgeNumber = 1;
    notification.alertAction= @"Open";
    notification.hasAction = YES;
    notification.alertLaunchImage = @"Default";
    notification.soundName = UILocalNotificationDefaultSoundName;
    notification.userInfo = @{@"localNoticKey":@"localNoticValue"};
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
}


#pragma mark - cancel all 'UILocalNotification'
+ (void)cancelLocalNotic{
    [[UIApplication sharedApplication]cancelAllLocalNotifications];
}

#pragma mark - cancel specifilly "UILocalNotification"
+ (void)cancelSpecifiedWithLocalNoticKey:(NSString *)localNoticStr{
    UIApplication *app = [UIApplication sharedApplication];
    NSArray *eventArray = [app scheduledLocalNotifications];
    for (int i=0; i<[eventArray count]; i++){
        UILocalNotification* oneEvent = [eventArray objectAtIndex:i];
        NSDictionary *userInfoCurrent = oneEvent.userInfo;
        NSString *uid = [NSString stringWithFormat:@"%@",[userInfoCurrent valueForKey:localNoticStr]];
        if ([uid isEqualToString:localNoticStr])
        {
            //Cancelling local notification
            [app cancelLocalNotification:oneEvent];
            break;
        }
    }
}




@end




