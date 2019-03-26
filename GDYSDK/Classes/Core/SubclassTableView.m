//
//  SubclassTableView.m


#import "SubclassTableView.h"

static NSString *  const kDefaultCellIdentifier = @"tableViewCellIdentifier";

@implementation SubclassTableView

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
    self.separatorStyle = separatorStyle;
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
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return self.heightFooterInSection(tableView,section);
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return self.viewFooterInSection(tableView,section);
}


#pragma mark - cell for row
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.cellForRow(tableView,indexPath);
}



#pragma mark - did select row
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.didSelect(tableView,indexPath);
}



@end
