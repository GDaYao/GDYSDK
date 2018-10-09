//
//  UIView+Badge.h

// 需要根据文字的多少显示UI布局
// 有的只需要显示小红点-->无标题
// 有数字标题栏

#import <UIKit/UIKit.h>

@interface UIView (Badge)

// 设置角标并且配置各个数据
-(void)makeBadgeText:(NSString *)text
               textColor:(UIColor *)tColor
               backColor:(UIColor *)backColor
                    Font:(UIFont*)tfont;


//只设置小圆点
-(void)makeRedBadge:(CGFloat)corner color:(UIColor *)cornerColor;

-(void)removeBadgeView;

@end
