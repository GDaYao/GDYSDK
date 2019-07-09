//
//  PhotoMgr.m

#import "PhotoMgr.h"

@implementation PhotoMgr



#pragma mark - 选择本地图片
// select photo from Album
+ (void)tapBtnToPopSystemAlbumWithVC:(UIViewController *)currentVC {
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    // 如果当前控制器器没有实现 `UINavigationControllerDelegate`代理理或者不不是UINavigationController控制器器则需要实现此代理理，否则会报警告，即不不会调⽤用代理理⽅方法。
    imagePickerController.delegate = self;
    imagePickerController.allowsEditing = YES; // allowsEditing属性 ⼀一定要设置成yes，表示照⽚片可编辑，会出现矩形图⽚片选择框
    imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [currentVC presentViewController:imagePickerController animated:YES completion:nil];
    
}
// UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{ //退出相册
    [picker dismissViewControllerAnimated:YES completion:^{ //原图
        UIImage *originalImage = [info objectForKey:UIImagePickerControllerEditedImage];
        //⽤用户选择区域图⽚片
        UIImage *editImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    }];
}

#pragma mark -  添加图片到本地相册
// add photo to Alubm
+ (void)addPhotoToAlbumWithImg:(UIImage *)currentImg {
    // 直接调⽤用此⽅方法，不不需要任何类或者对象调⽤用
    UIImageWriteToSavedPhotosAlbum(currentImg, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
    //因为需要知道该操作的完成情况，即保存成功与否，所以此处需要⼀一个回调⽅方法image:didFinishSavingWithError:contextInfo: //
}
/** delegate
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    NSString *msg = @"";
    if(error == NULL){
        msg = NSLocalizedString(@"shareToSystemPhotoFail_title", @"图⽚保存本地相册失败");
 
 }else{
            msg = NSLocalizedString(@"shareToSystemPhotoSuccess_title", @"成功保存到本地相册");
 
 }
    //
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:nil message:msg preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction=[UIAlertAction actionWithTitle:NSLocalizedString(@"goodJudgeBtn_title", @"好的") style:UIAlertActionStyleDefaul t handler:nil];
    [alertC addAction:okAction];
    [self presentViewController:alertC animated:YES completion:nil];
}
*/


#pragma mark - 添加视频到本地相册
//videoPath为视频下载到本地之后的本地路径
- (void)saveVideoToAlbum:(NSString *)videoPath{
    if ( UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(videoPath) ) {
        //保存相册核心代码
        UISaveVideoAtPathToSavedPhotosAlbum(videoPath, self, @selector(video:didFinishSavingWithError:contextInfo:), nil);
    }
}
/*
//保存视频完成之后的回调
- (void)video:(NSString *)videoPath didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    NSString *msg = @"";
    if (error) {
        NSLog(@"保存视频失败%@", error.localizedDescription);
        msg = @"视频保存相册失败";
    }
    else {
        msg = @"视频成功保存到相册";
    }
    //
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:nil message:msg preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction=[UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
    [alertC addAction:okAction];
    [self presentViewController:alertC animated:YES completion:nil];
}
*/


@end
