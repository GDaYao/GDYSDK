//  GDYSDKSubTableView.h



/** func: realized `UITableView` subclass
 *  `UITableView` class method used.
 *
 *  由于扩展中不能使用扩展类“属性”，所以只能使用继承实现我们所需要的效果，可实现多个block回调实现。
 */

/** Usage:
 1. first to import class. #import "GDYSDKSubTableView.h"
 
 2. start relaized.
 >>>>
     GDYSDKSubTableView *subTV = [[GDYSDKSubTableView alloc]initWithFrame:<#set UITableView frame#> style:UITableViewStyleGrouped]; // UITableViewStylePlain
     [self.view addSubview:subTV];
     UITableViewCell *tableViewCell = [UITableViewCell new];
     [subTV InitTVWithBGColor:<#BGColor#> registerTableViewCell:tableViewCell tableViewCellID:<#UITabelViewCellId#> showVerticalSI:<#YES/NO#> showHorizontalSI:<#YES/NO#> separatorStyle:UITableViewCellSeparatorStyleNone];
 >>>>
    // you can't use Masonry to layout view!!!!
 >>>>
    // 把section-0和顶部距离置0.
    subTV.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0.0f,0.0f,self.bounds.size.width,0.01f)];
 >>>>
    // use weak reference.
     __weak typeof(self) weakSelf = self;
     // start to call some iOS-block to relized.
 >>>>
     // cellFroRow -- useage:
     CustomizeCell *tableViewCell = (CustomizeCell *)[tableView dequeueReusableCellWithIdentifier:<#equal to last set cell id#>];
     if (tableViewCell == nil) {
     tableViewCell = [[CustomizeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:<#equal to last set cell id#>];
     }
     // start use `cell`
 >>>>
     // did select row -- useage:
    // 可取消 - select 点击效果
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
 >>>>
     // also you want to observer scroll,you can relized `UIScollView` delegate-block.
 
 */



#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GDYSDKSubTableView : UITableView <UITableViewDelegate,UITableViewDataSource>


@property(nonatomic,copy) NSInteger(^numberSections)(UITableView *tableView);
@property(nonatomic,copy) NSInteger(^numberRows)(UITableView *tableView,NSInteger section);
//
@property(nonatomic,copy) CGFloat(^heightRow)(UITableView *tableView,NSIndexPath *indexPath);
@property(nonatomic,copy) CGFloat(^heightHeaderInSection)(UITableView *tableView, NSInteger section);

@property(nonatomic,copy) UIView*_Nullable(^viewHeaderInSection)(UITableView *tableView, NSInteger section);
@property(nonatomic,copy) CGFloat(^heightFooterInSection)(UITableView *tableView, NSInteger section);
@property(nonatomic,copy) UIView*_Nullable(^viewFooterInSection)(UITableView *tableView,NSInteger section);
//
@property(nonatomic,copy) UITableViewCell*_Nullable(^cellForRow)(UITableView *tableView,NSIndexPath *indexPath);
@property(nonatomic,copy) void(^willDisplayCellBlock)(UITableView *tableView,UITableViewCell *cell,NSIndexPath *indexPath);
@property(nonatomic,copy) void(^didSelectInTV)(UITableView *tableView,NSIndexPath *indexPath);
@property (nonatomic,copy) void(^cellDeleteInTVInGDYSDK)(UITableView *tableView,NSIndexPath *indexPath);
// scrollView delegate
@property(nonatomic,copy) void(^scrollViewWillBeginDraggingInTV)(UIScrollView *scrollView);
@property(nonatomic,copy) void(^scrollViewDidScrollToTopInTV)(UIScrollView *scrollView);
@property(nonatomic,copy) void(^scrollViewDidScrollInTV)(UIScrollView *scrollView);



// TODO: initilize method
- (void)InitTVWithBGColor:(UIColor *)BGColor registerTableViewCell:(UITableViewCell *)tableViewCell tableViewCellID:(NSString *)kCellIdentifier showVerticalSI:(BOOL)showV showHorizontalSI:(BOOL)showH separatorStyle:(UITableViewCellSeparatorStyle)separatorStyle;



@end

NS_ASSUME_NONNULL_END
