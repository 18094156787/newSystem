//
//  JCBasketBallMatchDetailZBCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/4.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JNMatchLiveBall.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCBasketBallMatchDetailZBCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UIView *dianView;

@property (nonatomic,strong) UIView *topLineView;

@property (nonatomic,strong) UIView *bottomLineView;

@property (nonatomic,strong) UILabel *timeLab;

@property (nonatomic,strong) UILabel *contentLab;

@property (nonatomic,strong) UILabel *scoreLab;

@property (nonatomic,assign) BOOL hideTopLine;//隐藏顶部线

@property (nonatomic,strong) JNMatchLiveBall *model;


@end

NS_ASSUME_NONNULL_END
