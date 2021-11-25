//
//  JCTransactionDataModelDetailMatchView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/12.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCKellyDataDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCTransactionDataModelDetailMatchView : JCBaseView

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UIImageView *resultImgView;

@property (nonatomic,strong) UIImageView *homeImgView;

@property (nonatomic,strong) UIImageView *awayImgView;

@property (nonatomic,strong) UILabel *homeNameLab;

@property (nonatomic,strong) UILabel *awayNameLab;

@property (nonatomic,strong) UILabel *scoreLab;

@property (nonatomic,strong) UILabel *statusLab;

@property (nonatomic,strong) UILabel *homeRankLab;

@property (nonatomic,strong) UILabel *awayRankLab;

@property (nonatomic,strong) JCKellyDataDetailModel *model;

@property (nonatomic,strong) NSString *match_id;

@end

NS_ASSUME_NONNULL_END
