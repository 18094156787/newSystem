//
//  JCMatchFilterSegmentCurrentView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/26.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCMatchFilterSegmentCurrentView.h"

@implementation JCMatchFilterSegmentCurrentView

- (void)initViews {
    [self addSubview:self.backImgView];
    self.backImgView.frame = CGRectMake(0, 0, 64, 32);
    
    [self.backImgView addSubview:self.currentBtn];
    self.currentBtn.frame = CGRectMake(0, 0, 64, 32);
    self.currentBtn.centerY = self.backImgView.centerY;

    
}

- (UIImageView *)backImgView {
    if (!_backImgView) {
        _backImgView = [UIImageView new];
        _backImgView.userInteractionEnabled = YES;
        [_backImgView hg_setCornerOnLeftWithRadius:16];
        _backImgView.backgroundColor = JCBaseColor;
    }
    return _backImgView;
}

- (void)btnClick:(UIButton *)sender {
    if (self.JCBlock) {
        self.JCBlock();
    }

     
}

- (UIButton *)currentBtn {
    if (!_currentBtn) {
        _currentBtn = [UIButton initWithText:@"全部" FontSize:AUTO(14) Weight:2 BackGroundColor:JCClearColor TextColors:JCWhiteColor];
        [_currentBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
//        [_currentBtn setBackgroundImage:JCIMAGE(@"ic_fileter_match") forState:0];
//        [_currentBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 10)];
    }
    return _currentBtn;
}

- (void)setIndex:(NSInteger)index {
    _index = index;
    if (index==0) {
        [_currentBtn setTitle:@"全部" forState:0];
    }else if(index==1){
        [_currentBtn setTitle:@"热门" forState:0];
    }else if(index==2){
        [_currentBtn setTitle:@"竞足" forState:0];
    }else {
        [_currentBtn setTitle:@"北单" forState:0];
    }
}

@end
