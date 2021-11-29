//
//  JCTransactionDataModelEmptyCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/26.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCTransactionDataModelEmptyCell.h"

@implementation JCTransactionDataModelEmptyCell

- (void)initViews {
    self.contentView.backgroundColor = JCClearColor;
    self.backgroundColor = JCClearColor;
    UIImageView *imgView = [UIImageView new];
    imgView.image = JCIMAGE(@"jc_dataModel_empty");
    [self.contentView addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(10));
        make.centerX.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(AUTO(204), AUTO(142)));
    }];
    
    UILabel *label = [UILabel initWithTitle:@"当前暂无比赛数据~" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    [self.contentView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imgView.mas_bottom).offset(AUTO(10));
        make.centerX.equalTo(self.contentView);
        make.bottom.offset(AUTO(-10));
    }];
}

@end
