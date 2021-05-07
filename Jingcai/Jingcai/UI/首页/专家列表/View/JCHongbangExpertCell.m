//
//  JCHongbangExpertCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/30.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCHongbangExpertCell.h"

@implementation JCHongbangExpertCell

- (void)initViews {
    [self.contentView addSubview:self.headImgView];
    [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(self.contentView);
        make.width.height.mas_equalTo(AUTO(49));
    }];
    
    [self.contentView addSubview:self.countLab];
        [self.countLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.headImgView).offset(-3);
            make.left.equalTo(self.headImgView.mas_right).offset(-15);
            make.width.height.mas_equalTo(18);
        }];
    
    [self.contentView addSubview:self.nameLab];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImgView.mas_right).offset(AUTO(10));
        make.top.equalTo(self.headImgView).offset(AUTO(-5));
        make.right.offset(AUTO(-15));
        make.height.mas_equalTo(AUTO(20));
    }];
    
    [self.contentView addSubview:self.tag_oneLab];
    [self.tag_oneLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLab);
        make.height.mas_equalTo(AUTO(16));
        make.top.equalTo(self.nameLab.mas_bottom).offset(AUTO(4));
    }];

    
    [self.contentView addSubview:self.tag_twoLab];
    [self.tag_twoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.tag_oneLab.mas_right).offset(AUTO(5));
        make.height.mas_equalTo(AUTO(16));
        make.centerY.equalTo(self.tag_oneLab);
    }];
    

    
    [self.contentView addSubview:self.concernBtn];
    [self.concernBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headImgView.mas_centerY);
        make.right.offset(AUTO(-15));
        make.size.mas_equalTo(CGSizeMake(AUTO(80), AUTO(30)));
    }];
    
    [self.contentView addSubview:self.fansLab];
    [self.fansLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.concernBtn);
        make.bottom.equalTo(self.concernBtn.mas_top).offset(-AUTO(10));
    }];
    
    [self.contentView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLab);
        make.height.mas_equalTo(AUTO(16));
        make.right.equalTo(self.concernBtn.mas_left);
        make.bottom.equalTo(self.concernBtn).offset(AUTO(2));
    }];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = COLOR_DDDDDD;
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView);
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.height.mas_equalTo(0.5);
    }];
    
    WeakSelf;
    [self.concernBtn bk_whenTapped:^{
        if (weakSelf.JCConcernBlock) {
            weakSelf.JCConcernBlock();
        }
    }];
    
}

- (void)setModel:(JCWExpertBall *)model {
    _model = model;
    
//    [self.contentView addSubview:self.nameLab];
//    [self.nameLab mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.headImgView).offset(AUTO(-5));
//    }];
    
    self.countLab.text = model.on_sale_count;
    self.countLab.hidden = [model.on_sale_count integerValue]==0?YES:NO;
    
    [self.headImgView sd_setImageWithURL:[NSURL URLWithString:model.user_img] placeholderImage:JCIMAGE(@"ic_hb_default")];
    self.nameLab.text = model.user_name;
    if ([model.mingzhong_rate integerValue]==0) {
        model.mingzhong_rate = @"";
    }

    if ((model.mingzhong_rate.length>0||model.hong>0)&&model.desc.length>0) {
        
        [self.nameLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.headImgView.mas_right).offset(AUTO(10));
            make.top.equalTo(self.headImgView).offset(AUTO(-5));
            make.right.offset(AUTO(-15));
            make.height.mas_equalTo(AUTO(20));
        }];
        
        [self.tag_oneLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLab);
            make.height.mas_equalTo(AUTO(16));
            make.top.equalTo(self.nameLab.mas_bottom).offset(AUTO(4));
        }];
        
        [self.tag_twoLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.tag_oneLab.mas_right).offset(AUTO(5));
            make.height.mas_equalTo(AUTO(16));
            make.centerY.equalTo(self.tag_oneLab);
        }];
        
        [self.infoLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLab);
            make.height.mas_equalTo(AUTO(16));
            make.right.equalTo(self.concernBtn.mas_left);
            make.bottom.equalTo(self.concernBtn).offset(AUTO(2));
        }];
        if (model.mingzhong_rate.length==0&&model.hong>0) {
            [self.tag_twoLab mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.nameLab);
                make.height.mas_equalTo(AUTO(16));
                make.centerY.equalTo(self.tag_oneLab);
            }];
        }
        
    }else if(model.mingzhong_rate.length==0&&model.hong==0&&model.desc.length>0){
        [self.nameLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.headImgView.mas_right).offset(AUTO(10));
            make.bottom.equalTo(self.headImgView.mas_centerY).offset(-AUTO(1));
            make.right.offset(AUTO(-15));
            make.height.mas_equalTo(AUTO(20));
        }];
        
        [self.infoLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLab);
            make.height.mas_equalTo(AUTO(16));
            make.right.equalTo(self.concernBtn.mas_left);
            make.top.equalTo(self.headImgView.mas_centerY).offset(AUTO(1));
        }];
        
    }else if((model.mingzhong_rate.length>0||model.hong>0)&&model.desc.length==0){
        [self.nameLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.headImgView.mas_right).offset(AUTO(10));
            make.bottom.equalTo(self.headImgView.mas_centerY).offset(-AUTO(1));
            make.right.offset(AUTO(-15));
            make.height.mas_equalTo(AUTO(20));
        }];
        
        [self.tag_oneLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLab);
            make.height.mas_equalTo(AUTO(16));
