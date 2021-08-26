//
//  JCPostPlanFootView.m
//  Jingcai
//
//  Created by 陈继伟 on 2019/12/26.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCPostPlanFootView.h"
#import "UITextView+HintText.h"
#import "TZTestCell.h"
#import "JCPostImageModel.h"
#import "YBImageBrowser.h"
#import "JCCommomSelectView.h"
@implementation JCPostPlanFootView

- (void)initViews {
    self.maxCount = 9;
    self.backgroundColor = JCWhiteColor;
    [self addSubview:self.yinwenBgView];
    self.yinwenBgView.backgroundColor = JCWhiteColor;
    [self.yinwenBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self);
        make.height.mas_equalTo(AUTO(210));
    }];
    
    [self.yinwenBgView addSubview:self.yinwenLab];
    [self.yinwenLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.offset(AUTO(15));
        make.height.mas_equalTo(AUTO(20));
    }];
    
    [self.yinwenBgView addSubview:self.yinwenTipLab];
    [self.yinwenTipLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.yinwenLab.mas_right).offset(AUTO(5));
        make.centerY.equalTo(self.yinwenLab);
    }];
    
    [self.yinwenBgView addSubview:self.yinwenCountLab];
    [self.yinwenCountLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.bottom.equalTo(self.yinwenBgView.mas_bottom).offset(-10);
    }];
    
    [self.yinwenBgView addSubview:self.yinwenContentTV];
    [self.yinwenContentTV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(10));
        make.right.offset(AUTO(-15));
        make.top.equalTo(self.yinwenLab.mas_bottom).offset(AUTO(5));
        make.bottom.equalTo(self.yinwenBgView.mas_bottom).offset(AUTO(-30));
    }];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = COLOR_F0F0F0;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(-15));
        make.right.offset(AUTO(-15));
        make.height.mas_equalTo(1);
        make.top.equalTo(self.yinwenBgView.mas_bottom);
    }];
    
    [self addSubview:self.zhengwenBgView];
    self.zhengwenBgView.backgroundColor = JCWhiteColor;
    [self.zhengwenBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(lineView.mas_bottom).offset(0);
//        make.bottom.equalTo(self);
        make.height.mas_equalTo(AUTO(510));
    }];
    
    [self.zhengwenBgView addSubview:self.zhengweLab];
    [self.zhengweLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.offset(AUTO(15));
        make.right.offset(AUTO(-15));
//        make.height.mas_equalTo(AUTO(20));
    }];
    
    [self.zhengwenBgView addSubview:self.zhengweTipLab];
    [self.zhengweTipLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.zhengweLab.mas_right).offset(AUTO(5));
        make.centerY.equalTo(self.zhengweLab);
    }];
    

    
    [self.zhengwenBgView addSubview:self.zhengweContentTV];
    [self.zhengweContentTV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(10));
        make.right.offset(AUTO(-10));
        make.top.equalTo(self.zhengweLab.mas_bottom).offset(AUTO(5));
        make.bottom.offset(AUTO(-30));
    }];
    
    [self.zhengwenBgView addSubview:self.zhengweCountLab];
    [self.zhengweCountLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.bottom.offset(AUTO(-10));
    }];
    
    
    UIView *lineView1 = [UIView new];
    lineView1.backgroundColor = COLOR_F0F0F0;
    [self addSubview:lineView1];
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(-15));
        make.right.offset(AUTO(-15));
        make.height.mas_equalTo(1);
        make.top.equalTo(self.zhengwenBgView.mas_bottom);
    }];

    
    //
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.sectionInset = UIEdgeInsetsMake(0,AUTO(15),0,AUTO(15));
    flowLayout.minimumInteritemSpacing = AUTO(1);
    flowLayout.minimumLineSpacing = AUTO(10);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, AUTO(140), SCREEN_WIDTH, SCREEN_HEIGHT-AUTO(180)) collectionViewLayout:flowLayout];
     [self.collectionView registerClass:[TZTestCell class] forCellWithReuseIdentifier:@"TZTestCell"];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.scrollEnabled = NO;
//    self.collectionView.hidden = YES;//默认隐藏,有选择的图片才显示
    [self addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.right.offset(0);
        make.top.equalTo(lineView1.mas_bottom).offset(AUTO(10));
        make.height.mas_equalTo(AUTO(140));
    }];
    
