//
//  JNMatchZS_JC_BF_InfoStyleTwoCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/8.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JNMatchZS_JC_BF_InfoStyleTwoCell.h"
#import "JNMatchZS_JC_BF_ItemView.h"
@implementation JNMatchZS_JC_BF_InfoStyleTwoCell

- (void)initViews {
    UIView *bgView = [UIView new];
    bgView.backgroundColor = JCWhiteColor;
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.right.offset(0);
        make.top.bottom.offset(0);
    }];
    NSArray *titleArray = @[@"4:2",@"5:0",@"5:1",@"5:2",@"胜其他",@"",@"",@""];
    for (int i=0; i<titleArray.count; i++) {
        JNMatchZS_JC_BF_ItemView *itemView = [JNMatchZS_JC_BF_ItemView new];
        itemView.tag = 100+i;
        itemView.titleLab.text = titleArray[i];
        [bgView addSubview:itemView];
        [self.btnArray addObject:itemView];
    }
    float width =  (SCREEN_WIDTH-AUTO(30))/8.0f;
    [self.btnArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedItemLength:width+AUTO(2) leadSpacing:0 tailSpacing:0];
    [self.btnArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(AUTO(44));
    }];
}

- (void)setModel:(JNMatchBFBall *)model {
    _model = model;
    [self.btnArray enumerateObjectsUsingBlock:^(JNMatchZS_JC_BF_ItemView *view, NSUInteger idx, BOOL * _Nonnull stop) {
        switch (view.tag) {
            case 100:
            {
                view.contentLab.text = model.s42;
            }
                break;
            case 101:
            {
                view.contentLab.text = model.s50;
            }
                break;
            case 102:
            {
                view.contentLab.text = model.s51;
            }
                break;
            case 103:
            {
                view.contentLab.text = model.s52;
            }
                break;
            case 104:
            {
                view.contentLab.text = model.sw;
            }
                break;

                
            default:
                view.contentLab.text = @"";
                break;
        }
    }];
}

- (NSMutableArray *)btnArray {
    if (!_btnArray) {
        _btnArray = [NSMutableArray array];
    }
    return _btnArray;
}

@end