//            make.right.equalTo(self.concernBtn.mas_left);
            make.top.equalTo(self.headImgView.mas_centerY).offset(AUTO(1));
        }];
        
        if (model.mingzhong_rate.length==0) {
            [self.tag_twoLab mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.nameLab);
                make.height.mas_equalTo(AUTO(16));
                make.top.equalTo(self.headImgView.mas_centerY).offset(AUTO(1));
            }];
        }
        
    }
    if (model.mingzhong_rate.length==0&&model.hong==0&&model.desc.length==0) {
        [self.nameLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.headImgView.mas_right).offset(AUTO(10));
            make.centerY.equalTo(self.headImgView);
            make.right.offset(AUTO(-15));
            make.height.mas_equalTo(AUTO(20));
        }];
    }
    
    if (model.mingzhong_rate.length>0) {
        self.tag_oneLab.text =  [NSString stringWithFormat:@" 近10中%@ ",model.mingzhong_rate];
    }else{
        self.tag_oneLab.text = @"";
    }



    if (model.hong>0) {
        self.tag_twoLab.text= [NSString stringWithFormat:@" %ld连红 ",model.hong];
    }else{
        self.tag_twoLab.text = @"";
    }
    
    if (model.fensi.length>0) {
        self.fansLab.text = [NSString stringWithFormat:@"粉丝数 %@",model.fensi];
    }else{
        self.fansLab.text = @"";
    }
    self.infoLab.text = model.desc;
    
    
    if ([model.is_subscribe isEqualToString:@"关注"]) {
        [self.concernBtn setTitle:@"+关注" forState:0];
        
        self.concernBtn.backgroundColor = JCBaseColor;

    }else{
        [self.concernBtn setTitle:model.is_subscribe forState:0];
        self.concernBtn.backgroundColor = COLOR_9F9F9F;

    }

}



- (UIImageView *)headImgView {
    if (!_headImgView) {
        _headImgView = [UIImageView new];
        [_headImgView hg_setAllCornerWithCornerRadius:AUTO(32)];
    }
    return _headImgView;
}

- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _nameLab;
}

- (UILabel *)tag_oneLab {
    if (!_tag_oneLab) {
        _tag_oneLab = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_FF4642 andBackgroundColor:JCClearColor andTextAlignment:0];
        _tag_oneLab.layer.borderColor = COLOR_FF4642.CGColor;
        _tag_oneLab.layer.borderWidth = 0.5;
        _tag_oneLab.layer.cornerRadius = AUTO(7.5);
        _tag_oneLab.layer.masksToBounds = YES;
    }
    return _tag_oneLab;
}

- (UILabel *)tag_twoLab {
    if (!_tag_twoLab) {
        _tag_twoLab = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_FF4642 andBackgroundColor:JCClearColor andTextAlignment:0];
        _tag_twoLab.layer.borderColor = COLOR_FF4642.CGColor;
        _tag_twoLab.layer.borderWidth = 0.5;
        _tag_twoLab.layer.cornerRadius = AUTO(7.5);
        _tag_twoLab.layer.masksToBounds = YES;
    }
    return _tag_twoLab  ;
}


- (UILabel *)fansLab {
    if (!_fansLab) {
        _fansLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _fansLab;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_A7A7A7 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _infoLab;
}

- (UIButton *)concernBtn {
    if (!_concernBtn) {
        _concernBtn = [UIButton initWithText:@"" FontSize:AUTO(14) Weight:2 BackGroundColor:JCClearColor TextColors:JCWhiteColor];
//        _concernBtn.layer.borderColor = COLOR_FF4642.CGColor;
//        _concernBtn.layer.borderWidth = 0.5;
        _concernBtn.layer.cornerRadius = AUTO(15);
        _concernBtn.layer.masksToBounds = YES;
    }
    return _concernBtn;
}
- (UILabel *)countLab {
    if (!_countLab) {
        _countLab = [UILabel initWithTitle:@"" andFont:12 andWeight:2 andTextColor:JCWhiteColor andBackgroundColor:JCBaseColor
                          andTextAlignment:NSTextAlignmentCenter];
        [_countLab hg_setAllCornerWithCornerRadius:9];
    }
    return _countLab;
}
@end
