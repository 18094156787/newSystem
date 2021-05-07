//
//  JCHongbangExpertCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/30.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCHongbangExpertCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UIImageView *headImgView;

@property (nonatomic,strong) UILabel *nameLab;

@property (nonatomic,strong) UILabel *fansLab;

@property (nonatomic,strong) UILabel *tag_oneLab;

@property (nonatomic,strong) UILabel *tag_twoLab;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) UILabel *countLab;

@property (nonatomic,strong) UIButton *concernBtn;

@property (nonatomic,strong) JCWExpertBall *model;//大咖

@property (nonatomic,strong) JCWExpertBall *hongBangModel;

@property (nonatomic,copy) void(^JCConcernBlock)(void);

@end

NS_ASSUME_NONNULL_END
