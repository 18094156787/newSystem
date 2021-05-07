//
//  JNMatchZS_JC_ZJQ_infoCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/8.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JNMatchZS_JC_BCSPF_infoCell.h"

@implementation JNMatchZS_JC_BCSPF_infoCell

- (void)initViews {
    UIView *bgView = [UIView new];
    bgView.backgroundColor = COLOR_F3F3F3;
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.right.offset(0);
        make.top.bottom.offset(0);
    }];

    for (int i=0; i<9; i++) {
        UILabel *label = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        label.tag = 100+i;
        [bgView addSubview:label];
        [self.btnArray addObject:label];
    }
    
    [self.btnArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedItemLength:AUTO(43) leadSpacing:0 tailSpacing:0];
    [self.btnArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(AUTO(22));
    }];
}

- (void)setModel:(JNMatchBQCBall *)model {
    _model = model;
    [self.btnArray enumerateObjectsUsingBlock:^(UILabel *label, NSUInteger idx, BOOL * _Nonnull stop) {
        switch (label.tag) {
            case 100:
            {
                label.text = model.ss;
            }
                break;
            case 101:
            {
                label.text = model.sp;
            }
                break;
            case 102:
            {
                label.text = model.sf;
            }
                break;
            case 103:
            {
                label.text = model.ps;
            }
                break;
            case 104:
            {
               label.text = model.pp;
            }
                break;
            case 105:
            {
                label.text = model.pf;
            }
                break;
            case 106:
            {
                label.text = model.fs;
            }
                break;
            case 107:
            {
                label.text = model.fp;
            }
                break;
            case 108:
            {
                label.text = model.ff;
            }
                break;

            default:
                break;
        }
    }];
}

//- (void)setModel:(JNMatchJQBall *)model {
//    _model = model;

//}

- (NSMutableArray *)btnArray {
    if (!_btnArray) {
        _btnArray = [NSMutableArray array];
    }
    return _btnArray;
}


@end
