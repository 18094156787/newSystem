//
//  JCSuggestionFeedBackVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2019/8/11.
//  Copyright © 2019年 blockstar. All rights reserved.
//

#import "JCSuggestionFeedBackVC.h"
#import "TZTestCell.h"
#import "JCCommomSelectView.h"
@interface JCSuggestionFeedBackVC ()

@property (nonatomic, strong) UIButton *backBtn;

@property (nonatomic,strong) EMTextView *contentTV;

@property (nonatomic,strong) UIScrollView *bgView;

@property (nonatomic,strong) UIView *infoView;

@property (nonatomic,strong) UITextField *phoneTF;

@property (nonatomic,strong) UITextField *emailTF;

@property (nonatomic,strong) UILabel *wordCountLab;

@property (nonatomic,strong) UILabel *remarkCountLab;

@property (nonatomic, strong) UIView *errorView;

@property (nonatomic, strong) UIButton *submitBtn;

@property (nonatomic, assign) NSInteger maxCount;

@end

@implementation JCSuggestionFeedBackVC


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"提交反馈信息";
    self.maxCount = 9;
    // Do any additional setup after loading the view.
    _selectedPhotos = [NSMutableArray array];
    _selectedAssets = [NSMutableArray array];


    [self setupViews];

}


- (void)setupViews{

    
    self.bgView = [UIScrollView new];
    self.bgView.backgroundColor = JCWhiteColor;
    self.bgView.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT*1.5);
    self.bgView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [self.view addSubview:self.bgView];
    self.bgView.userInteractionEnabled = YES;
    self.bgView.scrollEnabled = YES;
//    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.bottom.equalTo(self.view);
//        make.top.offset(0);
//    }];

    
    self.contentTV = [EMTextView new];
    self.contentTV.placeholder = @"请输入10个字以上的问题描述或建议，不超过500字... ";
    self.contentTV.font = [UIFont systemFontOfSize:AUTO(16)];
    [self.bgView addSubview:self.contentTV];
    [self.contentTV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(AUTO(10));
        make.width.mas_equalTo(SCREEN_WIDTH-AUTO(30));
        make.height.mas_equalTo(AUTO(120));
    }];
    
    
    WeakSelf;
    [self.contentTV.rac_textSignal subscribeNext:^(id x) {
        
        if (weakSelf.contentTV.text.length > 500) {
            weakSelf.contentTV.text = [weakSelf.contentTV.text substringToIndex:500];
        }
        weakSelf.wordCountLab.text = [NSString stringWithFormat:@"%ld/500",weakSelf.contentTV.text.length];
        weakSelf.errorView.hidden = weakSelf.contentTV.text.length>=10?YES:NO;

    }];
    self.errorView.hidden = YES;
    
    [self.bgView addSubview:self.wordCountLab];
    [self.wordCountLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentTV);
        make.top.equalTo(self.contentTV.mas_bottom);
    }];
    
    
    
    [self.bgView addSubview:self.errorView];
    [self.errorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(self.wordCountLab);
        make.width.mas_equalTo(AUTO(200));
        make.height.mas_equalTo(AUTO(30));
    }];

    UIImageView *errorImgView = [UIImageView new];
    errorImgView.image = JCIMAGE(@"me_message_ic_tips");
    [self.errorView addSubview:errorImgView];
    [errorImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(self.errorView);
        make.width.height.mas_equalTo(AUTO(12));
    }];

    UILabel *tipLab = [UILabel initWithTitle:@"输入的文字描述小于10个字" andFont:AUTO(12) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.errorView addSubview:tipLab];
    [tipLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.errorView);
        make.left.equalTo(errorImgView.mas_right).offset(2);
    }];

    UIView *lineView = [UIView new];
    lineView.backgroundColor = COLOR_F0F0F0;
    [self.bgView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.errorView.mas_bottom).offset(AUTO(10));
        make.left.offset(AUTO(15));
        make.width.mas_equalTo(SCREEN_WIDTH-AUTO(30));
        make.height.mas_equalTo(1);
    }];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.sectionInset = UIEdgeInsetsMake(0,AUTO(15),0,AUTO(15));
    flowLayout.minimumInteritemSpacing = AUTO(10);
    flowLayout.minimumLineSpacing = AUTO(10);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.collectionView1 = [[UICollectionView alloc] initWithFrame:CGRectMake(0, AUTO(180), SCREEN_WIDTH, SCREEN_WIDTH/3.0) collectionViewLayout:flowLayout];
    self.collectionView1.backgroundColor = [UIColor whiteColor];
    self.collectionView1.delegate = self;
    self.collectionView1.dataSource = self;
    self.collectionView1.showsHorizontalScrollIndicator = NO;
    self.collectionView1.showsVerticalScrollIndicator = NO;
    self.collectionView1.scrollEnabled = NO;
    [self.bgView addSubview:self.collectionView1];
    [self.collectionView1 registerClass:[TZTestCell class] forCellWithReuseIdentifier:@"TZTestCell"];



    [self.bgView addSubview:self.remarkCountLab];
    self.remarkCountLab.frame = CGRectMake(AUTO(15), AUTO(180)+SCREEN_WIDTH/3.0, 200, 20);

    [self creatInfoView];
    
}



