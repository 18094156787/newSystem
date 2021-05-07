//
//  JCSuggestionFeedBackVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2019/8/11.
//  Copyright © 2019年 blockstar. All rights reserved.
//

#import "JCBaseViewController.h"
#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>
#import "TZImageManager.h"
#import "TZLocationManager.h"
#import "TZImagePickerController.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCSuggestionFeedBackVC : JCBaseViewController

<TZImagePickerControllerDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UIAlertViewDelegate,UINavigationControllerDelegate>
@property (nonatomic, strong)NSMutableArray *selectedPhotos;
@property (nonatomic, strong)NSMutableArray *selectedAssets;
@property (nonatomic, assign)BOOL isSelectOriginalPhoto;
@property (nonatomic, assign)CGFloat margin;
@property (nonatomic, assign)CGFloat itemWH;
@property (nonatomic, strong)UIImagePickerController *imagePickerVc;
@property (nonatomic, strong)UICollectionView *collectionView1;
@property (strong, nonatomic)UICollectionViewLayout *layout;
@property (strong, nonatomic)CLLocation *location;

@end

NS_ASSUME_NONNULL_END
