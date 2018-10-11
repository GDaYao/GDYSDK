//
//  ToolM.h


// save all others tool method class


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ToolM : NSObject

/**
 app update alert function
 
 @param currentVC Use UIViewController Class to show `UIAlertAction`
 @param appID App only id
 */
+ (void)updateApp:(UIViewController *)currentVC appID:(NSInteger)appID;

/**
 judge current time this user new or older.

 @param isNewUserKey `NSUserDefaults` bool for key
 */
+ (void)newOrOldUsersWithuUserDefault:(NSString *)isNewUserKey;


/**
 parse Bundle json file and return `NSDictionary`

 @param jsonName Json form file
 @return `NSDictionay *`
 */
+ (NSDictionary *)parseBundleJsonWith:(NSString *)jsonName;


#pragma mark - time
// get time string from int time
+ (NSString *)getHourMintueSecondStringFromIntTime:(NSInteger)integerTime;
// get timestamp
+ (long)currentTimestamp;
// get formatter time string
+ (NSString *)getCurrentTimeFormatterString;
// get date components for day/hour/minue/second ...
+ (NSDateComponents *)getDateComponents;
//  calculate week date each day  -- para:NSDate*
+ (NSString *)calculateWeek:(NSDate *)date;
// NSDate is "yesday"/"today"/"tomorrow"
+ (NSString *)compareDate:(NSDate *)date;


#pragma mark - get language
+(NSString *)getLanguageCode;

#pragma mark - md5 encryption lock
/**
 md5 lock

 @param str Need encryption NSString
 @return new generate NSString
 */
+ (nonnull NSString *)md5:(nonnull NSString *)str;

#pragma mark - judge machine type
+ (NSString*)judgeiOSType;




@end


