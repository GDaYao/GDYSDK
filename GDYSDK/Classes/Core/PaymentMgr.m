//
//  PaymentMgr.m


#import "PaymentMgr.h"

#import <StoreKit/StoreKit.h>

@implementation PaymentMgr

#pragma mark - app request review-- good price
+ (void)appRequestReview{
    if (@available(iOS 10.3,*)) {
        [SKStoreReviewController requestReview];
    }
}
// with appId for case
+ (void)appRequestReviewWithAppId:(NSString *)appIdStr {
    // this method invalid.
    //#import <StoreKit/StoreKit.h>
    
    // `SKStoreReviewController` in iOS 10.3 use.
    if (@available(iOS 10.3, *))
    {
        //iOS 10.3 以上支持
        if([SKStoreReviewController respondsToSelector:@selector(requestReview)])
        {
            [SKStoreReviewController requestReview];
        }
    }
    else
    {
        // iOS 10.3 之前的使用这个
        NSString  * nsStringToOpen = [NSString  stringWithFormat: @"itms-apps://itunes.apple.com/app/id%@?action=write-review",appIdStr];//替换为对应的APPID
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:nsStringToOpen]];
    }
}


#pragma mark - In-App purchase







@end





