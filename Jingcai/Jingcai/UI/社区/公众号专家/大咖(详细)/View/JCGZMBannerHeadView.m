//
//  JCGZMBannerHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/8/9.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCGZMBannerHeadView.h"

@implementation JCGZMBannerHeadView

- (void)initViews {
    [self addSubview:self.imgView];
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.offset(0);
        make.height.mas_equalTo(50);
    }];
    
    
    WeakSelf;
    [self.imgView bk_whenTapped:^{
        if (weakSelf.JCClickBlock) {
            weakSelf.JCClickBlock();
        }
    }];
}
- (void)setModel:(JCGZHBannerModel *)model {
    _model = model;
    if (model.img_info[@"img_url"]) {
        [self.imgView sd_setImageWithURL:[NSURL URLWithString:model.img_info[@"img_url"]] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            if (!error) {
                float rate = image.size.width/SCREEN_WIDTH;
                float height = image.size.height;
                if (rate>0) {
                    height = height/rate;
                }
                if (self.JCHeightBlock) {



                    self.JCHeightBlock(height);
                }


                [self.imgView mas_updateConstraints:^(MASConstraintMaker *make) {
                    NSLog(@"图片高度%.0f",image.size.height);

                    make.height.mas_equalTo(height);//240+25
                }];

            }

        }];
    }

}


- (UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [UIImageView new];
//        _imgView.userInteractionEnabled = YES;
    }
    return _imgView;
}
@end
