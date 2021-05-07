//
//  JCPlaneDetailImageCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2019/8/13.
//  Copyright © 2019年 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCPlaneDetailImageCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UIImageView *imgView;

//@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,assign) BOOL showInfo;

@property (nonatomic,strong) NSString *img;

@end

NS_ASSUME_NONNULL_END
