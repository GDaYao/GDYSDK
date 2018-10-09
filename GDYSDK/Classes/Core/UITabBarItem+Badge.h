//
//  UITabBarItem+Badge.h

// func: UITabBarItem add badge

#import <UIKit/UIKit.h>

@interface UITabBarItem (Badge)

-(void)makeBadgeTextNum:(NSInteger )textNum
                  textColor:(UIColor *)tColor
                  backColor:(UIColor *)backColor
                       Font:(UIFont*)tfont;

-(void)makeRedBadge:(CGFloat)corner color:(UIColor *)cornerColor;


-(void)removeBadgeView;

@end
