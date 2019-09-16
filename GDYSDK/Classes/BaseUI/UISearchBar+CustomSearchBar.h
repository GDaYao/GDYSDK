//
//  UISearchBar+CustomSearchBar.h

// func: custom search bar

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UISearchBar (CustomSearchBar)



/**
 customize UISearchBar

 @param barTintColor 搜索框外框的覆盖层颜色
 @param tintColor 改变所有按钮（光标）颜色
 @param isShow 是否展示搜索结果按钮
 @param searchBarStyle 搜索框风格
 @param placeholderColor 占位文字颜色 -- 可自定义UITextField代替
 @param placeholderText 占位文字 -- 可自定义UITextField代替
 @param borderColor 边框颜色 -- 可自定义UITextField代替
 @return 返回自定义的UISearchBar
 */
+ (UISearchBar *)InitSearchBarWithBarTint:(UIColor *)barTintColor tintColor:(UIColor *)tintColor showSearchResultsBtn:(BOOL)isShow searchBarStyle:(UISearchBarStyle)searchBarStyle setPlaceholder:(UIColor *)placeholderColor placeholder:(NSString *)placeholderText borderColor:(UIColor *)borderColor;

@end

NS_ASSUME_NONNULL_END
