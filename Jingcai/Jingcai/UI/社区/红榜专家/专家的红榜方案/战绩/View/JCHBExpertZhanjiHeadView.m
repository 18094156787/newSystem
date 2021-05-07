//
//  JCHBExpertZhanjiHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/19.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCHBExpertZhanjiHeadView.h"

@implementation JCHBExpertZhanjiHeadView

- (void)initViews {
    self.backgroundColor = JCWhiteColor;
    [self addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(self);
    }];
    
    [self addSubview:self.reduLab];
    [self.reduLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-10));
        make.centerY.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(AUTO(50), AUTO(40)));
    }];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = COLOR_DDDDDD;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.reduLab.mas_left);
        make.centerY.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(1, 8.5));
    }];
    
    self.lineView = lineView;
    
    [self addSubview:self.huibaoLab];
    [self.huibaoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(lineView.mas_left);
        make.centerY.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(AUTO(50), AUTO(40)));
    }];
    
    
    WeakSelf;
    [self.huibaoLab bk_whenTapped:^{
        weakSelf.huibaoLab.textColor = JCBaseColor;
        weakSelf.reduLab.textColor = COLOR_999999;
        if (weakSelf.JCHeadBlock) {
            weakSelf.JCHeadBlock(@"1");
        }
    }];
    
    [self.reduLab bk_whenTapped:^{
        weakSelf.huibaoLab.textColor = COLOR_999999;
        weakSelf.reduLab.textColor = JCBaseColor;
        if (weakSelf.JCHeadBlock) {
            weakSelf.JCHeadBlock(@"2");
        }
    }];
    
}


//- (void)setDataDic:(NSDictionary *)dataDic {
//    _dataDic = dataDic;
//    NSArray *hbArray = dataDic[@"profit"];
//    NSArray *mzArray = dataDic[@"target"];
//    if (hbArray.count==0||mzArray.count==0) {
//        self.lineView.hidden = YES;
//        if (hbArray.count==0) {
//            [self.huibaoLab mas_remakeConstraints:^(MASConstraintMaker *make) {
//                make.size.mas_equalTo(CGSizeMake(0, 0));
//            }];
//            self.reduLab.textColor = JCBaseColor;
//        }
//        if (mzArray.count==0) {
//            self.reduLab.textColor = JCBaseColor;
//            [self.huibaoLab mas_remakeConstraints:^(MASConstraintMaker *make) {
//                make.right.offset(AUTO(-15));
//                make.centerY.equalTo(self);
//                make.size.mas_equalTo(CGSizeMake(AUTO(50), AUTO(40)));
//            }];
//        }
//
//
//    }
//}

- (void)setMzArray:(NSArray *)mzArray {
    _mzArray = mzArray;
    if (self.yllArray.count==0||self.mzArray.count==0) {
        self.lineView.hidden = YES;
        if (self.yllArray.count==0) {
            [self.huibaoLab mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(0, 0));
            }];
            self.reduLab.textColor = JCBaseColor;
        }
        if (self.mzArray.count==0) {
            self.reduLab.textColor = JCBaseColor;
            [self.huibaoLab mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.right.offset(AUTO(-15));
                make.centerY.equalTo(self);
                make.size.mas_equalTo(CGSizeMake(AUTO(50), AUTO(40)));
            }];
        }
        
        
    }

}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"战绩概况" andFont:AUTO(17) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}

- (UILabel *)huibaoLab {
    if (!_huibaoLab) {
        _huibaoLab = [UILabel initWithTitle:@"盈利率" andFont:AUTO(12) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _huibaoLab.userInteractionEnabled = YES;
    }
    return _huibaoLab;
}

- (UILabel *)reduLab {
    if (!_reduLab) {
        _reduLab = [UILabel initWithTitle:@"命中率" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _reduLab.userInteractionEnabled = YES;
    }
    return _reduLab;
}

@end
