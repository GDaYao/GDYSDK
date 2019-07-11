//
//  UITableView+CustomTV.h


/** func: `UITableView` category -- UITableView 类别
 *  `UITableView` 便捷使用方法 -- 请见 <SubClassTableView.h/.m>
 *  类别只是用于增加某个类的方法，不能继承实现某个类作为父类方法。
 */


#import <UIKit/UIKit.h>



@interface UITableView (CustomTV)

/**
 directly import this custom class,start init with arguments.

 @param BGColor UIColor object.
 @param TVFrame Set `UITableView` frame.Also you can set CGRectZero and use Masonry layout.
 @param tableViewCell Custom new create xxx.nib/xxx.xib subclass of UITableViewCell.
 @param kCellIdentifier Set `UITableViewCell` identifier.
 @param showV Need show vertical scroll indicator.
 @param showH Need show horizontal scroll indicator.
 @param separatorStyle UITableView separactor style.
 @param delegateVC Set UITableView delegate.
 @return Back UITableView object.
 */
+ (UITableView *)InitTVWithBGColor:(UIColor *)BGColor TVFrame:(CGRect)TVFrame registerTableViewCell:(UITableViewCell *)tableViewCell tableViewCellID:(NSString *)kCellIdentifier showVerticalSI:(BOOL)showV showHorizontalSI:(BOOL)showH separatorStyle:(UITableViewCellSeparatorStyle)separatorStyle TVDelegateVC:(id)delegateVC;


@end


