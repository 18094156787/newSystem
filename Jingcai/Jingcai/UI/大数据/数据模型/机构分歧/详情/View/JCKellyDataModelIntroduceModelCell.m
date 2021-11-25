//
//  JCKellyDataModelIntroduceModelCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/23.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCKellyDataModelIntroduceModelCell.h"

@implementation JCKellyDataModelIntroduceModelCell

- (void)initViews {
    [self.contentView addSubview:self.contentLab];
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(AUTO(5));
        make.right.offset(AUTO(-15));
        make.bottom.offset(AUTO(-20));
    }];
}

- (UILabel *)contentLab {
    if (!_contentLab) {
        _contentLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_606062 andBackgroundColor:JCClearColor andTextAlignment:0];
        _contentLab.numberOfLines = 0;
    }
    return _contentLab;
}

@end
