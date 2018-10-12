//
//  Constant.h

// define constant macro,then can import directly use.

#ifndef Constant_h
#define Constant_h


#define kUserDefaultsUse  [NSUserDefaults standardUserDefaults]

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenBounds [UIScreen mainScreen].bounds;

#define kWindowTopView [UIApplication sharedApplication].keyWindow

#define kCompareEqualRect(rect1,rect2) CGRectEqualToRect(rect1, rect2) // parameter rect2 can use CGRectZero.


#define kIsPhone [[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPhone
#define kIsiPhone5s  (kScreenWidth == 320.f && kScreenHeight == 568.f)
#define kIsiPhone7 (kScreenWidth == 375.f && kScreenHeight == 667.f) // <==>8
#define kIsiPhone7P (kScreenWidth == 414.f && kScreenHeight == 736.f) // <==>8P
#define kIsiPhoneXSMaxAndXR  (kScreenWidth ==414.f  && kScreenHeight ==896.f)
#define kIsiPhoneXAndXS   (kScreenWidth == 375.f && kScreenHeight == 812.f)
#define kIsPad [[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPad

#define kScreenWidthScale [UIScreen mainScreen].bounds.size.width/375.0  // base iPhone 7 screen size
#define kScreenHeightScale [UIScreen mainScreen].bounds.size.height/667.0 // base iPhone 7 screen size


#ifdef DEBUG
#define NSLog(...)  NSLog(__VA_ARGS__)
#define MyLog(...)  NSLog(__VA_ARGS__)
#else
#define NSLog(...)
#define MyLog(...)
#endif



#endif /* Constant_h */
