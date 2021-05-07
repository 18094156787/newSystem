//
//  JCSettingAvatarVC.m
//  Jingcai
//
//  Created by Rain on 2018/10/11.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCSettingAvatarVC.h"
#import "JCWPhotoTool.h"
#import "JCWToastTool.h"
#import "JCWJsonTool.h"
#import "JCWUserBall.h"
#import "JCCommomSelectView.h"
#import "TZImagePickerController.h"
#import <UIKit/UIKit.h>
@interface JCSettingAvatarVC ()<TZImagePickerControllerDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIButton *uploadBtn;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (assign, nonatomic) BOOL isSelImage;
@property (nonatomic, strong) UIImage *selImage;
@property (nonatomic, strong) UIImagePickerController *imagePickerVc;

@property (nonatomic, strong) UILabel* infoLab;
@end

@implementation JCSettingAvatarVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
    [self setNavBackImg];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    self.uploadBtn.backgroundColor = JCBaseColor;
    self.iconImageView.layer.cornerRadius = 44;
    self.iconImageView.layer.masksToBounds = YES;
//    [self.iconImageView hg_setAllCornerWithCornerRadius:44.0f];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"头像设置";
    [self initSubViews];
    [self getCheckInfo];

}

- (void)initSubViews {
    
    [self.view addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.uploadBtn);
        make.top.equalTo(self.uploadBtn.mas_bottom).offset(AUTO(10));
    }];
    
    self.uploadBtn.backgroundColor = JCBaseColor;
    _isSelImage = NO;
    
    //添加图片上传点击事件
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(iconImageViewClick)];
    [_iconImageView setUserInteractionEnabled:YES];
    [_iconImageView addGestureRecognizer:tap];
    self.iconImageView.layer.cornerRadius = 44;
    self.iconImageView.layer.masksToBounds = YES;
    
    if ([[JCWUserBall currentUser].tuijian integerValue] ==1) {
            self.infoLab.text = @"①成为达人后，修改头像需客服审核！\n②头像上请勿带有二维码微信号、电话号码等非法信息，否则将不予通过！\n③每月最多修改1次！";
        }
}

//获取达人审核信息
- (void)getCheckInfo {
    //不是签约专家就不去获取
    if ([[JCWUserBall currentUser].tuijian integerValue]!=1) {
        self.iconImageView.image = JCIMAGE(@"camera");
        return;
    }
    
    [self.view showLoading];
    JCUserService_New * service = [JCUserService_New service];
    [service getUserCheckInfoWithType:@"2" success:^(id  _Nullable object) {
        [self.view endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            NSString *content = object[@"data"][@"content"];
            NSString *state = object[@"data"][@"current_state"];//是否可以修改 1是 2审核中 3本月已修改 4禁止修改
            [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:NonNil(content)] placeholderImage:JCIMAGE(@"camera")];
            if ([state integerValue]==1) {
                [self.uploadBtn setTitle:@"上传" forState:0];
                self.uploadBtn.backgroundColor = JCBaseColor;
                self.uploadBtn.userInteractionEnabled = YES;
                self.iconImageView.userInteractionEnabled = YES;
            }
            if ([state integerValue]==2) {
                [self.uploadBtn setTitle:@"审核中" forState:0];
                self.uploadBtn.backgroundColor = COLOR_9F9F9F;
                self.uploadBtn.userInteractionEnabled = NO;
                self.iconImageView.userInteractionEnabled = NO;
            }
            if ([state integerValue]==3) {
                [self.uploadBtn setTitle:@"本月已修改" forState:0];
                self.uploadBtn.backgroundColor = COLOR_9F9F9F;
                self.uploadBtn.userInteractionEnabled = NO;
                self.iconImageView.userInteractionEnabled = NO;
            }
        }else{
             [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self.view endLoading];
    }];

}

- (void)iconImageViewClick {
    WeakSelf;

    JCCommomSelectView *selectView = [[JCCommomSelectView alloc] initWithTitle:@"选择图片"];
    selectView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    selectView.dataArray = @[@"拍照",@"从相册选择"];
    selectView.JCTitleBlock = ^(NSString * _Nonnull title, NSInteger index) {
        if (index == 0) { // take photo / 去拍照
            [weakSelf takePhoto];
//            dispatch_async(dispatch_get_main_queue(), ^{
//                  [TakePhotoUtilShare takePicture:UIImagePickerControllerSourceTypeCamera];
//            });
        }
        else if (index == 1) {
            dispatch_async(dispatch_get_main_queue(), ^{
                 [weakSelf pushTZImagePickerController];
            });
           
        }

    };
    [[UIApplication sharedApplication].keyWindow addSubview:selectView];
    [selectView show];
}


