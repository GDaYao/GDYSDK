//
//  ProgressMgr.h


/** func: 进度加载框 --
  `MBProgressHUD`+`SVPregressHUD` 使用 用法。
 *
 */


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProgressMgr : NSObject

#pragma mark - MBProgressHUD 使用

// TODO:MBProgressHUD直接加载使用+remove
/*
+ (void)showHUDForView:(UIView *)currentView animated:(BOOL)isAnimated {
    [MBProgressHUD showHUDAddedTo:currentView animated:isAnimated];
}
 */
/*
+ (void)hiddenHUDForView:(UIView *)currentView animated:(BOOL)isAnimated {
    [MBProgressHUD hideHUDForView:currentView animated:isAnimated];
}
 */

/** Useage:  TODO:黑色菊花转
 dispatch_async(dispatch_get_main_queue(), ^{
 [ToolMgr showHUDBlackStyleForView:[UIApplication sharedApplication].keyWindow animated:YES];
 [ToolMgr hiddenHUDForView:[UIApplication sharedApplication].keyWindow animated:YES];
 });

 黑色菊花钻 - 无背景蒙层 - 旋转图标
 
 @param currentView 添加的视图层
 @param isAnimated 是否展示动画
 + (void)showHUDBlackStyleForView:(UIView *)currentView animated:(BOOL)isAnimated {
 
 MBProgressHUD *hud =  [[MBProgressHUD alloc] initWithView:currentView];
 hud.bezelView.style =  MBProgressHUDBackgroundStyleSolidColor;
 hud.bezelView.backgroundColor = [UIColor clearColor];
 // 隐藏时候从父控件中移除
 hud.removeFromSuperViewOnHide = YES;
 hud.userInteractionEnabled = YES; // 用户交互关闭|打开
 [currentView addSubview:hud];
 [hud showAnimated:isAnimated];
 }
 */


/* TODO: 给予提示2s后消失
+ (void)showHint:(NSString *)hintStr {
//显示提示信息
UIView *view = [[UIApplication sharedApplication].delegate window];
MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
hud.userInteractionEnabled = NO;
// Configure for text only and offset down
hud.mode = MBProgressHUDModeText;
    hud.labelText = hintStr;
    hud.margin = 10.f;
    //    hud.yOffset = -180;
    hud.yOffset = 0; // 距离y轴中间偏移距离
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:3.f];
}
*/

/* 保存完成动画
+ (void)showCompletionInMBProgressHUD:(NSString *)hintStr {
    
    UIView *view = [[UIApplication sharedApplication].delegate window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
// Set the custom view mode to show any view.
    hud.mode = MBProgressHUDModeCustomView;
    // Set an image view with a checkmark.
    UIImage *image = [[UIImage imageNamed:@"Checkmark"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    hud.customView = [[UIImageView alloc] initWithImage:image];
    // Looks a bit nicer if we make it square.
    hud.square = YES;
    // Optional label text.
    hud.label.text = hintStr;
 
    [hud hideAnimated:YES afterDelay:3.f];
}
*/

#pragma mark - SVProgressHUD

/* TODO: SVProgressHUD直接使用
+ (void)showLoadingUseSVProgress {
    [SVProgressHUD show];
}
+ (void)showLoadingUseSVProgressWithStatus:(NSString *)statusStr {
    [SVProgressHUD showWithStatus:statusStr];
}
*/

/* TODO: 进度展示--可多次调用
+ (void)showLoadingPrgoressUseSVProgressWithFloat:(float)progressFloat {
    [SVProgressHUD showProgress:progressFloat];
}
+ (void)showLoadingPrgoressUseSVProgressWithFloat:(float)progressFloat status:(NSString *)statusStr {
    [SVProgressHUD showProgress:progressFloat status:statusStr];
}
*/
 
/*
 //   TODO: 加载完成动画
 + (void)showCompletionInSVProgresssWithHint:(NSString *)hintStr {
 
 dispatch_async(dispatch_get_main_queue(), ^{
 [SVProgressHUD setMinimumDismissTimeInterval:3.0];
 [SVProgressHUD setMaximumDismissTimeInterval:3.0];
 
 [SVProgressHUD showSuccessWithStatus:hintStr ];
 });
 }
 */

/* TODO: hidden SVProgressHUD
 + (void)hiddenLoadingUseSVProgress {
 dispatch_async(dispatch_get_main_queue(), ^{
 [SVProgressHUD dismiss];
 });
 }
 */
/* TODo: delay hidden SVProgressHUD
 + (void)hiddenLoadingUseSVProgressWithDelay:(NSTimeInterval)delay {
 dispatch_async(dispatch_get_main_queue(), ^{
 [SVProgressHUD dismissWithDelay:delay];
 });
 }
*/




@end

NS_ASSUME_NONNULL_END