#pragma mark UICollectionView

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return _selectedPhotos.count + 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TZTestCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TZTestCell" forIndexPath:indexPath];
        [cell.deleteBtn setImage:JCIMAGE(@"post_me_release_img_close") forState:0];
        [cell.deleteBtn setImage:JCIMAGE(@"post_me_release_img_close") forState:UIControlStateHighlighted];
    if (_selectedPhotos.count==self.maxCount) {
        if (indexPath.row==self.maxCount) {
            cell.imageView.image = nil;
            cell.deleteBtn.hidden = YES;
            cell.gifLable.hidden = YES;
        }else {

//            cell.imageView.image = _selectedPhotos[indexPath.row];
            cell.asset = _selectedAssets[indexPath.row];
            cell.deleteBtn.hidden = NO;
        }

    }else {
        if (indexPath.row == _selectedPhotos.count) {
            //        cell.imageView.image = LFIMAGE(@"tpzz");
            cell.imageView.image = JCIMAGE(@"post_btn_add");
            cell.deleteBtn.hidden = YES;
            cell.gifLable.hidden = YES;
        } else {
            cell.imageView.image = _selectedPhotos[indexPath.row];
            cell.asset = _selectedAssets[indexPath.row];
            cell.deleteBtn.hidden = NO;
        }
    }
    cell.deleteBtn.tag = indexPath.row;
    [cell.deleteBtn addTarget:self action:@selector(deleteBtnClik:) forControlEvents:UIControlEventTouchUpInside];

    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(SCREEN_WIDTH/3.0f-AUTO(20), SCREEN_WIDTH/3.0f-AUTO(20));
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == _selectedPhotos.count) {

//        UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"上传图片",nil];
//        [sheet showInView:self.view];
//
//        //            [self pushTZImagePickerController];
        JCCommomSelectView *selectView = [[JCCommomSelectView alloc] initWithTitle:@"选择图片"];
        selectView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        selectView.dataArray = @[@"拍照",@"从相册选择"];
        WeakSelf;
        selectView.JCTitleBlock = ^(NSString * _Nonnull title, NSInteger index) {
            if (index == 0) { // take photo / 去拍照
               
                dispatch_async(dispatch_get_main_queue(), ^{
                      [weakSelf takePhoto];
                });
            }
            else if (index == 1) {
                dispatch_async(dispatch_get_main_queue(), ^{
                     [weakSelf pushTZImagePickerControllerSelectPhoto:YES SelectVedio:NO];
                });
               
            }

        };
        [[UIApplication sharedApplication].keyWindow addSubview:selectView];
        [selectView show];
        
    } else { // preview photos or video / 预览照片或者视频
        id asset = _selectedAssets[indexPath.row];
        BOOL isVideo = NO;
        
        PHAsset *phAsset = asset;
        isVideo = phAsset.mediaType == PHAssetMediaTypeVideo;
        
        
        TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithSelectedAssets:_selectedAssets selectedPhotos:_selectedPhotos index:indexPath.row];
//        imagePickerVc.doneBtnTitleStr = JCBaseColor;
        imagePickerVc.maxImagesCount = 5;
        imagePickerVc.allowPickingGif = NO;
        imagePickerVc.allowPickingOriginalPhoto = YES;
        imagePickerVc.allowPickingMultipleVideo = YES;
        imagePickerVc.isSelectOriginalPhoto = _isSelectOriginalPhoto;
        WeakSelf;
        [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
            weakSelf.selectedPhotos = [NSMutableArray arrayWithArray:photos];
            weakSelf.selectedAssets = [NSMutableArray arrayWithArray:assets];
            weakSelf.isSelectOriginalPhoto = isSelectOriginalPhoto;
            [weakSelf.collectionView1 reloadData];
//            weakSelf.collectionView1.contentSize = CGSizeMake(0, ((weakSelf.selectedPhotos.count + 2) / 3 ) * (weakSelf.margin + weakSelf.itemWH));
        }];
        [self presentViewController:imagePickerVc animated:YES completion:nil];
        //        }
    }
}
#pragma mark - Click Event