//    [self addSubview:self.addImgBtn];
//    [self.addImgBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.offset(AUTO(15));
//        make.top.equalTo(self.collectionView.mas_bottom).offset(AUTO(10));
//        make.size.mas_equalTo(CGSizeMake(AUTO(30), AUTO(30)));
//    }];
    

    
    WeakSelf;
    [self.yinwenContentTV.rac_textSignal subscribeNext:^(id x) {
        if (weakSelf.yinwenContentTV.text.length > 300) {
            weakSelf.yinwenContentTV.text = [ weakSelf.yinwenContentTV.text substringToIndex:300];
        }
        if (weakSelf.JCYinWenBlock) {
            weakSelf.JCYinWenBlock(x);
        }
        weakSelf.yinwenCountLab.text = [NSString stringWithFormat:@"%ld/300",weakSelf.yinwenContentTV.text.length];
    }];
    [self.zhengweContentTV.rac_textSignal subscribeNext:^(id x) {
        if (weakSelf.zhengweContentTV.text.length > 1000) {
            weakSelf.zhengweContentTV.text = [ weakSelf.zhengweContentTV.text substringToIndex:1000];
        }

        if (weakSelf.JCZhengWenBlock) {
            weakSelf.JCZhengWenBlock([NSString stringWithFormat:@"%@",weakSelf.zhengweContentTV.text]);
        }
        weakSelf.zhengweCountLab.text = [NSString stringWithFormat:@"%ld/1000",weakSelf.zhengweContentTV.text.length];

    }];
}

- (void)selImageBtnClick {
//    NSIndexPath *path = [NSIndexPath indexPathForRow:self.selectedPhotos.count inSection:0];
//    [self collectionView:self.collectionView didSelectItemAtIndexPath:path];
//    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"上传图片",nil];
//    [sheet showInView:[self getViewController].view];
    
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
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return _selectedPhotos.count+1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TZTestCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TZTestCell" forIndexPath:indexPath];
//    JCPostImageModel *model = _selectedPhotos[indexPath.row];
//    if ([model.image isKindOfClass:[UIImage class]]) {
//        cell.imageView.image = model.image;
//    }else{
//        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:model.image]];
//    }
//
//    cell.deleteBtn.hidden = NO;
    [cell.deleteBtn setImage:JCIMAGE(@"post_me_release_img_close") forState:0];
    [cell.deleteBtn setImage:JCIMAGE(@"post_me_release_img_close") forState:UIControlStateHighlighted];
//    cell.deleteBtn.tag = indexPath.row;
//    [cell.deleteBtn addTarget:self action:@selector(deleteBtnClik:) forControlEvents:UIControlEventTouchUpInside];
    
    if (_selectedPhotos.count==self.maxCount) {
        if (indexPath.row==self.maxCount) {
            cell.imageView.image = nil;
            cell.deleteBtn.hidden = YES;
            cell.gifLable.hidden = YES;
        }else {
//            cell.imageView.image = _selectedPhotos[indexPath.row];
//            cell.asset = _selectedAssets[indexPath.row];
            
            JCPostImageModel *model = _selectedPhotos[indexPath.row];
            if ([model.url isKindOfClass:[UIImage class]]) {
                cell.imageView.image = model.url;
            }else{
                [cell.imageView sd_setImageWithURL:[NSURL URLWithString:model.url]];
            }
            
            
            cell.deleteBtn.hidden = NO;
        }

    }else {
        if (indexPath.row == _selectedPhotos.count) {
            //        cell.imageView.image = LFIMAGE(@"tpzz");
            cell.imageView.image = JCIMAGE(@"post_btn_add");
            cell.deleteBtn.hidden = YES;
            cell.gifLable.hidden = YES;
        } else {
//            cell.imageView.image = _selectedPhotos[indexPath.row];
//            cell.asset = _selectedAssets[indexPath.row];
            JCPostImageModel *model = _selectedPhotos[indexPath.row];
            if ([model.url isKindOfClass:[UIImage class]]) {
                cell.imageView.image = model.url;
            }else{
                [cell.imageView sd_setImageWithURL:[NSURL URLWithString:model.url]];
            }
            cell.deleteBtn.hidden = NO;
        }
    }
    cell.deleteBtn.tag = indexPath.row;
    [cell.deleteBtn addTarget:self action:@selector(deleteBtnClik:) forControlEvents:UIControlEventTouchUpInside];

    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    float width = (SCREEN_WIDTH-AUTO(50))/3.0f;
//    return CGSizeMake(SCREEN_WIDTH/3.0f-AUTO(15), SCREEN_WIDTH/3.0f-AUTO(15));
    return CGSizeMake(width, width);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row==9) {
        return;
    }
    if (indexPath.row == _selectedPhotos.count){
        
        [self selImageBtnClick];
        return;
    }
    
        // 图片预览
        NSMutableArray *datas = [NSMutableArray array];
        [self.selectedPhotos enumerateObjectsUsingBlock:^(JCPostImageModel *_Nonnull model, NSUInteger idx, BOOL * _Nonnull stop) {

    //        // 网络图片
            YBIBImageData *data = [YBIBImageData new];
            if ( model.asset) {
                data.imagePHAsset = model.asset;
            }else{
                if (model.url) {
                     data.imageURL = [NSURL URLWithString:model.url];
                }
            }

            [datas addObject:data];
        }];


        YBImageBrowser *browser = [YBImageBrowser new];
        browser.shouldHideStatusBar = NO;
        browser.dataSourceArray = datas;
        browser.currentPage = indexPath.row;
        [browser show];
}
#pragma mark - Click Event

