//
//  JNMatchZS_JC_BF_InfoStyleFourCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/8.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JNMatchZS_JC_BF_InfoStyleFourCell.h"
#import "JNMatchZS_JC_BF_ItemView.h"
@implementation JNMatchZS_JC_BF_InfoStyleFourCell

- (void)initViews {
    UIView *bgView = [UIView new];
    bgView.backgroundColor = JCWhiteColor;
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.right.offset(0);
        make.top.bottom.offset(0);
    }];
    
    NSArray *titleArray = @[@"0:1",@"0:2",@"1:2",@"0:3",@"1:3",@"2:3",@"0:4 ",@"1:4"];
    for (int i=0; i<titleArray.count; i++) {
        JNMatchZS_JC_BF_ItemView *itemView = [JNMatchZS_JC_BF_ItemView new];
        itemView.backgroundColor = COLOR_F3F3F3;
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
                view.contentLab.text = model.s01;
            }
                break;
            case 101:
            {
                view.contentLab.text = model.s02;
            }
                break;
            case 102:
            {
                view.contentLab.text = model.s12;
            }
                break;
            case 103:
            {
                view.contentLab.text = model.s03;
            }
                break;
            case 104:
            {
                view.contentLab.text = model.s13;
            }
                break;
            case 105:
            {
                view.contentLab.text = model.s23;
            }
                break;
            case 106:
            {
                view.contentLab.text = model.s04;
            }
                break;
            case 107:
            {
                view.contentLab.text = model.s14;
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