- (void)deleteBtnClik:(UIButton *)sender {
    if (sender.tag>=self.maxCount) {
        return;
    }
    [_selectedPhotos removeObjectAtIndex:sender.tag];
    [_selectedAssets removeObjectAtIndex:sender.tag];
    
    WeakSelf;

    
    [_collectionView1 performBatchUpdates:^{
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:sender.tag inSection:0];
        [weakSelf.collectionView1 deleteItemsAtIndexPaths:@[indexPath]];

    } completion:^(BOOL finished) {
        [weakSelf.collectionView1 reloadData];
        [weakSelf resetViewFrame];
    }];
}
#pragma mark - TZImagePickerController

- (void)pushTZImagePickerControllerSelectPhoto:(BOOL)selPhoto SelectVedio:(BOOL)selVedio {
    //    if (self.maxCountTF.text.integerValue <= 0) {
    //        return;
    //    }
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:self.maxCount columnNumber:4 delegate:self pushPhotoPickerVc:YES];
     imagePickerVc.navigationBar.translucent = NO;
    
#pragma mark - 五类个性化设置，这些参数都可以不传，此时会走默认设置
    imagePickerVc.isSelectOriginalPhoto = _isSelectOriginalPhoto;
    
    //    if (self.maxCountTF.text.integerValue > 1) {
    // 1.设置目前已经选中的图片数组
    imagePickerVc.selectedAssets = _selectedAssets; // 目前已经选中的图片数组
    //    }
    imagePickerVc.allowTakePicture = YES; // 在内部显示拍照按钮
    
    // imagePickerVc.photoWidth = 1000;
    
    // 2. Set the appearance
    // 2. 在这里设置imagePickerVc的外观

    imagePickerVc.navigationBar.barTintColor = COLOR_2F2F2F;
    imagePickerVc.oKButtonTitleColorDisabled = [UIColor lightGrayColor];
    imagePickerVc.oKButtonTitleColorNormal = [UIColor greenColor];
    imagePickerVc.navigationBar.translucent = NO;
    // 3. Set allow picking video & photo & originalPhoto or not
    // 3. 设置是否可以选择视频/图片/原图
    imagePickerVc.allowPickingVideo = selVedio;
    imagePickerVc.allowPickingImage = selPhoto;
    imagePickerVc.allowPickingOriginalPhoto = YES;
    imagePickerVc.allowPickingGif = NO;
    imagePickerVc.allowPickingMultipleVideo = NO; // 是否可以多选视频
    
    // 4. 照片排列按修改时间升序
    imagePickerVc.sortAscendingByModificationDate = YES;
    imagePickerVc.showSelectBtn = NO;
    imagePickerVc.allowCrop = NO;
    imagePickerVc.needCircleCrop = NO;
    
    
    imagePickerVc.isStatusBarDefault = YES;
#pragma mark - 到这里为止
    
    // You can get the photos by block, the same as by delegate.
    // 你可以通过block或者代理，来得到用户选择的照片.
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        
    }];
    
    [[self getViewController] presentViewController:imagePickerVc animated:YES completion:nil];
}

#pragma mark - TZImagePickerControllerDelegate

/// User click cancel button
/// 用户点击了取消
- (void)tz_imagePickerControllerDidCancel:(TZImagePickerController *)picker {
    // NSLog(@"cancel");
}


