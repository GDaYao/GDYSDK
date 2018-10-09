
//
// 自定义UILabel初始化时使用

//function: 自定义UILabel,初始化并封装常用方法

#import <UIKit/UIKit.h>

@interface UILabel (CustomLabInit)

+ (UILabel *)InitLabWithBGColor:(NSString *)hexStr textColor:(UIColor *)txC fontName:(NSString *)fontName fontSize:(CGFloat)fontSize labText:(NSString *)labText txAlignment:(NSTextAlignment)txAlignment;

@end


