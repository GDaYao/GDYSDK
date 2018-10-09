//
//  UITabBar+CustomCircleBar.h

//function: 自定义UITabBar tabBar处理方法

/*
 * UITabController底部每个UITabBar对上右上方加入红色提示点
 */

#import <UIKit/UIKit.h>

@interface UITabBar (CustomCircleBar)


- (void)showBadgeIndex:(NSInteger)index;
// 隐藏小红点
- (void)hideBadgeIndex:(NSInteger)index;


@end
