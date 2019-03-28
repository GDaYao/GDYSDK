//
//  SubclassTableView.h

// func: realized `UITableView` subclass

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NSInteger(^numberSections)(UITableView *tableView);
typedef NSInteger(^numberRows)(UITableView *tableView,NSInteger section);
typedef CGFloat(^heightRow)(UITableView *tableView,NSIndexPath *indexPath);
typedef CGFloat(^heightFooterInSection)(UITableView *tableView, NSInteger section);
typedef UIView*(^viewFooterInSection)(UITableView *tableView,NSInteger section);
typedef UITableViewCell*(^cellForRow)(UITableView *tableView,NSIndexPath *indexPath);
typedef void(^didSelect)(UITableView *tableView,NSIndexPath *indexPath);

@interface SubclassTableView : UITableView <UITableViewDelegate,UITableViewDataSource>

- (void)InitTVWithBGColor:(UIColor *)BGColor registerTableViewCell:(UITableViewCell *)tableViewCell tableViewCellID:(NSString *)kCellIdentifier showVerticalSI:(BOOL)showV showHorizontalSI:(BOOL)showH separatorStyle:(UITableViewCellSeparatorStyle)separatorStyle;

@property (nonatomic,copy)numberSections numberSections;
@property (nonatomic,copy)numberRows numberRows;
@property (nonatomic,copy)heightRow heightRow;
@property (nonatomic,copy)heightFooterInSection heightFooterInSection;
@property (nonatomic,copy)viewFooterInSection viewFooterInSection;
@property (nonatomic,copy)cellForRow cellForRow;
@property (nonatomic,copy)didSelect didSelect;
@end

NS_ASSUME_NONNULL_END

