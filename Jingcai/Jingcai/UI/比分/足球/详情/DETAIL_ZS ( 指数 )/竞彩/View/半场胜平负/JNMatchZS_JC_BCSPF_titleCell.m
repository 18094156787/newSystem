//
//  JNMatchZS_JC_ZJQ_titleCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/8.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JNMatchZS_JC_BCSPF_titleCell.h"
#import "JNMatchZS_JC_BF_ItemView.h"
@implementation JNMatchZS_JC_BCSPF_titleCell

- (void)initViews {
    UIView *bgView = [UIView new];
    bgView.backgroundColor = JCWhiteColor;
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.right.offset(0);
        make.top.bottom.offset(0);
    }];
    NSArray *titleArray = @[@"胜胜",@"胜平",@"胜负",@"平胜",@"平平",@"平负",@"负胜",@"负平",@"负负"];
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


- (void)setModel:(JNMatchBQCBall *)model {
    _model = model;
    [self.btnArray enumerateObjectsUsingBlock:^(JNMatchZS_JC_BF_ItemView *view, NSUInteger idx, BOOL * _Nonnull stop) {
        switch (view.tag) {
            case 100:
            {
                view.contentLab.text = model.l33;
            }
                break;
            case 101:
            {
                view.contentLab.text = model.l31;
            }
                break;
            case 102:
            {
                view.contentLab.text = model.l30;
            }
                break;
            case 103:
            {
                view.contentLab.text = model.l13;
            }
                break;
            case 104:
            {
               view.contentLab.text = model.l11;
            }
                break;
            case 105:
            {
                view.contentLab.text = model.l10;
            }
                break;
            case 106:
            {
                view.contentLab.text = model.l03;
            }
                break;
            case 107:
            {
                view.contentLab.text = model.l01;
            }
                break;
            case 108:
            {
                view.contentLab.text = model.l00;
            }
                break;

            default:
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