- (void)deleteBtnClik:(UIButton *)sender {
    if (sender.tag>=self.maxCount) {
        return;
    }
    JCPostImageModel *photoModel = _selectedPhotos[sender.tag];
    [_selectedPhotos removeObject:photoModel];
    if (photoModel.id) {
         [self.deletedPhotos addObject:photoModel];
    }
   
//    [_selectedPhotos removeObjectAtIndex:sender.tag];
//    [_selectedAssets removeObjectAtIndex:sender.tag];
    if (self.JCPhotoBlock) {
        self.JCPhotoBlock(self.selectedPhotos,self.deletedPhotos);
    }
    
    WeakSelf;

    
    [_collectionView performBatchUpdates:^{
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:sender.tag inSection:0];
        [weakSelf.collectionView deleteItemsAtIndexPaths:@[indexPath]];
        

    } completion:^(BOOL finished) {
//        weakSelf.collectionView.hidden = weakSelf.selectedPhotos.count>0?NO:YES;
        
        
        NSInteger numLine = ceil((weakSelf.selectedPhotos.count+1)/3.0f);//多少行
         float width = (SCREEN_WIDTH-AUTO(50))/3.0f;
        [UIView animateWithDuration:0.5 animations:^{
            [weakSelf.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(numLine *(width+10));
            }];
             [weakSelf.collectionView.superview layoutIfNeeded];
        }];
        [weakSelf.collectionView reloadData];
       



    }];
}
#pragma mark - TZImagePickerController

- (void)pushTZImagePickerControllerSelectPhoto:(BOOL)selPhoto SelectVedio:(BOOL)selVedio {
    //    if (self.maxCountTF.text.integerValue <= 0) {
    //        return;
    //    }
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:self.maxCount-self.selectedPhotos.count columnNumber:4 delegate:self pushPhotoPickerVc:YES];
    // imagePickerVc.navigationBar.translucent = NO;
    
#pragma mark - 五类个性化设置，这些参数都可以不传，此时会走默认设置
    imagePickerVc.isSelectOriginalPhoto = _isSelectOriginalPhoto;
    
    //    if (self.maxCountTF.text.integerValue > 1) {
    // 1.设置目前已经选中的图片数组
//    imagePickerVc.selectedAssets = _selectedAssets; // 目前已经选中的图片数组
    //    }
    imagePickerVc.allowTakePicture = YES; // 在内部显示拍照按钮
    
    // imagePickerVc.photoWidth = 1000;
    
    // 2. Set the appearance
    // 2. 在这里设置imagePickerVc的外观

    imagePickerVc.oKButtonTitleColorDisabled = [UIColor lightGrayColor];
    imagePickerVc.oKButtonTitleColorNormal = [UIColor greenColor];
