//
//  JCPostPlanMatchTypeSelecView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/4.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCPostPlanMatchTypeSelecView.h"
#import "JCPostPlanVC.h"
@implementation JCPostPlanMatchTypeSelecView


- (void)initViews {

    if (self.isAddArticle) {
        //添加审核认证,不计算发布次数
        [self showSelTypeView];
    }else{
        if ([[JCWUserBall currentUser].fabu_count integerValue]>0) {
            [self showSelTypeView];
        }else{
 
            [self showNoDataView];
        }
    }
    
    self.backgroundColor = [JCBlackColor colorWithAlphaComponent:0.5];
//    [self initViews];
    
    
    
//    [self showSelTypeView];
    
    
    

    [self configPostCount];
    

    
}

- (void)setIsAddArticle:(BOOL)isAddArticle {
    _isAddArticle = isAddArticle;
    if (isAddArticle) {
        [self removeAllSubviews];
        [self showSelTypeView];
    }
}


//剩余发布次数
- (void)configPostCount {
    if ([JCWUserBall currentUser].fabu_count) {
        NSString *countStr = [NSString stringWithFormat:@"今日还可发布 %@ 篇达人方案",[JCWUserBall currentUser].fabu_count];
        NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:countStr];
        NSRange range = [countStr rangeOfString:[JCWUserBall currentUser].fabu_count];
        if (range.location!=NSNotFound) {
            [attributedStr setAttributes:@{NSForegroundColorAttributeName:JCBaseColor,NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Semibold" size:AUTO(23)]} range:range];
            self.fbCountLab.attributedText = attributedStr;
        }
    }
}

- (void)showNoDataView {
    UIImageView *nodateView = [UIImageView new];
    nodateView.image = JCIMAGE(@"nodata_fangan");
    [self addSubview:nodateView];
    [nodateView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(90)+kNavigationBarHeight);
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(AUTO(263), AUTO(210)));
    }];
    UILabel *label = [UILabel initWithTitle:@"今日已达发布上限，明天再来吧~" andFont:AUTO(13) andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];;
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(nodateView.mas_bottom);
    }];
    
    UIButton *closeBtn = [UIButton new];
    [closeBtn setImage:JCIMAGE(@"mine_close_white") forState:0];
    [closeBtn setImage:JCIMAGE(@"mine_close_white") forState:UIControlStateHighlighted];
    [self addSubview:closeBtn];
    [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(label.mas_bottom).offset(30);
        make.width.height.mas_equalTo(AUTO(50));
    }];
    WeakSelf;
    [closeBtn bk_whenTapped:^{
        [weakSelf removeFromSuperview];
    }];
}

- (void)showSelTypeView {
 
    UILabel *opLab = [UILabel initWithTitle:@"竞足" andFont:AUTO(20) andWeight:2 andTextColor:JCWhiteColor andBackgroundColor:JCBaseColor andTextAlignment:NSTextAlignmentCenter];
    opLab.userInteractionEnabled = YES;
    [self addSubview:opLab];
    [opLab hg_setAllCornerWithCornerRadius:60];
    [opLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.offset(kNavigationBarHeight);
        make.width.height.mas_equalTo(120);
    }];

    
    UILabel *ypLab = [UILabel initWithTitle:@"让球" andFont:AUTO(20) andWeight:2 andTextColor:JCWhiteColor andBackgroundColor:COLOR_002868 andTextAlignment:NSTextAlignmentCenter];
    ypLab.userInteractionEnabled = YES;
    [ypLab hg_setAllCornerWithCornerRadius:60];
    [self addSubview:ypLab];
    [ypLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(opLab.mas_bottom).offset(AUTO(40));
        make.width.height.mas_equalTo(120);
    }];
 
    
    UILabel *dxqLab = [UILabel initWithTitle:@"进球数" andFont:AUTO(20) andWeight:2 andTextColor:JCWhiteColor andBackgroundColor:COLOR_30B27A andTextAlignment:NSTextAlignmentCenter];
    dxqLab.userInteractionEnabled = YES;
    [dxqLab hg_setAllCornerWithCornerRadius:60];
    [self addSubview:dxqLab];
    [dxqLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(ypLab.mas_bottom).offset(AUTO(40));
        make.width.height.mas_equalTo(120);
    }];
    
    [self addSubview:self.fbCountLab];
    [self.fbCountLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(dxqLab.mas_bottom).offset(40);
    }];
    
    
    UIButton *closeBtn = [UIButton new];
    [closeBtn setImage:JCIMAGE(@"mine_close_white") forState:0];
    [closeBtn setImage:JCIMAGE(@"mine_close_white") forState:UIControlStateHighlighted];
    [self addSubview:closeBtn];
    [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.fbCountLab.mas_bottom).offset(30);
        make.width.height.mas_equalTo(AUTO(50));
    }];
    WeakSelf;
    [closeBtn bk_whenTapped:^{
        [weakSelf removeFromSuperview];
    }];
    
    [opLab bk_whenTapped:^{
        [weakSelf pushVCWithType:@"1"];
    }];
    
    [ypLab bk_whenTapped:^{
        [weakSelf pushVCWithType:@"2"];

    }];
    
    [dxqLab bk_whenTapped:^{
        [weakSelf pushVCWithType:@"3"];
    }];
}



- (void)pushVCWithType:(NSString *)type {
//    if (self.isAddArticle&&self.JCPushVCBlick) {
//        self.JCPushVCBlick(type);
//        return;
//    }
//    JCPostPlanVC *vc = [JCPostPlanVC new];
//    vc.type = type;
//    UIViewController *v1 = [self getViewController];
//    [[self getViewController].navigationController pushViewController:vc animated:YES];
    
    if (self.JCPushVCBlick) {
        [self removeFromSuperview];
         self.JCPushVCBlick(type);
         return;
     }
}




-(UILabel *)fbCountLab {
    if (!_fbCountLab) {
        _fbCountLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _fbCountLab;
}

@end
