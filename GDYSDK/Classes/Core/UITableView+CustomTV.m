//
//  UITableView+CustomTV.m



#import "UITableView+CustomTV.h"


static NSString * const kDefaultCellIdentifier = @"tableViewCellIdentifier";

@implementation UITableView (CustomTV)


#pragma mark - init `UITableView`
+ (UITableView *)InitTVWithBGColor:(UIColor *)BGColor TVFrame:(CGRect)TVFrame registerTableViewCell:(UITableViewCell *)tableViewCell tableViewCellID:(NSString *)kCellIdentifier showVerticalSI:(BOOL)showV showHorizontalSI:(BOOL)showH separatorStyle:(UITableViewCellSeparatorStyle)separatorStyle TVDelegateVC:(id)delegateVC{
    
    UITableView *mainTV  = [[UITableView alloc]initWithFrame:TVFrame style:UITableViewStyleGrouped];
    mainTV.backgroundColor = BGColor;
    // register cell class
    if ((kCellIdentifier==nil) || (kCellIdentifier.length == 0)) {
        [mainTV registerClass:[tableViewCell class] forCellReuseIdentifier:kDefaultCellIdentifier];
    }else{
        [mainTV registerClass:[tableViewCell class] forCellReuseIdentifier:kCellIdentifier];
    }
    mainTV.showsVerticalScrollIndicator = showV;
    mainTV.showsHorizontalScrollIndicator = showH;
    mainTV.separatorStyle = separatorStyle; // use `UITableViewCellSeparatorStyleNone` remove cell bottom line
    mainTV.delegate = delegateVC;
    mainTV.dataSource = delegateVC;
    return mainTV;
}

/**
 Usage
 
 - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;  // determine section number.
 - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section; // determine row number.
 - (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath; //determine row height.

 // set each section header/footer property if need.
 - (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section;
 - (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section;
 - (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;
 - (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section;

 // add data or UITableViewCell init,determine cell show content.
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
 HomeTableViewCell *tableViewCell=(HomeTableViewCell *)[tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
 if (tableViewCell == nil) {
    tableViewCell = [[HomeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellIdentifier]; // kDefaultCellIdentifier is equal to top.
    }
 }
 
 // tap each cell action.
 - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
 
 */





@end
