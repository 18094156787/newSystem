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
    self.backImgView.frame = CGRectMake(0, 0, 55, 46);
    
    [self.backImgView addSubview:self.currentBtn];
    self.currentBtn.frame = CGRectMake(2, 2, 70, 42);
    self.currentBtn.centerY = self.backImgView.centerY;

    
}

- (UIImageView *)backImgView {
    if (!_backImgView) {
        _backImgView = [UIImageView new];
        _backImgView.image = JCIMAGE(@"ic_match_filterSegment_current");
        _backImgView.userInteractionEnabled = YES;
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
        [_currentBtn setBackgroundImage:JCIMAGE(@"ic_fileter_match") forState:0];
        [_currentBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 10)];
    }
    return _currentBtn;
}

- (void)setIndex:(NSInteger)index {
    _index = index;
    if (index==0) {
        [_currentBtn setTitle:@"全部" forState:0];
    }else{
        [_currentBtn setTitle:@"重要" forState:0];
    }
}

@end
