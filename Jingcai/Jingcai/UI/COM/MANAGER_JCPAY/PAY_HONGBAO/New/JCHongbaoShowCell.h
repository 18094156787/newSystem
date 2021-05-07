//
//  JCHongbaoShowCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/2/29.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCWMyHongbaoBall.h"
NS_ASSUME_NONNULL_BEGIN



@interface JCHongbaoShowCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UIImageView *hbIconImgView;

@property (nonatomic,strong) UIImageView *indicateImgView;

@property (nonatomic,strong) JCWMyHongbaoBall *model;

@end

NS_ASSUME_NONNULL_END
