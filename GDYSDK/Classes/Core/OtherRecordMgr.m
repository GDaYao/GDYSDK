//
//  OtherRecordMgr.m


#import "OtherRecordMgr.h"

@implementation OtherRecordMgr


#pragma mark - screen rotate
// AppDelegate.m set support interface orientation.
// support interface
//- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window{
//    return UIInterfaceOrientationMaskAll;
//}
- (BOOL)shouldAutorotate{
    return NO;
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskPortrait;
}
// 优先/第一次显示方向
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return UIInterfaceOrientationPortrait;
}



#pragma mark  验证码定时器
/*
 - (void)startTime:(UIButton *)button
 {
 __block int timeout = 60; //倒计时时间
 dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
 dispatch_source_t timeNew = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
 dispatch_source_set_timer(timeNew, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0); //每秒执行
 dispatch_source_set_event_handler(timeNew, ^{
 if (timeout <= 0) { //倒计时结束，关闭
 dispatch_source_cancel(timeNew);
 dispatch_async(dispatch_get_main_queue(), ^{
 [button setTitle:@"获取验证码" forState:UIControlStateNormal];
 button.userInteractionEnabled = YES;
 [button setTitleColor:kNavigationBarBg forState:UIControlStateNormal];
 });
 } else {
 NSString *strTime = [NSString stringWithFormat:@"%.2d", timeout];
 dispatch_async(dispatch_get_main_queue(), ^{
 [button setTitle:[NSString stringWithFormat:@"获取验证码(%@)", strTime] forState:UIControlStateNormal];
 [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
 button.userInteractionEnabled = NO;
 });
 timeout--;
 }
 });
 dispatch_resume(timeNew);
 }
 
 **/

#pragma mark NSTimer定时器

/*
 //                    weakSelf.sendPhoneTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:weakSelf selector:@selector(runloopTimeSecondSendPhone) userInfo:nil repeats:YES];
 //                    [[NSRunLoop currentRunLoop] addTimer:weakSelf.sendPhoneTimer forMode:NSRunLoopCommonModes];
 //                    [[NSRunLoop currentRunLoop] run];
 
 - (void)runloopTimeSecondSendPhone{
 if (self.sendPhoneTimer && self.sendEmailBtnInVC) {
 if ([self.sendEmailBtnInVC.currentTitle isEqualToString:@"获取验证码"]) {
 [self.sendEmailBtnInVC setTitle:@"60S" forState:UIControlStateNormal];
 [self.sendEmailBtnInVC setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
 self.sendEmailBtnInVC.enabled = NO;
 }else if([self.sendEmailBtnInVC.currentTitle isEqualToString:@"0S"]){
 [self.sendEmailBtnInVC setTitle:@"发送验证码" forState:UIControlStateNormal];
 [self.sendEmailBtnInVC setTitleColor:kNavigationBarBg forState:UIControlStateNormal];
 self.sendEmailBtnInVC.enabled = YES;
 
 [self.sendPhoneTimer invalidate];
 self.sendPhoneTimer = nil;
 }else
 {
 NSInteger sendEmailNum = [self.sendEmailBtnInVC.currentTitle integerValue];
 NSString *numStr = [NSString stringWithFormat:@"%ldS",sendEmailNum-1];
 [self.sendEmailBtnInVC setTitle:numStr forState:UIControlStateNormal];
 }
 
 }
 }
 **/

#pragma mark UINavigation navBar
// self.extendedLayoutIncludesOpaqueBars = YES; //此解决UINavigationVC中出现UIScrollView导致下级的UIViewController也出现自动下移的情况(移动"状态栏+导航栏"的高度)
// self.automaticallyAdjustsScrollViewInsets = NO; // 此属性iOS 11.0之前可使用，在最新的iOS 12.0中未起作用。

#pragma mark - set Animation
/*
 // setAnimation - m1
 [UIView animateWithDuration:0.5 animations:^{
 self.contentSV.contentOffset = CGPointMake(0, tfOffset);
 } completion:^(BOOL finished) {
 }];
 // setAnimation - m2
 [UIView beginAnimations:@"ResizeKeyboard" context:nil];
 [UIView setAnimationDuration:0.5];
 // add set animation method
 [UIView commitAnimations];
 
 **/

#pragma mark - set Info.plist default
/**
 Info.plist add some authority
 ----
 <key>NSAppTransportSecurity</key>
 <dict>
 <key>NSAllowsArbitraryLoads</key>
 <true/>
 </dict>
 <key>NSAppleMusicUsageDescription</key>
 <string>App需要您的同意,才能访问媒体资料库</string>
 <key>NSBluetoothPeripheralUsageDescription</key>
 <string>App需要您的同意,才能访问蓝牙</string>
 <key>NSCameraUsageDescription</key>
 <string>需要访问相机，是否允许</string>
 <key>NSLocationAlwaysUsageDescription</key>
 <string>App需要您的同意,才能始终访问位置</string>
 <key>NSLocationUsageDescription</key>
 <string>App需要您的同意,才能访问位置</string>
 <key>NSLocationWhenInUseUsageDescription</key>
 <string>App需要您的同意,才能在使用期间访问位置</string>
 <key>NSMicrophoneUsageDescription</key>
 <string>App需要您的同意,才能访问麦克风</string>
 ----
 
 */



@end
