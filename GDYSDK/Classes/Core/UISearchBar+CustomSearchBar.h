//
//  UISearchBar+CustomSearchBar.h

// func: custom search bar

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UISearchBar (CustomSearchBar)

+ (UISearchBar *)InitSearchBarWithBarTint:(UIColor *)barTintColor tintColor:(UIColor *)tintColor showSearchResultsBtn:(BOOL)isShow searchBarStyle:(UISearchBarStyle)searchBarStyle setPlaceholder:(UIColor *)placeholderColor placeholder:(NSString *)placeholderText borderColor:(UIColor *)borderColor;

@end

NS_ASSUME_NONNULL_END
