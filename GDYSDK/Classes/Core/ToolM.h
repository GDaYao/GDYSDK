//
//  ToolM.h


// save all others tool method class


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ToolM : NSObject

#pragma mark - use app update
+ (void)updateApp:(UIViewController *)currentVC appID:(NSInteger)appID;

#pragma mark - new or old users
+ (void)newOrOldUsers;

#pragma mark - parse Bundle json form parameter json name
+ (NSDictionary *)parseBundleJsonWith:(NSString *)jsonName;

#pragma mark - get iOS-App some file path
+ (NSString *)getDocumentFilePath;
+ (NSString *)getLibraryFilPath;
+ (NSString *)getCacheFilePath;


#pragma mark - time 
// get time string from int time
+ (NSString *)getHourMintueSecondStringFromIntTime:(NSInteger)integerTime;
// get timestamp
+ (long)currentTimestamp;
// get formatter time string
+ (NSString *)getCurrentTimeFormatterString;
// calculate week date each day
+ (NSString *)getWeekday:(NSDate *)date;
// NSDate is "yesday"/"today"/"tomorrow"
+ (NSString *)compareDate:(NSDate *)date;

#pragma mark - get language
+(NSString *)getLanguageCode;

#pragma mark - md5 encryption lock
+ (nonnull NSString *)md5:(nonnull NSString *)str;

#pragma mark - judge machine type
+ (NSString*)judgeiOSType;







@end


