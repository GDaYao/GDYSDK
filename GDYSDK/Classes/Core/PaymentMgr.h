//
//  PaymentMgr.h

// func: In-App payment method


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PaymentMgr : NSObject

#pragma mark - app request review
+ (void)appRequestReview;
+ (void)appRequestReviewWithAppId:(NSString *)appIdStr;


#pragma mark - In-App purchase






@end




NS_ASSUME_NONNULL_END
