//
//  JCMatchDetailZBCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/10/23.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCMatchDetailZBCell.h"

@implementation JCMatchDetailZBCell

- (void)initViews {
    self.backgroundColor = COLOR_F0F0F0;
    [self addSubview:self.iconImgView];
    [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(8));
        make.centerY.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(AUTO(16), AUTO(16)));
    }];
    
    [self addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImgView.mas_right).offset(2);
        make.centerY.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(AUTO(10), AUTO(16)));
    }];
    
    [self addSubview:self.contentBgView];
    [self.contentBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(12));
        make.left.equalTo(self.timeLab.mas_right);
        make.right.offset(AUTO(-8));
        make.bottom.offset(0);
    }];
    
    [self.contentBgView addSubview:self.contentLab];
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-45));
        make.top.offset(AUTO(10));
        make.bottom.offset(AUTO(-10));
    }];
    
    [self.contentBgView addSubview:self.scoreLab];
    [self.scoreLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-8));
        make.centerY.equalTo(self.contentBgView);
    }];
}

- (void)setLiveBall:(JNMatchLiveBall *)liveBall {
    _liveBall = liveBall;
    self.iconImgView.image = [JCWConvertTool imageWithColor:[UIColor groupTableViewBackgroundColor]];
    self.contentLab.text = NonNil(liveBall.data);
//    self.timeLab.text = liveBall.time;
    self.timeLab.text = @"";
    if (liveBall.type==10||liveBall.type==11||liveBall.type==12) {
         _contentBgView.layer.borderColor = COLOR_DBDBDB.CGColor;
         _contentBgView.backgroundColor = JCClearColor;
     }else{
         _contentBgView.layer.borderColor = JCClearColor.CGColor;
         _contentBgView.backgroundColor = JCWhiteColor;
     }
    //10,11,12,26,27
    if ((liveBall.type >= 10 && liveBall.type <= 12) || (liveBall.type >= 26 && liveBall.type <= 27) ) {
        self.iconImgView.image = [UIImage imageNamed:@"match_live_10-12_26-27"];
        if (liveBall.type == 11) {
            self.iconImgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"match_live_%ld",liveBall.type]];
        }
//        self.iconImgView.image = JCIMAGE(@"match_live_8");
        return ;
    }
    //19-25
    if (liveBall.type >= 19 && liveBall.type <= 25) {
        self.iconImgView.image = [UIImage imageNamed:@"match_live_19-25"];
        return ;
    }
    //其它
    self.iconImgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"match_live_%ld",liveBall.type]];
 
    
 

}


- (UIImageView *)iconImgView {
    if (!_iconImgView) {
        _iconImgView = [UIImageView new];
    }
    return _iconImgView;
}

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [UILabel initWithTitle:@"" andFont:AUTO(13) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];;
    }
    return _timeLab;
}

- (UIView *)contentBgView {
    if (!_contentBgView) {
        _contentBgView = [UIView new];
        _contentBgView.backgroundColor = JCWhiteColor;
        _contentBgView.layer.cornerRadius = AUTO(4);
        _contentBgView.layer.masksToBounds = YES;
        _contentBgView.layer.borderColor = COLOR_DBDBDB.CGColor;
        _contentBgView.layer.borderWidth = 0.5;
    }
    return _contentBgView;
}

- (UILabel *)contentLab {
    if (!_contentLab) {
        _contentLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
        _contentLab.numberOfLines = 2;
    }
    return _contentLab;
}

- (UILabel *)scoreLab {
    if (!_scoreLab) {
        _scoreLab = [UILabel initWithTitle:@"" andFont:AUTO(13) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];;
    }
    return _scoreLab;
}

@end
