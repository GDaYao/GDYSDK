//
//  SuperTableView.h

// func: super UITableView

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


typedef NSInteger(^numberSections)(UITableView *tableView);
typedef NSInteger(^numberRows)(UITableView *tableView,NSInteger section);
typedef CGFloat(^heightRow)(UITableView *tableView,NSIndexPath *indexPath);
typedef CGFloat(^heightHeaderInSection)(UITableView *tableView, NSInteger section);
typedef UIView*_Nullable(^viewHeaderInSection)(UITableView *tableView, NSInteger section);
typedef CGFloat(^heightFooterInSection)(UITableView *tableView, NSInteger section);
typedef UIView*_Nullable(^viewFooterInSection)(UITableView *tableView,NSInteger section);
typedef UITableViewCell*_Nullable(^cellForRow)(UITableView *tableView,NSIndexPath *indexPath);
typedef void(^didSelectInTV)(UITableView *tableView,NSIndexPath *indexPath);
// scrollView delegate
typedef void(^scrollViewWillBeginDraggingInTV)(UIScrollView *scrollView);
typedef void(^scrollViewDidScrollToTopInTV)(UIScrollView *scrollView);
typedef void(^scrollViewDidScrollInTV)(UIScrollView *scrollView);


@interface SuperTableView : UITableView <UITableViewDelegate,UITableViewDataSource>

- (void)InitTVWithBGColor:(UIColor *)BGColor registerTableViewCell:(UITableViewCell *)tableViewCell tableViewCellID:(NSString *)kCellIdentifier showVerticalSI:(BOOL)showV showHorizontalSI:(BOOL)showH separatorStyle:(UITableViewCellSeparatorStyle)separatorStyle;

@property (nonatomic,copy)numberSections numberSections;
@property (nonatomic,copy)numberRows numberRows;
@property (nonatomic,copy)heightRow heightRow;
@property (nonatomic,copy)heightHeaderInSection heightHeaderInSection;
@property (nonatomic,copy)viewHeaderInSection viewHeaderInSection;
@property (nonatomic,copy)heightFooterInSection heightFooterInSection;
@property (nonatomic,copy)viewFooterInSection viewFooterInSection;
@property (nonatomic,copy)cellForRow cellForRow;
@property (nonatomic,copy)didSelectInTV didSelectInTV;
// scrollView delegate
@property (nonatomic,copy)scrollViewDidScrollToTopInTV scrollViewDidScrollToTopInTV;
@property (nonatomic,copy) scrollViewWillBeginDraggingInTV scrollViewWillBeginDraggingInTV;
@property (nonatomic,copy)scrollViewDidScrollInTV scrollViewDidScrollInTV;


@end

NS_ASSUME_NONNULL_END