#pragma mark cjw
//    imagePickerVc.iconThemeColor = JCBaseColor;
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
    
    
//    imagePickerVc.statusBarStyle = UIStatusBarStyleLightContent;
#pragma mark - 到这里为止
    
    // You can get the photos by block, the same as by delegate.
    // 你可以通过block或者代理，来得到用户选择的照片.
//    [imagePickerVc setPhotoPickerPageUIConfigBlock:^(UICollectionView *collectionView, UIView *bottomToolBar, UIButton *previewButton, UIButton *originalPhotoButton, UILabel *originalPhotoLabel, UIButton *doneButton, UIImageView *numberImageView, UILabel *numberLabel, UIView *divideLine) {
//        [doneButton setTitleColor:JCBaseColor forState:UIControlStateNormal];
//    }];
    
    [[self getViewController] presentViewController:imagePickerVc animated:YES completion:nil];
//    [self.navigationController pushViewController:imagePickerVc animated:YES]
}

#pragma mark - TZImagePickerControllerDelegate

/// User click cancel button
/// 用户点击了取消
- (void)tz_imagePickerControllerDidCancel:(TZImagePickerController *)picker {
    // NSLog(@"cancel");
}

#pragma mark 选择完获取到图片
// photos数组里的UIImage对象，默认是828像素宽，你可以通过设置photoWidth属性的值来改变它
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto infos:(NSArray<NSDictionary *> *)infos {
//    _selectedPhotos = [NSMutableArray arrayWithArray:photos];
    //    _selectedAssets = [NSMutableArray arrayWithArray:assets];
//    [_selectedPhotos addObjectsFromArray:photos];
    
    [photos enumerateObjectsUsingBlock:^(UIImage * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        JCPostImageModel *model = [JCPostImageModel new];
        model.url = obj;
        model.width = obj.size.width;
        model.height = obj.size.height;
        model.asset = assets[idx];
        [self.selectedPhotos addObject:model];
    }];;


    _isSelectOriginalPhoto = isSelectOriginalPhoto;
    [_collectionView reloadData];
//    self.collectionView.hidden = self.selectedPhotos.count>0?NO:YES;
    
    NSInteger numLine = ceil((self.selectedPhotos.count+1)/3.0f);//多少行
     float width = (SCREEN_WIDTH-AUTO(50))/3.0f;
    [self.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(numLine *(width+10));
    }];
    
    if (self.JCPhotoBlock) {
        self.JCPhotoBlock(self.selectedPhotos,self.deletedPhotos);
    }
    
    NSLog(@"高度:%f--%f",self.collectionView.contentSize.height,self.collectionView.contentOffset.y);

 
}
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingVideo:(UIImage *)coverImage sourceAssets:(id)asset{
    _selectedPhotos = [NSMutableArray arrayWithArray:@[coverImage]];
//    _selectedAssets = [NSMutableArray arrayWithArray:@[asset]];
    // open this code to send video / 打开这段代码发送视频
    
    
    
    [[TZImageManager manager] getVideoOutputPathWithAsset:asset presetName:AVAssetExportPreset640x480 success:^(NSString *outputPath) {
        NSLog(@"视频导出到本地完成,沙盒路径为:%@",outputPath);
        // Export completed, send video here, send by outputPath or NSData
        // 导出完成，在这里写上传代码，通过路径或者通过NSData上传
    } failure:^(NSString *errorMessage, NSError *error) {
        NSLog(@"视频导出失败:%@,error:%@",errorMessage, error);
    }];
    [self.collectionView reloadData];
}

