//
//  JCHistoryPayDataModelDetailHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/29.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCHistoryPayDataModelDetailHeadView.h"

@implementation JCHistoryPayDataModelDetailHeadView

- (void)initViews {
    self.backgroundColor = JCWhiteColor;
    
    self.bgView = [[UIImageView alloc] init];
    self.bgView.userInteractionEnabled = YES;
    self.bgView.image = JCIMAGE(@"ic_dataModel_nav_img_black");
//    self.bgView.backgroundColor = JCWhiteColor;
//    [self.bgView hg_setAllCornerWithCornerRadius:AUTO(5)];
    self.bgView.frame = CGRectMake(0,0,SCREEN_WIDTH,AUTO(172)+kNavigationBarHeight);
    [self addSubview:self.bgView];
    

    
    UIButton *backBtn = [UIButton new];
    [self.bgView addSubview:backBtn];
    [backBtn setImage:JCIMAGE(@"common_title_back_white_bold") forState:0];
    [backBtn setImage:JCIMAGE(@"common_title_back_white_bold") forState:UIControlStateHighlighted];
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(5);
        make.top.offset(StatusBar_HEIGHT);
        make.width.height.mas_equalTo(44);
    }];
    
    
    UILabel *titleLab = [UILabel initWithTitle:@"同赔分析" andFont:AUTO(16) andWeight:2 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    [self.bgView addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.centerY.equalTo(backBtn);
    }];

    [self addSubview:self.matchView];
    [self.matchView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(16)+kNavigationBarHeight);
        make.left.offset(AUTO(16));
        make.right.offset(AUTO(-16));
        make.height.mas_equalTo(AUTO(216));
    }];
    self.matchView.layer.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0].CGColor;
    self.matchView.layer.cornerRadius = 8;
    self.matchView.layer.shadowColor = [UIColor colorWithRed:78/255.0 green:83/255.0 blue:99/255.0 alpha:0.16].CGColor;
    self.matchView.layer.shadowOffset = CGSizeMake(0,8);
    self.matchView.layer.shadowOpacity = 1;
    self.matchView.layer.shadowRadius = 16;
    
    WeakSelf;
    [backBtn bk_whenTapped:^{
        [[weakSelf getViewController].navigationController popViewControllerAnimated:YES];
    }];
}
- (void)setMatch_id:(NSString *)match_id {
    _match_id = match_id;
    self.matchView.match_id = match_id;
}

- (void)setModel_id:(NSString *)model_id {
    _model_id = model_id;
    self.matchView.model_id = model_id;
    
}

- (void)setModel:(JCKellyDataDetailModel *)model {
    _model = model;
    self.matchView.model = model;
    if (model.competition_type!=1) {
        self.bgView.frame = CGRectMake(0,0,SCREEN_WIDTH,AUTO(152)+kNavigationBarHeight);
        [self.matchView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(AUTO(200));
        }];
    }
    
}
- (JCHistoryPayDataModelDetailMatchView *)matchView {
    if (!_matchView) {
        _matchView = [JCHistoryPayDataModelDetailMatchView new];
//        _matchView.bottomView.hidden = YES;
    }
    return _matchView;
}

@end
