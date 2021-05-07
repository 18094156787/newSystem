//
//  JCMatchFilterCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/6/16.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCMatchFilterCell.h"
#import "NSArray+Sudoku.h"
#import "JCMatchFilterModel.h"
@implementation JCMatchFilterCell

- (void)initViews {
    [self.contentView addSubview:self.containView];
    [self.containView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
}
- (void)    setDataArray:(NSArray *)dataArray {
    if (!dataArray) {
        return;
    }
    _dataArray = dataArray;
    

    for (int i=0; i<dataArray.count; i++) {
        
        JCMatchFilterModel *model = dataArray[i];
//        model.isSelect = YES;
        UIButton *btn = [UIButton initWithText:model.short_name_zh FontSize:AUTO(14) Weight:1 BackGroundColor:JCClearColor TextColors:COLOR_999999];
        btn.titleLabel.lineBreakMode =  NSLineBreakByTruncatingTail;
        btn.tag = 100+i;
        btn.layer.borderColor = COLOR_DDDDDD.CGColor;
        btn.layer.borderWidth = 0.5;
        btn.layer.cornerRadius = AUTO(5);
        btn.layer.masksToBounds = YES;
        [self.containView addSubview:btn];
        [self.btnArray addObject:btn];
        [btn addTarget:self action:@selector(typeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        if (model.isSelect) {
            btn.layer.borderColor = JCBaseColor.CGColor;
            [btn setTitleColor:JCBaseColor forState:0];
        }else{
            btn.layer.borderColor = COLOR_DDDDDD.CGColor;
            [btn setTitleColor:COLOR_999999 forState:0];
        }
    }
//    NSLog(@"%ld",self.containView.subviews.count);
     float width = (SCREEN_WIDTH-AUTO(60))/3.0f;
    if (dataArray.count>=2) {
           
        [self.containView.subviews mas_distributeSudokuViewsWithFixedItemWidth:width
        fixedItemHeight:AUTO(28)
              warpCount:3
             topSpacing:AUTO(5)
          bottomSpacing:AUTO(10)
            leadSpacing:AUTO(15)
                                                         tailSpacing:AUTO(15)];
    }
    if (dataArray.count==1) {
         UIButton *btn = self.btnArray[0];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(AUTO(15));
            make.top.offset(AUTO(15));
            make.size.mas_equalTo(CGSizeMake(width, AUTO(35)));
        }];
    }

}

- (void)typeBtnClick:(UIButton *)sender {
    JCMatchFilterModel *model = self.dataArray[sender.tag-100];
    model.isSelect =  !model.isSelect;
    [self selectAction];
    if (self.JCSelectBlock) {
        self.JCSelectBlock();
    }
    
}
- (void)selectAction {
    [self.btnArray enumerateObjectsUsingBlock:^(UIButton *btn, NSUInteger idx, BOOL * _Nonnull stop) {
        JCMatchFilterModel *model = self.dataArray[idx];
        if (model.isSelect) {
            btn.layer.borderColor = JCBaseColor.CGColor;
            [btn setTitleColor:JCBaseColor forState:0];
        }else{
            btn.layer.borderColor = COLOR_DDDDDD.CGColor;
            [btn setTitleColor:COLOR_999999 forState:0];
        }
    }];
}


- (UIView *)containView {
    if (!_containView) {
        _containView = [UIView new];
    }
    return _containView;
}

- (NSMutableArray *)btnArray {
    if (!_btnArray) {
        _btnArray = [NSMutableArray array];
    }
    return _btnArray;
}

@end