#pragma mark - UIActionSheetDelegate,选择类型

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) { // take photo / 去拍照
       
        dispatch_async(dispatch_get_main_queue(), ^{
              [self takePhoto];
        });
    }
    else if (buttonIndex == 1) {
        dispatch_async(dispatch_get_main_queue(), ^{
             [self pushTZImagePickerControllerSelectPhoto:YES SelectVedio:NO];
        });
       
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
        [[self getViewController] presentViewController:alertController animated:YES completion:nil];
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
        [[self getViewController] presentViewController:alertController animated:YES completion:nil];
    } else if ([PHPhotoLibrary authorizationStatus] == 0) { // 未请求过相册权限
        [[TZImageManager manager] requestAuthorizationWithCompletion:^{
            [self takePhoto];
        }];
    } else {
        [self pushImagePickerController];
    }
}
- (void)pushImagePickerController {
    // 提前定位
//    __weak typeof(self) weakSelf = self;
//    [[TZLocationManager manager] startLocationWithSuccessBlock:^(NSArray<CLLocation *> *locations) {
//        __strong typeof(weakSelf) strongSelf = weakSelf;
//        strongSelf.location = [locations firstObject];
//    } failureBlock:^(NSError *error) {
//        __strong typeof(weakSelf) strongSelf = weakSelf;
//        strongSelf.location = nil;
//    }];
    
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
        self.imagePickerVc.sourceType = sourceType;
        _imagePickerVc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
        [[self getViewController] presentViewController:_imagePickerVc animated:YES completion:nil];
    } else {
        NSLog(@"模拟器中无法打开照相机,请在真机中使用");
    }
}
- (void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    
    TZImagePickerController *tzImagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 delegate:self];
//    tzImagePickerVc.sortAscendingByModificationDate = self.sortAscendingSwitch.isOn;
    [tzImagePickerVc showProgressHUD];
    if ([type isEqualToString:@"public.image"]) {
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        NSDictionary *meta = [info objectForKey:UIImagePickerControllerMediaMetadata];
        // save photo and get asset / 保存图片，获取到asset
        [[TZImageManager manager] savePhotoWithImage:image meta:meta location:self.location completion:^(PHAsset *asset, NSError *error){
            [tzImagePickerVc hideProgressHUD];
            if (error) {
                NSLog(@"图片保存失败 %@",error);
            } else {
                TZAssetModel *assetModel = [[TZImageManager manager] createModelWithAsset:asset];
//                if (self.allowCropSwitch.isOn) { // 允许裁剪,去裁剪
//                    TZImagePickerController *imagePicker = [[TZImagePickerController alloc] initCropTypeWithAsset:assetModel.asset photo:image completion:^(UIImage *cropImage, id asset) {
//                        [self refreshCollectionViewWithAddedAsset:asset image:cropImage];
//                    }];
//                    imagePicker.allowPickingImage = YES;
//                    imagePicker.needCircleCrop = self.needCircleCropSwitch.isOn;
//                    imagePicker.circleCropRadius = 100;
//                    [self presentViewController:imagePicker animated:YES completion:nil];
//                } else {
//                    [self refreshCollectionViewWithAddedAsset:assetModel.asset image:image];
//                }
                [self refreshCollectionViewWithAddedAsset:assetModel.asset image:image];
            }
        }];
    } else if ([type isEqualToString:@"public.movie"]) {
        NSURL *videoUrl = [info objectForKey:UIImagePickerControllerMediaURL];
        if (videoUrl) {
            [[TZImageManager manager] saveVideoWithUrl:videoUrl location:self.location completion:^(PHAsset *asset, NSError *error) {
                [tzImagePickerVc hideProgressHUD];
                if (!error) {
                    TZAssetModel *assetModel = [[TZImageManager manager] createModelWithAsset:asset];
                    [[TZImageManager manager] getPhotoWithAsset:assetModel.asset completion:^(UIImage *photo, NSDictionary *info, BOOL isDegraded) {
                        if (!isDegraded && photo) {
                            [self refreshCollectionViewWithAddedAsset:assetModel.asset image:photo];
                        }
                    }];
                }
            }];
        }
    }
}

- (void)refreshCollectionViewWithAddedAsset:(id)asset image:(UIImage *)image {
//    [_selectedAssets addObject:asset];
    [_selectedPhotos addObject:image];
    [_collectionView reloadData];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    if ([picker isKindOfClass:[UIImagePickerController class]]) {
        [picker dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)setClearImg:(BOOL)clearImg {
    _clearImg = clearImg;
    if (clearImg) {
        [self.selectedPhotos removeAllObjects];
        [UIView animateWithDuration:0.5 animations:^{
            [self.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(140);
            }];
             [self.collectionView.superview layoutIfNeeded];
        }];
        [self.collectionView reloadData];
    }
}

- (void)refresgImageData {

//  self.collectionView.hidden = self.selectedPhotos.count>0?NO:YES;
    NSInteger numLine = ceil((self.selectedPhotos.count+1)/3.0f);//多少行
     float width = (SCREEN_WIDTH-AUTO(50))/3.0f;
    [UIView animateWithDuration:0.5 animations:^{
        [self.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(numLine *(width+10));
        }];
         [self.collectionView.superview layoutIfNeeded];
    }];
    [self.collectionView reloadData];

}


