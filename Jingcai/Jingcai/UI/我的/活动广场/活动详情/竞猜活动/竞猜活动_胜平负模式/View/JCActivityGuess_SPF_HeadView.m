//
//  JCActivityGuess_SPF_HeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/6/28.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCActivityGuess_SPF_HeadView.h"

@implementation JCActivityGuess_SPF_HeadView

- (void)initViews {
    [self addSubview:self.bgImgView];
    [self.bgImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    
    [self addSubview:self.countLab];
    [self.countLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(16);
        make.right.offset(0);
        make.height.mas_equalTo(24);
    }];
    

}

- (void)setDetailModel:(JCActivityDetailModel *)detailModel {
    if (!detailModel) {
        return;
    }
    _detailModel = detailModel;
    self.countLab.text = [NSString stringWithFormat:@"已有%@人参与",self.detailModel.participation];
    if ([detailModel.prize integerValue]>1&&self.detailModel.number_of_correct.length>0) {
        self.countLab.text = [NSString stringWithFormat:@"已有%@人参与 | 猜对%@人",self.detailModel.participation,self.detailModel.number_of_correct];
    }
    self.countLab.hidden = [self.detailModel.participation integerValue]>0?NO:YES;
    
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
        _bgImgView.userInteractionEnabled = YES;
    }
    return _bgImgView;
}

- (KKPaddingLabel *)countLab {
    if (!_countLab) {
        _countLab = [KKPaddingLabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:[JCWhiteColor colorWithAlphaComponent:0.3] andTextAlignment:NSTextAlignmentCenter];
        [_countLab hg_setCornerOnLeftWithRadius:14];
        _countLab.padding = UIEdgeInsetsMake(0, 8, 0, 8);
    }
    return _countLab;
}
@end
