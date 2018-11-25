//
//  Constant.h

// define constant macro,then can import directly use.

#ifndef Constant_h
#define Constant_h


#define kUserDefaultsUse  [NSUserDefaults standardUserDefaults]

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kSetScreenBounds CGRectMake(0, 0, kScreenWidth, kScreenHeight)

#define kWindowTopView [UIApplication sharedApplication].keyWindow

#define kIsPhone [[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPhone
#define kIsiPhone5s  (kScreenWidth == 320.f && kScreenHeight == 568.f)
#define kIsiPhone7And8 (kScreenWidth == 375.f && kScreenHeight == 667.f) // <==>8
#define kIsiPhone7PAnd8P (kScreenWidth == 414.f && kScreenHeight == 736.f) // <==>8P
#define kIsiPhoneXSMaxAndXR  (kScreenWidth ==414.f  && kScreenHeight ==896.f)
#define kIsiPhoneXAndXS   (kScreenWidth == 375.f && kScreenHeight == 812.f)
#define kIsPad [[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPad

#define kScreenWidthScale [UIScreen mainScreen].bounds.size.width/375.0  //7屏幕适配宽度比例系数
#define kScreenHeightScale [UIScreen mainScreen].bounds.size.height/667.0 //7屏幕适配高度比例系数

#define kiOSVersionStartAvailable(x) @available(iOS x,*) // iOS x,以上及其版本使用

#define kStatusBarSizeH [[UIApplication sharedApplication] statusBarFrame].size.height
#define kNavBarH self.navigationController.navigationBar.size.height
#define kNavBarBottomLayoutDis [[UIApplication sharedApplication] statusBarFrame].size.height+self.navigationController.navigationBar.size.height

#ifdef DEBUG
#define NSLog(...)  NSLog(__VA_ARGS__)
#define MyLog(...)  NSLog(__VA_ARGS__)
#else
#define NSLog(...)
#define MyLog(...)
#endif



// memory

// self.extendedLayoutIncludesOpaqueBars = YES; //此解决UINavigationVC中出现UIScrollView导致下级的UIViewController也出现自动下移的情况(移动"状态栏+导航栏"的高度)
// self.automaticallyAdjustsScrollViewInsets = NO; // 此属性iOS 11.0之前可使用，在最新的iOS 12.0中未起作用。

/*
 // setAnimation - m1
 [UIView animateWithDuration:0.5 animations:^{
 self.contentSV.contentOffset = CGPointMake(0, tfOffset);
 } completion:^(BOOL finished) {
 }];
 // setAnimation - m2
 [UIView beginAnimations:@"ResizeKeyboard" context:nil];
 [UIView setAnimationDuration:0.5];
 // add set animation method
 [UIView commitAnimations];
 
 **/



#endif /* Constant_h */