// photos数组里的UIImage对象，默认是828像素宽，你可以通过设置photoWidth属性的值来改变它
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto infos:(NSArray<NSDictionary *> *)infos {
    _selectedPhotos = [NSMutableArray arrayWithArray:photos];
    _selectedAssets = [NSMutableArray arrayWithArray:assets];
    _isSelectOriginalPhoto = isSelectOriginalPhoto;
    [_collectionView1 reloadData];

    
    NSLog(@"高度:%f--%f",self.collectionView1.contentSize.height,self.collectionView1.contentOffset.y);
    [self resetViewFrame];


 
}
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingVideo:(UIImage *)coverImage sourceAssets:(id)asset{
    _selectedPhotos = [NSMutableArray arrayWithArray:@[coverImage]];
    _selectedAssets = [NSMutableArray arrayWithArray:@[asset]];
    // open this code to send video / 打开这段代码发送视频
    
    
    
    [[TZImageManager manager] getVideoOutputPathWithAsset:asset presetName:AVAssetExportPreset640x480 success:^(NSString *outputPath) {
        NSLog(@"视频导出到本地完成,沙盒路径为:%@",outputPath);
        // Export completed, send video here, send by outputPath or NSData
        // 导出完成，在这里写上传代码，通过路径或者通过NSData上传
    } failure:^(NSString *errorMessage, NSError *error) {
        NSLog(@"视频导出失败:%@,error:%@",errorMessage, error);
    }];
    [self.collectionView1 reloadData];
}

#pragma mark - UIActionSheetDelegate,选择类型

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) { // take photo / 去拍照
        [self takePhoto];
    }
    else if (buttonIndex == 1) {
        [self pushTZImagePickerControllerSelectPhoto:YES SelectVedio:NO];
    }
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) { // 去设置界面，开启相机访问权限
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
    }
}
#pragma mark - UIImagePickerController

- (void)takePhoto {
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied) {
        // 无相机权限 做一个友好的提示
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"无法使用相机" message:@"请在iPhone的""设置-隐私-相机""中允许访问相机" preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
        [alertController addAction:[UIAlertAction actionWithTitle:@"设置" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
        }]];
        [self presentViewController:alertController animated:YES completion:nil];
    } else if (authStatus == AVAuthorizationStatusNotDetermined) {
        // fix issue 466, 防止用户首次拍照拒绝授权时相机页黑屏
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
            if (granted) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self takePhoto];
                });
            }
        }];
        // 拍照之前还需要检查相册权限
    } else if ([PHPhotoLibrary authorizationStatus] == 2) { // 已被拒绝，没有相册权限，将无法保存拍的照片
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"无法访问相册" message:@"请在iPhone的""设置-隐私-相册""中允许访问相册" preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
        [alertController addAction:[UIAlertAction actionWithTitle:@"设置" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
        }]];
        [self presentViewController:alertController animated:YES completion:nil];
    } else if ([PHPhotoLibrary authorizationStatus] == 0) { // 未请求过相册权限
        [[TZImageManager manager] requestAuthorizationWithCompletion:^{
            [self takePhoto];
        }];
    } else {
        [self pushImagePickerController];
    }
}
- (void)pushImagePickerController {
    
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
        self.imagePickerVc.sourceType = sourceType;
        _imagePickerVc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
        [self presentViewController:_imagePickerVc animated:YES completion:nil];
    } else {
        NSLog(@"模拟器中无法打开照相机,请在真机中使用");
    }
}
- (void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    if ([type isEqualToString:@"public.image"]) {
        TZImagePickerController *tzImagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 delegate:self];
        //        tzImagePickerVc.sortAscendingByModificationDate = self.sortAscendingSwitch.isOn;
        [tzImagePickerVc showProgressHUD];
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        
    }
}

- (void)refreshCollectionViewWithAddedAsset:(id)asset image:(UIImage *)image {
    [_selectedAssets addObject:asset];
    [_selectedPhotos addObject:image];
    [_collectionView1 reloadData];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    if ([picker isKindOfClass:[UIImagePickerController class]]) {
        [picker dismissViewControllerAnimated:YES completion:nil];
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

- (void)creatInfoView {
    self.infoView = [UIView new];
    self.infoView.backgroundColor = COLOR_F6F6F6;
    self.infoView.frame = CGRectMake(0, AUTO(230)+SCREEN_WIDTH/3.0f, SCREEN_WIDTH, SCREEN_HEIGHT);
    [self.bgView addSubview:self.infoView];
    UIView *bgView = [UIView new];
    bgView.backgroundColor = JCWhiteColor;
    bgView.frame = CGRectMake(0, AUTO(10), SCREEN_WIDTH, AUTO(180));
    [self.infoView addSubview:bgView];

    UILabel  *phoneLab = [UILabel labelTitle:@"联系电话" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_666666 andBackgroundColor:JCClearColor andTextAlignment:0];
    [bgView addSubview:phoneLab];
    [phoneLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.offset(AUTO(15));
        make.height.mas_equalTo(AUTO(16));
    }];
    
    self.phoneTF = [UITextField new];
    self.phoneTF.font = [UIFont systemFontOfSize:AUTO(16)];
    self.phoneTF.placeholder = @"选填，便于我们联系您...";
//    self.phoneTF.frame = CGRectMake(AUTO(100), 0, SCREEN_WIDTH-AUTO(120), AUTO(50));
    [bgView addSubview:self.phoneTF];
    [self.phoneTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(phoneLab);
        make.top.equalTo(phoneLab.mas_bottom).offset(AUTO(10));
        make.right.offset(AUTO(-15));
        make.height.mas_equalTo(AUTO(35));
    }];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = COLOR_F0F0F0;
    [bgView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.equalTo(self.phoneTF.mas_bottom).offset(AUTO(15));
        make.height.mas_equalTo(1);
    }];

    UILabel  *emailLab = [UILabel labelTitle:@"邮箱地址" andFont:AUTO(15) andWeight:0 andTextColor:COLOR_666666 andBackgroundColor:JCClearColor andTextAlignment:0];
