//
//  JCFanganSaleOutCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/9/27.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCFanganSaleOutCell.h"

@implementation JCFanganSaleOutCell

- (void)initViews {
    UIImageView *imgView = [UIImageView new];
    imgView.image = JCIMAGE(@"jc_fangan_saleOut");
    [self.contentView addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(AUTO(220), AUTO(144)));
        make.top.offset(20);
        make.bottom.offset(-20);
    }];
}

@end
