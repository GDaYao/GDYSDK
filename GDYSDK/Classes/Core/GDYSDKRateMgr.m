//  GDYSDKRateMgr.m
//  Pods
//
//  Created by  on 2022/3/15.
//  
//

#import "GDYSDKRateMgr.h"

#import <StoreKit/StoreKit.h>


@interface GDYSDKRateMgr () <SKStoreProductViewControllerDelegate>

@end


@implementation GDYSDKRateMgr


#pragma mark - app request view
+ (void)appRequestReviewWithAppId:(NSString *)appIdStr {
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
        NSString  * nsStringToOpen = [NSString  stringWithFormat: @"itms-apps://itunes.apple.com/app/id%@?action=write-review",appIdStr];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:nsStringToOpen]];
    }
}



/// 应用内加载产品页
/// @param appid 应用id
/// @param showRootVC present控制器
- (void)loadAppProductWithAppId:(NSString *)appid showRootVC:(UIViewController *)showRootVC {
    
    SKStoreProductViewController *storeProductVC = [[SKStoreProductViewController alloc]init];
    storeProductVC.delegate = self;
    [storeProductVC loadProductWithParameters:@{SKStoreProductParameterITunesItemIdentifier:appid} completionBlock:^(BOOL result, NSError * _Nullable error) {
        if (error) {
            // 可以再次加载好评方法
        }else{
            [showRootVC presentViewController:storeProductVC animated:YES completion:^{
                
            }];
        }
    }];
    
}

- (void)productViewControllerDidFinish:(SKStoreProductViewController *)viewController {
    

}




@end