- (IBAction)uploadBtnClick:(UIButton *)sender {
    if (!self.isSelImage) {
        [JCWToastTool showHint:@"请先上传头像"];
        return ;
    }

    JCUserService_New * service = [JCUserService_New service];
    [service uploadAvatarWithImage:self.selImage type:@"2" success:^(id  _Nullable object) {
        if ([JCWJsonTool isSuccessResponse:object]) {
            //更新user
            NSString *file_path = object[@"data"][@"file_path"];
            NSString *image_id = [NSString stringWithFormat:@"%@",object[@"data"][@"image_id"]];
            JCWUserBall * userBall = [JCWUserBall currentUser];
            if ([userBall.tuijian integerValue]!=1) {
               
                userBall.user_img = file_path;
                [JCWUserBall save:userBall];
            }
            [self updateUserInfoWithImageID:image_id];
        }else{
             [JCWToastTool showHint:object[@"msg"]];
        }
    } failure:^(NSError * _Nonnull error) {
        [JCWToastTool showHint:@"头像上传失败"];
    }];

}

//上传图片
- (void)updateUserInfoWithImageID:(NSString *)imageID {
    JCUserService_New * service = [JCUserService_New service];
    [service updateUserInfoWithType:@"2" value:imageID code:@"" success:^(id  _Nullable object) {
        if ([JCWJsonTool isSuccessResponse:object]) {
            //更新user
            [[NSNotificationCenter defaultCenter] postNotificationName:NotificationNameUserChange object:nil];
            [self.navigationController popViewControllerAnimated:YES];
            
        }else{
             [JCWToastTool showHint:object[@"msg"]];
        }
    } failure:^(NSError * _Nonnull error) {
        
    }];

}

- (void)pushTZImagePickerController {
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 columnNumber:4 delegate:self pushPhotoPickerVc:YES];
    imagePickerVc.isSelectOriginalPhoto = NO;

    imagePickerVc.allowTakePicture = NO; // 在内部显示拍照按钮
    imagePickerVc.allowTakeVideo = NO;   // 在内部显示拍视频按
    imagePickerVc.videoMaximumDuration = 10; // 视频最大拍摄时间
    [imagePickerVc setUiImagePickerControllerSettingBlock:^(UIImagePickerController *imagePickerController) {
        imagePickerController.videoQuality = UIImagePickerControllerQualityTypeHigh;
    }];
    imagePickerVc.iconThemeColor = [UIColor colorWithRed:31 / 255.0 green:185 / 255.0 blue:34 / 255.0 alpha:1.0];
    imagePickerVc.showPhotoCannotSelectLayer = YES;
    imagePickerVc.cannotSelectLayerColor = [[UIColor whiteColor] colorWithAlphaComponent:0.8];
    
    // 3. Set allow picking video & photo & originalPhoto or not
    // 3. 设置是否可以选择视频/图片/原图
    imagePickerVc.allowPickingVideo = NO;
    imagePickerVc.allowPickingImage = YES;
    imagePickerVc.allowPickingOriginalPhoto = NO;
    imagePickerVc.allowPickingGif = NO;
    /// 5. 单选模式,maxImagesCount为1时才生效
    imagePickerVc.showSelectBtn = NO;
    imagePickerVc.allowCrop = YES;
    imagePickerVc.needCircleCrop = YES;
    // 设置竖屏下的裁剪尺寸
    NSInteger left = 30;
    NSInteger widthHeight = SCREEN_WIDTH - 2 * left;
    NSInteger top = (SCREEN_HEIGHT - widthHeight) / 2;
    imagePickerVc.cropRect = CGRectMake(left, top, widthHeight, widthHeight);
    imagePickerVc.scaleAspectFillCrop = YES;
    imagePickerVc.statusBarStyle = UIStatusBarStyleLightContent;
    [self presentViewController:imagePickerVc animated:YES completion:nil];

}
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto {
    if (photos.count>0) {
        self.isSelImage = YES;
        self.selImage = photos.firstObject;
        self.iconImageView.image = photos.firstObject;
    }
    
}


/// 拍照按钮点击事件
- (void)takePhoto {
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if ((authStatus == AVAuthorizationStatusRestricted || authStatus ==AVAuthorizationStatusDenied)) {
        
        NSDictionary *infoDict = [TZCommonTools tz_getInfoDictionary];
        // 无权限 做一个友好的提示
        NSString *appName = [infoDict valueForKey:@"CFBundleDisplayName"];
        if (!appName) appName = [infoDict valueForKey:@"CFBundleName"];
        if (!appName) appName = [infoDict valueForKey:@"CFBundleExecutable"];

        NSString *title = [NSBundle tz_localizedStringForKey:@"Can not use camera"];
        NSString *message = [NSString stringWithFormat:[NSBundle tz_localizedStringForKey:@"Please allow %@ to access your camera in \"Settings -> Privacy -> Camera\""],appName];
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAct = [UIAlertAction actionWithTitle:[NSBundle tz_localizedStringForKey:@"Cancel"] style:UIAlertActionStyleCancel handler:nil];
        [alertController addAction:cancelAct];
        UIAlertAction *settingAct = [UIAlertAction actionWithTitle:[NSBundle tz_localizedStringForKey:@"Setting"] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
        }];
        [alertController addAction:settingAct];
        [self.navigationController presentViewController:alertController animated:YES completion:nil];
    } else if (authStatus == AVAuthorizationStatusNotDetermined) {
        // fix issue 466, 防止用户首次拍照拒绝授权时相机页黑屏
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
            if (granted) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self pushImagePickerController];
                });
            }
        }];
    } else {
        [self pushImagePickerController];
    }
}

