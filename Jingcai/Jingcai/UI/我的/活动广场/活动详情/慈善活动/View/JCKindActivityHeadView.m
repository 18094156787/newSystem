//
//  JCKindActivityHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/5/31.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCKindActivityHeadView.h"

@implementation JCKindActivityHeadView

- (void)initViews {
    [self addSubview:self.bgImgView];
    [self.bgImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
}
- (void)setDetailModel:(JCActivityDetailModel *)detailModel {
    if (!detailModel) {
        return;
    }
    _detailModel = detailModel;
    [self.bgImgView sd_setImageWithURL:[NSURL URLWithString:detailModel.top_image_url] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        float rate = image.size.width/SCREEN_WIDTH;
        float height = image.size.height;
        if (rate>0) {
            height = height/rate;
        }
        
        if (self.JCHeightBlock) {
            
            self.JCHeightBlock(height);
        }
    }];
//    self.timeLab.text = [NSString stringWithFormat:@"%@-%@",detailModel.start_time,detailModel.end_time];
}

- (UIImageView *)bgImgView {
    if (!_bgImgView) {
        _bgImgView = [UIImageView new];
    }
    return _bgImgView;
}
@end
