////  UIColor+GDYSDKHex.h
//  GDYSDK
//
/** func:  自定义UIColor色值转换方法
 *  16进制色值使用.
 *  RGB色值总和计算.
 *  UIColor->NSString.
 *  UIColor->gray color(int value).
 *  generate random color.
 *  gradient color.
 */


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (GDYSDKHex)

#pragma mark - hex string convert to color object
+ (UIColor *) colorWithHexString: (NSString *)hexString;

#pragma mark - color string  covert to 'R+G+B' int sum
+ (int)RGBSumWithHexString:(NSString *)hexString;

#pragma  mark -  UIColor covert to hex string
+ (NSString *) hexFromUIColor: (UIColor*) color;

#pragma mark - from current color to gray color
+ (int)RGBAddValueWithHextString:(NSString *)hexString colorFloat:(float)colorValue scale:(float)scale operateType:(int)type;

#pragma mark - color object covert to NSString object
- (NSString*)hexString;

#pragma mark - generate random color
+ (UIColor *) randomColor;


#pragma mark - gradient color--渐变色生成
+ (CAGradientLayer *)setGradualChangingColor:(CGRect)gradientLayerFrame fromColor:(NSString *)fromHexColorStr toColor:(NSString *)toHexColorStr;



@end

NS_ASSUME_NONNULL_END