// 调用相机
- (void)pushImagePickerController {
    // 是否开启定位,用来访问拍摄照片的地点,这边不需要此功能
//    TZImagePickerController *tzImagePickerVc = (TZImagePickerController *)self.navigationController;
//    if (tzImagePickerVc.allowCameraLocation) {
//        __weak typeof(self) weakSelf = self;
//        [[TZLocationManager manager] startLocationWithSuccessBlock:^(NSArray<CLLocation *> *locations) {
//            __strong typeof(weakSelf) strongSelf = weakSelf;
////            strongSelf.location = [locations firstObject];
//        } failureBlock:^(NSError *error) {
//            __strong typeof(weakSelf) strongSelf = weakSelf;
////            strongSelf.location = nil;
//        }];
//    }
    
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    if ([UIImagePickerController isSourceTypeAvailable: sourceType]) {
        self.imagePickerVc.sourceType = sourceType;
        NSMutableArray *mediaTypes = [NSMutableArray array];
        [self presentViewController:self.imagePickerVc animated:YES completion:nil];

    }
}


- (void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    
    TZImagePickerController *tzImagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 delegate:self];
    tzImagePickerVc.allowTakeVideo = NO;
    tzImagePickerVc.sortAscendingByModificationDate = YES;
    [tzImagePickerVc showProgressHUD];
    if ([type isEqualToString:@"public.image"]) {
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        NSDictionary *meta = [info objectForKey:UIImagePickerControllerMediaMetadata];
        // save photo and get asset / 保存图片，获取到asset
        [[TZImageManager manager] savePhotoWithImage:image meta:meta location:nil completion:^(PHAsset *asset, NSError *error){
            [tzImagePickerVc hideProgressHUD];
            if (error) {
                NSLog(@"图片保存失败 %@",error);
            } else {
                TZAssetModel *assetModel = [[TZImageManager manager] createModelWithAsset:asset];
                TZImagePickerController *imagePicker = [[TZImagePickerController alloc] initCropTypeWithAsset:assetModel.asset photo:image completion:^(UIImage *cropImage, id asset) {
                    self.isSelImage = YES;
                    self.iconImageView.image = cropImage;
//                    [self refreshCollectionViewWithAddedAsset:asset image:cropImage];
                }];
                imagePicker.allowPickingImage = YES;
                imagePicker.needCircleCrop = YES;
//                imagePicker.circleCropRadius = 100;
                // 设置竖屏下的裁剪尺寸
                NSInteger left = 30;
                NSInteger widthHeight = SCREEN_WIDTH - 2 * left;
                NSInteger top = (SCREEN_HEIGHT - widthHeight) / 2;
                imagePicker.cropRect = CGRectMake(left, top, widthHeight, widthHeight);
                imagePicker.scaleAspectFillCrop = YES;
                [self presentViewController:imagePicker animated:YES completion:nil];
            }
        }];
    }
}

- (UIImagePickerController *)imagePickerVc {
    if (_imagePickerVc == nil) {
        _imagePickerVc = [[UIImagePickerController alloc] init];
        _imagePickerVc.delegate = self;
        // set appearance / 改变相册选择页的导航栏外观
        _imagePickerVc.navigationBar.barTintColor = self.navigationController.navigationBar.barTintColor;
        _imagePickerVc.navigationBar.tintColor = self.navigationController.navigationBar.tintColor;
        UIBarButtonItem *tzBarItem, *BarItem;
        if (@available(iOS 9, *)) {
            tzBarItem = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[TZImagePickerController class]]];
            BarItem = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UIImagePickerController class]]];
        } else {
            tzBarItem = [UIBarButtonItem appearanceWhenContainedIn:[TZImagePickerController class], nil];
            BarItem = [UIBarButtonItem appearanceWhenContainedIn:[UIImagePickerController class], nil];
        }
        NSDictionary *titleTextAttributes = [tzBarItem titleTextAttributesForState:UIControlStateNormal];
        [BarItem setTitleTextAttributes:titleTextAttributes forState:UIControlStateNormal];
    }
    return _imagePickerVc;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
        _infoLab.numberOfLines = 0;
    }
    return _infoLab;
}
@end
