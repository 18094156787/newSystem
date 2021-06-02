//
//  JCKindScoreItemCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/5/31.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCKindScoreItemCell.h"

@implementation JCKindScoreItemCell

- (void)initViews {

    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(16);
        make.centerY.equalTo(self.contentView);
        make.right.offset(-100);
    }];
    
    [self.contentView addSubview:self.contentLab];
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-16);
        make.centerY.equalTo(self.contentView);
    }];
}

- (void)data {

    self.titleLab.text = @"活动签到";
    self.contentLab.text = @"+10";
}
- (void)setModel:(JCKindGetScoreModel *)model {
    _model = model;
    
    NSString *type = @"";
    if (model.type==1) {
        type = @"签到";
    }
    if (model.type==2) {
        type = @"分享转发";
    }
    if (model.type==3) {
        type = @"好友注册";
    }
    self.titleLab.text = type;
    self.contentLab.text = [NSString stringWithFormat:@"+%@",model.score];
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:16 andWeight:1 andTextColor:UIColorFromRGB(0x252424) andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}

- (UILabel *)contentLab {
    if (!_contentLab) {
        _contentLab = [UILabel initWithTitle:@"" andFont:14 andWeight:1 andTextColor:COLOR_FB5835 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _contentLab;
}
@end
