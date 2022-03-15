//  GDYSDKRateMgr.h
//  Pods
//
//  Created by  on 2022/3/15.
//  
//

/**     func: 好评管理类方法
 *
 */


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GDYSDKRateMgr : NSObject

#pragma mark - app request review
/**
 好评方法掉调用使用
 
 @param appIdStr app-id应用id，用于低版本下好评跳转
 */
+ (void)appRequestReviewWithAppId:(NSString *)appIdStr;


/// 应用内加载产品页
/// @param appid 应用id
/// @param showRootVC present控制器
- (void)loadAppProductWithAppId:(NSString *)appid showRootVC:(UIViewController *)showRootVC;

@end

NS_ASSUME_NONNULL_END
