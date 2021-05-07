//
//  JCPostPlanFootView.h
//  Jingcai
//
//  Created by 陈继伟 on 2019/12/26.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "UITextView+Placeholder.h"
#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>
#import "TZImageManager.h"
#import "TZLocationManager.h"
#import "TZImagePickerController.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCPostPlanFootView : JCBaseView<TZImagePickerControllerDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UIAlertViewDelegate,UINavigationControllerDelegate>

@property (nonatomic,strong) UIView *yinwenBgView;

@property (nonatomic,strong) UILabel *yinwenLab;

@property (nonatomic,strong) UILabel *yinwenTipLab;

@property (nonatomic,strong) UILabel *yinwenCountLab;

@property (nonatomic,strong) UITextView *yinwenContentTV;//引文

@property (nonatomic,strong) UIView *zhengwenBgView;

@property (nonatomic,strong) UILabel *zhengweLab;

@property (nonatomic,strong) UILabel *zhengweTipLab;

@property (nonatomic,strong) UILabel *zhengweCountLab;

@property (nonatomic,strong) UITextView *zhengweContentTV;//正文

@property (nonatomic,strong) UIButton *addImgBtn;

@property (nonatomic, strong)NSMutableArray *selectedPhotos;

@property (nonatomic, strong)NSMutableArray *deletedPhotos;

@property (nonatomic, strong)NSMutableArray *selectedAssets;
@property (nonatomic, assign)BOOL isSelectOriginalPhoto;
@property (nonatomic, assign)CGFloat margin;
@property (nonatomic, assign)CGFloat itemWH;
@property (nonatomic, strong)UIImagePickerController *imagePickerVc;
//@property (nonatomic,strong)UIScrollView *scrollView;
@property (nonatomic, strong)UICollectionView *collectionView;
@property (strong, nonatomic)UICollectionViewLayout *layout;
@property (strong, nonatomic)CLLocation *location;

@property (nonatomic, assign) NSInteger maxCount;

@property (nonatomic, assign) BOOL allowCrop;//允许裁剪

@property (nonatomic, copy) void(^JCPhotoBlock)(NSArray *imgArray,NSArray *deleteImgArray);


@property (nonatomic, copy) void(^JCYinWenBlock)(NSString *str);

@property (nonatomic, copy) void(^JCZhengWenBlock)(NSString *str);

@property (nonatomic, assign) BOOL clearImg;

- (void)refresgImageData;

@end

NS_ASSUME_NONNULL_END