//    emailLab.frame = CGRectMake(AUTO(15), 0, AUTO(70), AUTO(50));
    [bgView addSubview:emailLab];
    [emailLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.equalTo(lineView.mas_bottom).offset(AUTO(15));
        make.height.mas_equalTo(AUTO(16));
    }];
    
    
    self.emailTF = [UITextField new];
    self.emailTF.font = [UIFont systemFontOfSize:AUTO(15)];
    self.emailTF.placeholder = @"选填，便于我们联系您...";
    self.emailTF.frame = CGRectMake(AUTO(100), 0, SCREEN_WIDTH-AUTO(120), AUTO(50));
    [bgView addSubview:self.emailTF];
    [self.emailTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(phoneLab);
        make.top.equalTo(emailLab.mas_bottom).offset(AUTO(10));
        make.right.offset(AUTO(-15));
        make.height.mas_equalTo(AUTO(35));
    }];
    
    UIView *bottomView = [UIView new];
    [self.view addSubview:bottomView];
    bottomView.backgroundColor = JCWhiteColor;
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.view);
        make.height.mas_equalTo(kBottomTabSafeAreaHeight+AUTO(75));
    }];
    
    [bottomView addSubview:self.submitBtn];
    [self.submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(50));
        make.right.offset(AUTO(-50));
        make.height.mas_equalTo(AUTO(44));
        make.top.offset(AUTO(16));
    }];
}

#pragma mark

- (void)submitBtnClick {
    if (self.contentTV.text.length==0) {
        [JCWToastTool showHint:@"你还没有输入意见内容哦。。"];
        return;
    }
//      NSString *text =   [self.contentTV.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if (self.contentTV.text.length<10) {
        [JCWToastTool showHint:@"文字描述不小于10个字"];
        return;
    }
    if (self.phoneTF.text.length>0&&![JCWStringTool isValidateMobile:self.phoneTF.text]) {
        [JCWToastTool showHint:@"手机号码填写有误，请重填"];
        return ;
    }

    
    
    if (self.selectedPhotos.count>0) {
        //图片上传
        NSMutableArray *imageArray = [NSMutableArray array];
        [self.selectedPhotos enumerateObjectsUsingBlock:^(UIImage*  _Nonnull data, NSUInteger idx, BOOL * _Nonnull stop) {
            JCUserService_New * service = [JCUserService_New service];
            [SVProgressHUD show];
            [service uploadAvatarWithImage:data type:@"1" success:^(id  _Nullable object) {
                if ([JCWJsonTool isSuccessResponse:object]) {
                    if (object[@"data"][@"image_id"]) {
                        NSString *image_id = [NSString stringWithFormat:@"%@",object[@"data"][@"image_id"]];
                        [imageArray addObject:image_id];
                    }
                    if (imageArray.count==self.selectedPhotos.count) {
                        [SVProgressHUD dismiss];
                        [self submitSuggestionUploadWithImages:imageArray];
                    }
                }else{
                    [SVProgressHUD dismiss];
                     [JCWToastTool showHint:@"图片上传失败"];
                }

            } failure:^(NSError * _Nonnull error) {
                [JCWToastTool showHint:@"图片上传失败"];
                [SVProgressHUD dismiss];
            }];

        }];
    }else{
        [self submitSuggestionUploadWithImages:nil];
    }
    
    
    
}
- (void)submitSuggestionUploadWithImages:(NSArray *)images {
    
    NSString *strResult = @"";
    for (int i=0; i<images.count; i++) {
        NSString *imageID = images[i];
        if (i == 0) {
            strResult = imageID;
        }else{
            strResult = [strResult stringByAppendingString:[NSString stringWithFormat:@",%@",imageID]];
        }
    }

    NSDictionary *paraDic = @{@"content":self.contentTV.text,@"phone":NonNil(self.phoneTF.text),@"email":NonNil(self.emailTF.text),@"images":@""};
    if (images.count>0) {
        paraDic = @{@"images":strResult,@"content":self.contentTV.text,@"phone":NonNil(self.phoneTF.text),@"email":NonNil(self.emailTF.text)};
    }
    NSLog(@"参数%@",paraDic);
    JCUserService_New * service = [JCUserService_New service];
    [service getSubmitSuggestionWithContent:self.contentTV.text image:strResult phone:self.phoneTF.text email:self.emailTF.text success:^(id  _Nullable object) {
        if ([JCWJsonTool isSuccessResponse:object]){
            [JCWToastTool showHint:@"提交成功"];
            [self.navigationController popViewControllerAnimated:YES];
        }else {
            [JCWToastTool showHint:@"提交失败"];
        }
    } failure:^(NSError * _Nonnull error) {
        [JCWToastTool showHint:@"提交失败"];
    }];

}

