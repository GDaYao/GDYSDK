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
#define kIsiPhone7 (kScreenWidth == 375.f && kScreenHeight == 667.f) // <==>8
#define kIsiPhone7P (kScreenWidth == 414.f && kScreenHeight == 736.f) // <==>8P
#define kIsiPhoneXSMaxAndXR  (kScreenWidth ==414.f  && kScreenHeight ==896.f)
#define kIsiPhoneXAndXS   (kScreenWidth == 375.f && kScreenHeight == 812.f)
#define kIsPad [[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPad

#define kScreenWidthScale [UIScreen mainScreen].bounds.size.width/375.0  //7屏幕适配宽度比例系数
#define kScreenHeightScale [UIScreen mainScreen].bounds.size.height/667.0 //7屏幕适配高度比例系数


#ifdef DEBUG
#define NSLog(...)  NSLog(__VA_ARGS__)
#define MyLog(...)  NSLog(__VA_ARGS__)
#else
#define NSLog(...)
#define MyLog(...)
#endif



#endif /* Constant_h */
