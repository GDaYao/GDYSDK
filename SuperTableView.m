//
//  SuperTableView.m



#import "SuperTableView.h"

static NSString *  const kDefaultCellIdentifier = @"tableViewCellIdentifier";

@implementation SuperTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
    }
    return self;
}


#pragma mark - init UITableView property
- (void)InitTVWithBGColor:(UIColor *)BGColor registerTableViewCell:(UITableViewCell *)tableViewCell tableViewCellID:(NSString *)kCellIdentifier showVerticalSI:(BOOL)showV showHorizontalSI:(BOOL)showH separatorStyle:(UITableViewCellSeparatorStyle)separatorStyle{
    self.backgroundColor = BGColor;
    // register cell class
    if ((kCellIdentifier==nil) || (kCellIdentifier.length == 0)) {
        [self registerClass:[tableViewCell class] forCellReuseIdentifier:kDefaultCellIdentifier];
    }else{
        [self registerClass:[tableViewCell class] forCellReuseIdentifier:kCellIdentifier];
    }
    self.showsVerticalScrollIndicator = showV;
    self.showsHorizontalScrollIndicator = showH;
    self.separatorStyle = separatorStyle; // 去除cell底部横线
    self.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero]; // 去除多余横线
    self.delegate = self;
    self.dataSource = self;
}

#pragma mark - initlize tableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSInteger testInt = self.numberSections(tableView);
    return testInt;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.numberRows(tableView,section);
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.heightRow(tableView,indexPath);
}

#pragma mark - header and footer view
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(self.heightHeaderInSection){
        return self.heightHeaderInSection(tableView,section);
    }
    return 0;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (self.viewHeaderInSection) {
        return self.viewHeaderInSection(tableView,section);
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if(self.heightFooterInSection){
        return self.heightFooterInSection(tableView,section);
    }
    return 0;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (self.viewFooterInSection) {
        return self.viewFooterInSection(tableView,section);
    }
    return nil;
}


#pragma mark - cell for row
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.cellForRow(tableView,indexPath);
}

#pragma mark - did select row
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.didSelectInTV(tableView,indexPath);
}

#pragma mark - scrollView delegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    if (self.scrollViewWillBeginDraggingInTV) {
        self.scrollViewWillBeginDraggingInTV(scrollView);
    }
}
- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView {
    if (self.scrollViewDidScrollToTopInTV) {
        self.scrollViewDidScrollToTopInTV(scrollView);
    }
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.scrollViewDidScrollInTV) {
        self.scrollViewDidScrollInTV(scrollView);
    }
}


@end
