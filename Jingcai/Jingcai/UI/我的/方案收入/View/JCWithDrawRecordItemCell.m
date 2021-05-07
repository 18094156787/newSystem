//
//  JCWithDrawRecordItemCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/24.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWithDrawRecordItemCell.h"

@implementation JCWithDrawRecordItemCell

- (void)initViews {
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.contentView addSubview:self.contentLabel];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self.contentView);
    }];
}

- (void)setContent:(NSString *)content {
    _content = content;
    float value = [content floatValue];
//    NSNumber *number = @(value);
     self.contentLabel.text = [NSString stringWithFormat:@"¥%.2f",value];
    if (self.showAttr) {
        self.contentLabel.textColor = JCBaseColor;
    }else{
        self.contentLabel.textColor = COLOR_2F2F2F;
    }
    

}



- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLabel;
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _contentLabel;
}
@end
