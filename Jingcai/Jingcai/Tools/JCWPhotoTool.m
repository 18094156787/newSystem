//
//  JCWPhotoTool.m
//  TakePicture
//
//  Created by yitonghou on 15/8/5.
//  Copyright (c) 2015年 移动事业部. All rights reserved.
//
#define AppRootView  ([[[[[UIApplication sharedApplication] delegate] window] rootViewController] view])

#define AppRootViewController  ([[[[UIApplication sharedApplication] delegate] window] rootViewController])

#define TakePhotoUtilShare [JCWPhotoTool sharedModel]

#import "JCWPhotoTool.h"
#import "JCCommomSelectView.h"
@implementation JCWPhotoTool

+ (JCWPhotoTool *)sharedModel{
    static JCWPhotoTool *sharedModel = nil;
    static dispatch_once_t oneToken;
    dispatch_once(&oneToken, ^{
        sharedModel = [[self alloc] init];
    });
    return sharedModel;
}


+(void)sharePicture:(sendPictureBlock)block{
    
    TakePhotoUtilShare.sPictureBlock = block;
    
    JCCommomSelectView *selectView = [[JCCommomSelectView alloc] initWithTitle:@"选择图片"];
    selectView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    selectView.dataArray = @[@"拍照",@"从相册选择"];
    selectView.JCTitleBlock = ^(NSString * _Nonnull title, NSInteger index) {
        if (index == 0) { // take photo / 去拍照
           
            dispatch_async(dispatch_get_main_queue(), ^{
                  [TakePhotoUtilShare takePicture:UIImagePickerControllerSourceTypeCamera];
            });
        }
        else if (index == 1) {
            dispatch_async(dispatch_get_main_queue(), ^{
//                 [self pushTZImagePickerControllerSelectPhoto:YES SelectVedio:NO];
                 [TakePhotoUtilShare takePicture:UIImagePickerControllerSourceTypePhotoLibrary];
            });
           
        }

    };
    [[UIApplication sharedApplication].keyWindow addSubview:selectView];
    [selectView show];
    
//    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"设置图像" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
//
//    [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//
//    }]];
//    [alertController addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//
//        [TakePhotoUtilShare takePicture:UIImagePickerControllerSourceTypeCamera];
//
//    }]];
//
//    [alertController addAction:[UIAlertAction actionWithTitle:@"从相册选取" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//
//        [TakePhotoUtilShare takePicture:UIImagePickerControllerSourceTypePhotoLibrary];
//
//    }]];
    
//    [AppRootViewController presentViewController:alertController animated:YES completion:^{}];


}

- (void)takePicture:(NSUInteger)UIImagePickerControllerSourceType{
    
    // 跳转到相机或相册页面
    UIImagePickerController* imagePickerController = [[UIImagePickerController alloc] init];
    
    imagePickerController.delegate = self;
    //imagePickerController.allowsEditing = YES;
    imagePickerController.allowsEditing = NO;
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        
        imagePickerController.sourceType = UIImagePickerControllerSourceType;

    }
    else
    {
        imagePickerController.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;

    }
    
    [AppRootViewController presentViewController:imagePickerController animated:YES completion:NULL];

}

#pragma mark - image picker delegte

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    [picker dismissViewControllerAnimated:YES completion:^{}];
    
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    //UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];

    [TakePhotoUtilShare sPictureBlock](image);
    
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
      [picker dismissViewControllerAnimated:YES completion:^{}];
}



@end