- (void)resetViewFrame {
    if (_selectedPhotos.count<=2) {
        
        self.collectionView1.frame = CGRectMake(0, AUTO(180), SCREEN_WIDTH, SCREEN_WIDTH/3.0);
           self.infoView.frame = CGRectMake(0, AUTO(230)+SCREEN_WIDTH/3.0f, SCREEN_WIDTH, SCREEN_HEIGHT);
    }else if (_selectedPhotos.count<=5){
        self.collectionView1.frame = CGRectMake(0, AUTO(180), SCREEN_WIDTH, SCREEN_WIDTH/3.0*2);

           self.infoView.frame = CGRectMake(0, AUTO(230)+SCREEN_WIDTH/3.0f*2, SCREEN_WIDTH, SCREEN_HEIGHT);
    }
    else {

        self.collectionView1.frame = CGRectMake(0, AUTO(180), SCREEN_WIDTH, SCREEN_WIDTH);
           self.infoView.frame = CGRectMake(0, AUTO(230)+SCREEN_WIDTH/3.0f*3, SCREEN_WIDTH, SCREEN_HEIGHT);
    }
    self.remarkCountLab.frame = CGRectMake(AUTO(15), self.collectionView1.bottom, 200, 20);
}

- (UIButton *)backBtn {
    if (!_backBtn) {
        _backBtn = [UIButton initWithText:@"意见反馈" FontSize:AUTO(17) BackGroundColor:JCClearColor TextColors:JCWhiteColor];
        _backBtn.titleLabel.font = [UIFont boldSystemFontOfSize:AUTO(17)];
        [_backBtn setImage:JCIMAGE(@"backWhite") forState:0];
        [_backBtn setImage:JCIMAGE(@"backWhite") forState:UIControlStateHighlighted];
        [_backBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 20, 0, 0)];
        
    }
    return _backBtn;
}

- (UILabel *)wordCountLab {
    if (!_wordCountLab) {
        _wordCountLab = [UILabel labelTitle:@"0/500" andFont:AUTO(13) andWeight:0 andTextColor:COLOR_A9A9A9 andBackgroundColor:JCClearColor andTextAlignment:0];
     
    }
    return _wordCountLab;
}

- (UILabel *)remarkCountLab {
    if (!_remarkCountLab) {
        _remarkCountLab = [UILabel labelTitle:@"添加图片说明（选填，最多9张）" andFont:AUTO(12) andWeight:0 andTextColor:[COLOR_2F2F2F colorWithAlphaComponent:0.6] andBackgroundColor:JCClearColor andTextAlignment:0];
        
    }
    return _remarkCountLab;
}
- (UIButton *)submitBtn {
    if (!_submitBtn) {
        _submitBtn = [UIButton initWithText:@"提交反馈" FontSize:AUTO(16) Weight:2 BackGroundColor:JCBaseColor TextColors:JCWhiteColor];
        _submitBtn.layer.cornerRadius = AUTO(22);
        _submitBtn.layer.masksToBounds = YES;
        [_submitBtn addTarget:self action:@selector(submitBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _submitBtn;
}

- (UIView *)errorView {
    if (!_errorView) {
        _errorView = [UIView new];
    }
    return _errorView;
}

@end
