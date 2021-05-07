//
//  JCArticleDetailHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/10.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCArticleDetailHeadViewCell.h"
#import "JCWDateTool.h"
#import "JCFootBallAuthorDetailWMViewController.h"
@implementation JCArticleDetailHeadViewCell

- (void)initViews {
    self.contentView.backgroundColor = JCWhiteColor;
    UIView *topView = [UIView new];
    [self.contentView addSubview:topView];
    topView.backgroundColor = JCWhiteColor;
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.offset(0);
        make.top.offset(0);
    }];
    
    
    
    self.userInfoView = [UIView new];
    self.userInfoView.hidden = YES;
    [topView addSubview:self.userInfoView];
    [self.userInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.offset(0);
        make.height.mas_equalTo(0);
    }];
    
    [self.userInfoView addSubview:self.headView];
    [self.headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(self.userInfoView);
        make.width.height.mas_equalTo(AUTO(40));
    }];
    
    [self.userInfoView addSubview:self.nameLab];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.headView);
        make.left.equalTo(self.headView.mas_right).offset(AUTO(8));
    }];
    
    [self.userInfoView insertSubview:self.userClickView atIndex:0];
    [self.userClickView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(self.headView);
        make.right.equalTo(self.nameLab);
    }];
    
    [self.userInfoView addSubview:self.concernBtn];
    [self.concernBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.headView);
        make.right.offset(AUTO(-15));
        make.size.mas_equalTo(CGSizeMake(AUTO(80), AUTO(30)));
    }];
    

    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = COLOR_F0F0F0;
    [self.userInfoView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.bottom.equalTo(self.userInfoView);
        make.height.mas_equalTo(1);
    }];
    
    [topView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userInfoView.mas_bottom).offset(AUTO(12));
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
    }];
    
    [topView addSubview:self.zhidingView];
    [self.zhidingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(20));
        make.left.offset(AUTO(15));
        make.size.mas_equalTo(CGSizeMake(AUTO(32), AUTO(16)));
//        make.bottom.equalTo(topView.mas_bottom).offset(AUTO(-15));
    }];
    
    [topView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.zhidingView);
        make.left.offset(AUTO(56));
        make.right.offset(AUTO(-15));
        make.bottom.equalTo(topView.mas_bottom).offset(AUTO(-15));
    }];
    
    WeakSelf;
    [self.concernBtn bk_whenTapped:^{
        if (weakSelf.JCConcernBlock) {
            weakSelf.JCConcernBlock();
        }
    }];
    
    [self.userClickView bk_whenTapped:^{
        if (weakSelf.newsDetailBall.user_id.length==0) {
            return;
        }
        JCFootBallAuthorDetailWMViewController *autherVC = [JCFootBallAuthorDetailWMViewController new];
        autherVC.autherID = weakSelf.newsDetailBall.user_id;
        [[weakSelf getViewController].navigationController pushViewController:autherVC animated:YES];
    }];
}

- (void)setNewsDetailBall:(JCWNewsDetailBall *)newsDetailBall {
    _newsDetailBall = newsDetailBall;
    if (!newsDetailBall) {
        return;
    }
    
    if (newsDetailBall.original_type==3) {
        self.userInfoView.hidden = NO;
        [self.userInfoView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(AUTO(60));
        }];
    }else{
        [self.userInfoView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0);
        }];
        self.userInfoView.hidden = YES;
    }
    [self.headView sd_setImageWithURL:[NSURL URLWithString:newsDetailBall.user_img] placeholderImage:JCIMAGE(@"userImg_default")];
    self.nameLab.text = newsDetailBall.user_name;
    
    if ([newsDetailBall.is_subscribe isEqualToString:@"关注"]) {
        [self.concernBtn setTitle:@"+关注" forState:0];
        self.concernBtn.backgroundColor = JCBaseColor;
    }else{
        [self.concernBtn setTitle:@"已关注" forState:0];
        self.concernBtn.backgroundColor = COLOR_9F9F9F;
    }
    
    
    if (newsDetailBall.is_top==0) {
        self.zhidingView.hidden = YES;
        [self.infoLab mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.offset(AUTO(15));
        }];
    }else{
        self.zhidingView.hidden = NO;
        [self.infoLab mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.offset(AUTO(56));
        }];
    }
    
    self.titleLab.text = newsDetailBall.title;


    
    NSString *strig = [NSString stringWithFormat:@"%@",newsDetailBall.created_at];
    if (newsDetailBall.original_type ==1) {
        strig = [NSString stringWithFormat:@"原创    %@ %@ 发布",newsDetailBall.source,newsDetailBall.created_at];
    }
    if (newsDetailBall.original_type ==2&&newsDetailBall.source.length>0) {
        strig = [NSString stringWithFormat:@"转载自: %@     %@ 发布",newsDetailBall.source,newsDetailBall.created_at];
    }
    if (newsDetailBall.original_type ==3) {
        strig = [NSString stringWithFormat:@"%@ 发布",newsDetailBall.created_at];
    }
//    strig = [strig stringByAppendingFormat:[NSString stringWithFormat:@"%@",strig]];

    strig = [strig stringByAppendingString:[NSString stringWithFormat:@"    %@人浏览",newsDetailBall.pageviews]];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:strig];
    if (newsDetailBall.original_type ==1) {
        NSRange range = [strig rangeOfString:@"原创"];
        if (range.location!=NSNotFound) {
            [attr addAttributes:@{NSForegroundColorAttributeName:COLOR_002868} range:range];
        }
    }
    if (newsDetailBall.original_type ==2&&newsDetailBall.source.length>0) {
        NSRange range = [strig rangeOfString:newsDetailBall.source];
        if (range.location!=NSNotFound) {
            [attr addAttributes:@{NSForegroundColorAttributeName:COLOR_002868} range:range];
        }
//        strig = [NSString stringWithFormat:@"转载自: %@     %@ 发布",newsDetailBall.source,newsDetailBall.created_at];
    }
    self.infoLab.attributedText = attr;
    
    
}

- (UIImageView *)headView {
    if (!_headView) {
        _headView = [UIImageView new];
        [_headView hg_setAllCornerWithCornerRadius:AUTO(20)];
    }
    return _headView;
}

- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _nameLab;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(16) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
        _titleLab.numberOfLines = 0;
    }
    return _titleLab;
}

- (UIButton *)concernBtn {
    if (!_concernBtn) {
        _concernBtn = [UIButton initWithText:@"" FontSize:AUTO(14) Weight:2 BackGroundColor:JCBaseColor TextColors:JCWhiteColor];
//        _concernBtn.layer.borderColor = COLOR_FF4642.CGColor;
//        _concernBtn.layer.borderWidth = 0.5;
        _concernBtn.layer.cornerRadius = AUTO(15);
        _concernBtn.layer.masksToBounds = YES;
    }
    return _concernBtn;
}

- (UIImageView *)zhidingView {
    if (!_zhidingView) {
        _zhidingView = [UIImageView new];
        _zhidingView.image = JCIMAGE(@"icon_zhiding");
        _zhidingView.hidden = YES;
    }
    return _zhidingView;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
        
    }
    return _infoLab;
}

- (UIView *)userClickView {
    if (!_userClickView) {
        _userClickView = [UIView new];
        _userClickView.userInteractionEnabled = YES;
    }
    return _userClickView;
}

@end
