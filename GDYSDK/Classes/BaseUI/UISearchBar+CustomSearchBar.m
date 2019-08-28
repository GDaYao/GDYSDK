//
//  UISearchBar+CustomSearchBar.m


#import "UISearchBar+CustomSearchBar.h"

@implementation UISearchBar (CustomSearchBar)

#pragma mark - init searcha bar
+ (UISearchBar *)InitSearchBarWithBarTint:(UIColor *)barTintColor tintColor:(UIColor *)tintColor showSearchResultsBtn:(BOOL)isShow searchBarStyle:(UISearchBarStyle)searchBarStyle setPlaceholder:(UIColor *)placeholderColor placeholder:(NSString *)placeholderText borderColor:(UIColor *)borderColor {
    UISearchBar *searchBar = [[UISearchBar alloc]init];
    if (barTintColor) {
        searchBar.barTintColor = barTintColor;      // 设置搜索框外框覆盖层颜色
    }
    if (tintColor) {
        searchBar.tintColor = [UIColor blackColor];     // 改变所有按钮(光标)颜色
    }
    // 展示搜索结果的按钮
    if (isShow) {
        searchBar.showsSearchResultsButton = isShow;
    }
    if (searchBarStyle) {
        searchBar.searchBarStyle = searchBarStyle;     // UISearchBarStyleDefault
    }
    // 使用UITextFiled代替搜索框
    UITextField *searchField=[searchBar valueForKey:@"_searchField"];
    searchField.backgroundColor = placeholderColor;
    [searchField setValue:placeholderColor forKeyPath:@"_placeholderLabel.textColor"];
    searchField.placeholder = placeholderText;
    // set extent border width/color
    searchBar.layer.borderWidth = 1.0f;
    searchBar.layer.borderColor = borderColor.CGColor;
    //    UIButton *clearButton = [searchField valueForKey:@"_clearButton"];
    //    [clearButton addTarget:self action:@selector(tapClearButton:) forControlEvents:UIControlEventTouchUpInside|UIControlEventTouchDown];
    
    return searchBar;
}

#pragma mark - delegate use





@end