- (UIImagePickerController *)imagePickerVc {
    if (_imagePickerVc == nil) {
        _imagePickerVc = [[UIImagePickerController alloc] init];
        _imagePickerVc.delegate = self;
        // set appearance / 改变相册选择页的导航栏外观
//        _imagePickerVc.navigationBar.barTintColor = self.navigationController.navigationBar.barTintColor;
//        _imagePickerVc.navigationBar.tintColor = self.navigationController.navigationBar.tintColor;
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

- (UIView *)yinwenBgView {
    if (!_yinwenBgView) {
        _yinwenBgView = [UIView new];
    }
    return _yinwenBgView;
}

- (UILabel *)yinwenLab {
    if (!_yinwenLab) {
        _yinwenLab = [UILabel initWithTitle:@"引文（选填，付费前不屏蔽，限制在300字内）" andFont:AUTO(16) andWeight:1 andTextColor:[COLOR_2F2F2F colorWithAlphaComponent:0.6] andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _yinwenLab;
                    
}

- (UILabel *)yinwenTipLab {
    if (!_yinwenTipLab) {
        _yinwenTipLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _yinwenTipLab;
                    
}

- (UILabel *)yinwenCountLab {
    if (!_yinwenCountLab) {
        _yinwenCountLab = [UILabel initWithTitle:@"0/300" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _yinwenCountLab;
}

- (UITextView *)yinwenContentTV {
    if (!_yinwenContentTV) {
        _yinwenContentTV = [UITextView new];
        _yinwenContentTV.textColor = COLOR_333333;
        _yinwenContentTV.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(14)];
    }
    return _yinwenContentTV;
}

-(UIView *)zhengwenBgView {
    if (!_zhengwenBgView) {
        _zhengwenBgView = [UIView new];
    }
    return _zhengwenBgView;
}

- (UILabel *)zhengweLab {
    if (!_zhengweLab) {
        _zhengweLab = [UILabel initWithTitle:@"正文（必填，付费前屏蔽，至少达到300字，最多不超过1000字）" andFont:AUTO(16) andWeight:1 andTextColor:[COLOR_2F2F2F colorWithAlphaComponent:0.6] andBackgroundColor:JCClearColor andTextAlignment:0];
        _zhengweLab.numberOfLines = 0;
    }
    return _zhengweLab;
                    
}

- (UILabel *)zhengweTipLab {
    if (!_zhengweTipLab) {
        _zhengweTipLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _zhengweTipLab;
                    
}

- (UILabel *)zhengweCountLab {
    if (!_zhengweCountLab) {
        _zhengweCountLab = [UILabel initWithTitle:@"0/1000" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _zhengweCountLab;
}

- (UITextView *)zhengweContentTV {
    if (!_zhengweContentTV) {
        _zhengweContentTV = [UITextView new];
        _zhengweContentTV.textColor = COLOR_333333;
        _zhengweContentTV.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(14)];
        _zhengweContentTV.showsVerticalScrollIndicator = NO;
    }
    return _zhengweContentTV;
}

- (UIButton *)addImgBtn {
    if (!_addImgBtn) {
        _addImgBtn = [UIButton new];
        [_addImgBtn addTarget:self action:@selector(selImageBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_addImgBtn setImage:JCIMAGE(@"icon_tp_addImg") forState:0];
        [_addImgBtn setImage:JCIMAGE(@"icon_tp_addImg") forState:UIControlStateHighlighted];
    }
    return _addImgBtn;
}

- (NSMutableArray *)selectedPhotos {
    if (!_selectedPhotos) {
        _selectedPhotos = [NSMutableArray array];
    }
    return _selectedPhotos;
}

- (NSMutableArray *)deletedPhotos {
    if (!_deletedPhotos) {
        _deletedPhotos = [NSMutableArray array];
    }
    return _deletedPhotos;
}




@end
