//
//  JCPostImageModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/24.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>
NS_ASSUME_NONNULL_BEGIN

@interface JCPostImageModel : JCWBaseBall

@property (nonatomic,strong) NSString *id;

@property (nonatomic,strong) id image;

@property (nonatomic,strong) id url;

@property (nonatomic,assign) NSInteger width;

@property (nonatomic,assign) NSInteger height;

@property (nonatomic,assign) CGSize size;

@property (nonatomic,strong) PHAsset *asset;

- (CGSize)getImgSize;
//@property (nonatomic,assign)

@end

NS_ASSUME_NONNULL_END
