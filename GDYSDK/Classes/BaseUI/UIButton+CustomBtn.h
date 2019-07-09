//
// custom UIButton and usually func


#import <UIKit/UIKit.h>

@interface UIButton (CustomBtn)

/**
 UIButton init method.

 @param imgStr background image name string.
 @param titleStr UIButton show title.
 @param titleColor UIButton title color.
 @param fontName UIButton title font name.
 @param isBold UIButton whether bold.
 @param sizeFont UIButton title font.
 @param bgColor UIButton background color.
 @return init completion UIButton.
 */
+ (UIButton *)initWithBGName:(NSString *)imgStr title:(NSString *)titleStr titleColor:(UIColor *)titleColor fontName:(NSString *)fontName isBold:(BOOL)isBold fontSize:(CGFloat)sizeFont btnBGColor:(UIColor *)bgColor;


@end


