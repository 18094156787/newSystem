//
//  JCPostPlanHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2019/12/25.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCPostPlanHeadView.h"
#import "UITextView+Placeholder.h"
@implementation JCPostPlanHeadView

- (void)initViews {
    self.backgroundColor = COLOR_F6F6F6;
    UIView *bgView = [UIView new];
    bgView.backgroundColor = JCWhiteColor;
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 0, 1, 0));
    }];
    self.bgView = bgView;
    
    UILabel *titleLab = [UILabel initWithTitle:@"标题（必填，限制在40个字）" andFont:AUTO(16) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
    [bgView addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.offset(AUTO(12));
        make.height.mas_equalTo(AUTO(16));
    }];
    
    

    [bgView addSubview:self.titleTFView];
    [self.titleTFView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(10));
        make.right.offset(AUTO(-10));
        make.top.equalTo(titleLab.mas_bottom).offset(0);
        make.bottom.offset(AUTO(-10));
    }];

    [bgView addSubview:self.numLab];
    [self.numLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-10));
        make.bottom.offset(AUTO(-10));
    }];
    
    WeakSelf;
    [self.titleTFView.rac_textSignal subscribeNext:^(id x) {
        
        if (weakSelf.titleTFView.text.length > 40) {
            weakSelf.titleTFView.text = [weakSelf.titleTFView.text substringToIndex:40];
        }
        weakSelf.numLab.text = [NSString stringWithFormat:@"%ld/40",weakSelf.titleTFView.text.length];
        if (weakSelf.titleTFView.text.length==0) {
            weakSelf.titleTFView.textColor = COLOR_333333;
        }
        if (weakSelf.JCContentBlock) {
            weakSelf.JCContentBlock(x);
        }

    }];


}

- (void)updateBgView {
    [self.bgView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}


- (UITextView *)titleTFView {
    if (!_titleTFView) {
        _titleTFView = [UITextView new];
        _titleTFView.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(16)];
    }
    return _titleTFView;
}

- (UILabel *)numLab {
    if (!_numLab) {
        _numLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _numLab;
}

//- (UILabel *)countLab {
//    if (!_countLab) {
//        _countLab = [UILabel initWithTitle:@"0/300" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
//    }
//    return _countLab;
//}

@end
