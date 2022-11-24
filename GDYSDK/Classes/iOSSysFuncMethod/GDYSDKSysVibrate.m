////  GDYSDKSysVibrate.m
//  GDYSDK
//
//  Created on 2021/9/28.
//  
//

#import "GDYSDKSysVibrate.h"


// 1、长震动
#import <AudioToolbox/AudioToolbox.h>


@implementation GDYSDKSysVibrate

/** 1、长震动
 *  step1:导入AudioToolBox.framework
 *  step2:在需要震动的文件中 #import <AudioToolbox/AudioToolbox.h>
 *  step3:调用震动的方法
 */
+ (void)sysLongVibrateMethod1 {
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}
// 可以播放声音的震动方法
+ (void)sysLongVibrateMethod2 {
    if (@available(iOS 9.0, *)) {
        AudioServicesPlaySystemSoundWithCompletion(kSystemSoundID_Vibrate, ^{
            //声音播放完毕，并震动完成后调用的代码块
        });
    } else {
        // Fallback on earlier versions
    }
}

/** 2、短震动
 *
 */
//普通震动(3D Touch 中 Peek 震动反馈)
+ (void)sysShortVibrateMethod1 {
    AudioServicesPlaySystemSound(1519);
}
//普通短震(3D Touch 中 Pop 震动反馈)
+ (void)sysShortVibrateMethod2 {
    AudioServicesPlaySystemSound(1520);
}
//连续三次短震
+ (void)sysShortVibrateMethod3 {
    AudioServicesPlaySystemSound(1521);
}
/** 3、震动反馈
 *  震动效果 --- 类似于LivePhoto震动效果
 */
+ (void)sysFeedbackMethod {
    if (@available(iOS 10.0, *)) {
        if ([UIScreen mainScreen].bounds.size.width >= 375.f && [UIScreen mainScreen].bounds.size.height >=812.f) {
            UIImpactFeedbackGenerator *feedBackGenertor = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium];
            [feedBackGenertor prepare];
            [feedBackGenertor impactOccurred];
        }else{
            AudioServicesPlaySystemSound(1519);
        }
    } else {
        // Fallback on earlier versions
        // 可以参考“2、短震动”中，普通震动效果。
        AudioServicesPlaySystemSound(1519);
    }
}



@end
