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
#define kIsiPhone6A6sA7A8 (kScreenWidth == 375.f && kScreenHeight == 667.f)
#define kIsiPhone6PA6sPA7PA8P (kScreenWidth == 414.f && kScreenHeight == 736.f)
#define kIsiPhoneXSMaxAndXR  (kScreenWidth ==414.f  && kScreenHeight ==896.f)
#define kIsiPhoneXAndXS   (kScreenWidth == 375.f && kScreenHeight == 812.f)
#define kIsPad [[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPad
#define kIsiPhoneXOver (kScreenWidth >= 375.f && kScreenHeight >=812.f)

#define kScreenWidthScale [UIScreen mainScreen].bounds.size.width/375.0  //7屏幕适配宽度比例系数
#define kScreenHeightScale [UIScreen mainScreen].bounds.size.height/667.0 //7屏幕适配高度比例系数

#define kiOSVersionStartAvailable(x) @available(iOS x,*) // iOS x,以上及其版本使用


#define kVCViewBounds self.view.bounds
#define kVCViewBoundsWidth self.view.bounds.size.width
#define kVCViewBoundsHeight self.view.bounds.size.height
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kSetScreenBounds CGRectMake(0, 0, kScreenWidth, kScreenHeight)
#define kStatusBarSizeH [[UIApplication sharedApplication] statusBarFrame
#define kStatusBarSizeHNum (kIsiPhoneXOver ? 44.f : 20.f)
#define kNavBarH self.navigationController.navigationBar.bounds.size.height
#define kNavBarHNum 44.f
#define kNavBarBottomLayoutDis [[UIApplication sharedApplication]statusBarFrame].size.height+self.navigationController.navigationBar.bounds.size.height
#define kNavBarBottomLayoutDisNum (kIsiPhoneXOver ? 88.f : 64.f)
#define kTabBarHeightNum 49.f
#define kTabBarSafeBottomMargin       ( kIsiPhoneXOver ? 34.f : 0.f)
#define kTabBarAndSafeMarginNum (kIsiPhoneXOver ? (49.f+34.f) : 49.f)

// 可获得屏幕分辨率 screenSize.width*scale横向分辨率-screenSize.height*scale竖向分辨率
#define kScreenScale  [UIScreen mainScreen].scale;


/**  工程区分Debug和release,在 Build Settings 搜索,"Preprocessor Macros--> Debug-DEBUG=1(这里的DEBUG一定和判断对应)"
 `#ifdef DEBUG`不使用, `#if DEBUG`
 **/
#ifdef DEBUG
#define NSLog(...)  NSLog(__VA_ARGS__)
#define MyLog(...)  NSLog(__VA_ARGS__)
#else
#define NSLog(...)
#define MyLog(...)
#endif


/**
    区分模拟器和真机 -- TARGET_OS_IPHONE  此判断不会有效果.
    请使用 #if 判断不要使用 #ifdef 判断不准确.
 **/
#if TARGET_IPHONE_SIMULATOR
    // simulator
#elif
    // device
#endif

/*  判断是否有某个宏定义    */
#if defined(USE_SEGMENTED_MMAP)
#endif



#endif /* Constant_h */

