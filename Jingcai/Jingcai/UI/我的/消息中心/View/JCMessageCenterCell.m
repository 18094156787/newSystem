//
//  JCMessageCenterCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/18.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCMessageCenterCell.h"
@implementation JCMessageCenterCell

- (void)initViews {
    UIView *bgView = [UIView new];
    bgView.backgroundColor = JCWhiteColor;
    [bgView hg_setAllCornerWithCornerRadius:5];
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(AUTO(8), AUTO(12), 0, AUTO(12)));
    }];
    
    [bgView addSubview:self.iconImgView];
    [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.offset(AUTO(15));
        make.size.mas_equalTo(CGSizeMake(AUTO(2), AUTO(16)));
    }];
    
    [bgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImgView.mas_right).offset(AUTO(8));
        make.centerY.equalTo(self.iconImgView);
        make.right.offset(AUTO(-150));
    }];
    
    [bgView addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self.iconImgView);
        make.width.mas_equalTo(AUTO(130));
    }];
    
    [bgView addSubview:self.contentLab];
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconImgView.mas_bottom).offset(AUTO(15));
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
//        make.bottom.offset(AUTO(-15));
    }];
    
    [bgView addSubview:self.reasonLab];
    [self.reasonLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentLab.mas_bottom).offset(AUTO(15));
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
    }];
    
    [bgView addSubview:self.sureLab];
    [self.sureLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.reasonLab.mas_bottom);
        make.right.offset(AUTO(-15));
        make.height.mas_equalTo(AUTO(25));
        make.bottom.equalTo(bgView).offset(AUTO(-10));
    }];

}

- (void)setModel:(JCMeaasgeModel *)model {
    _model = model;
    self.titleLab.text = model.title;
    self.timeLab.text = model.created_at;
    self.contentLab.text = model.content;

    
    
    
    
    if (model.error.length>0) {
        self.reasonLab.text = model.error;
        if ([model.type integerValue]==2||[model.type integerValue]==10) {
            self.reasonLab.text = [NSString stringWithFormat:@"拒绝理由: %@",model.error];
        }
        if ([model.type_class integerValue]==2) {
            self.reasonLab.text = [NSString stringWithFormat:@"禁用理由: %@",model.error];
        }
        if ([model.type integerValue]==1) {
            self.reasonLab.text = @"";
        }
        
    }else {
        self.reasonLab.text = @"";
    }
    


    

    self.sureLab.text = @"";
    
    

    
    if (([model.type_class integerValue]==4)) {
        self.sureLab.text= @"前往确认";
        [self.sureLab mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.offset(AUTO(-10));
        }];
    }
    else if (([model.type_class integerValue]==9)) {
        self.sureLab.text= @"去查看";
        [self.sureLab mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.offset(AUTO(-10));
        }];
    }
    else{
        if (model.error.length>0&&[model.status integerValue]!=3) {
             self.sureLab.text= @"前往修改";
            if ([model.type integerValue]==1) {
                self.sureLab.text= @"前往查看";
            }
            [self.sureLab mas_updateConstraints:^(MASConstraintMaker *make) {
                make.bottom.offset(AUTO(-10));
            }];
        }else{
            [self.sureLab mas_updateConstraints:^(MASConstraintMaker *make) {
                make.bottom.offset(AUTO(10));
            }];
        }
    }
    if (([model.type_class integerValue]==8&&[model.status integerValue]!=3)) {
       self.sureLab.text= @"前往查看";
       [self.sureLab mas_updateConstraints:^(MASConstraintMaker *make) {
           make.bottom.offset(AUTO(-10));
       }];
   }
    
    
    if (([model.type integerValue]>=12&&[model.type integerValue]<=15&&[model.status integerValue]!=3)) {
       self.sureLab.text= @"前往活动";
       [self.sureLab mas_updateConstraints:^(MASConstraintMaker *make) {
           make.bottom.offset(AUTO(-10));
       }];
   }
    if (([model.type_class integerValue]==17&&[model.status integerValue]!=3)) {
       self.sureLab.text= @"前往查看";
       [self.sureLab mas_updateConstraints:^(MASConstraintMaker *make) {
           make.bottom.offset(AUTO(-10));
       }];
   }

}

- (UIView *)iconImgView {
    if (!_iconImgView) {
        _iconImgView = [UIView new];
        _iconImgView.backgroundColor = JCBaseColor;
    }
    return _iconImgView;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(16) andWeight:2 andTextColor:COLOR_1B1B1B andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentRight];
    }
    return _timeLab;
}

- (UILabel *)contentLab {
    if (!_contentLab) {
        _contentLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
        _contentLab.numberOfLines = 0;
    }
    return _contentLab;
}

- (UILabel *)reasonLab {
    if (!_reasonLab) {
        _reasonLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
        _reasonLab.numberOfLines = 0;
    }
    return _reasonLab;
}

- (UILabel *)sureLab {
    if (!_sureLab) {
        _sureLab = [UILabel initWithTitle:@"前往确认" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_057AFF andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentRight];
    }
    return _sureLab;
}


@end
