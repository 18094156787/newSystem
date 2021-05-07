//
//  JCMatchDetailZBCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/10/23.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JNMatchLiveBall.h"
#import "JCWConvertTool.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCMatchDetailZBCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UIImageView *iconImgView;

@property (nonatomic,strong) UILabel *timeLab;

@property (nonatomic,strong) UIView *contentBgView;

@property (nonatomic,strong) UILabel *contentLab;

@property (nonatomic,strong) UILabel *scoreLab;

@property (nonatomic, strong) JNMatchLiveBall * liveBall;

@end

NS_ASSUME_NONNULL_END
