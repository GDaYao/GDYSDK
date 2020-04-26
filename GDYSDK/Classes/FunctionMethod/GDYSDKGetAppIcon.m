////  GDYSDKGetAppIcon.m
//  GDYSDK
//
//  Created on 2020/4/26.
//  
//

#import "GDYSDKGetAppIcon.h"

@implementation GDYSDKGetAppIcon


#pragma mark - 获取应用icon
+ (UIImage *)getAppIconBackImg {
    NSDictionary *infoPlist = [[NSBundle mainBundle] infoDictionary];
    NSString *icon = [[infoPlist valueForKeyPath:@"CFBundleIcons.CFBundlePrimaryIcon.CFBundleIconFiles"] lastObject];
    UIImage *iconImg = [UIImage imageNamed:icon];
    return iconImg;
}






@end
