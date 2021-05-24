//
//  JCActivityDetailHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/23.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCActivityDetailHeadView.h"

@implementation JCActivityDetailHeadView

- (void)initViews {
    [self addSubview:self.imgView];
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self);
        make.bottom.offset(AUTO(-35));
    }];
    
    [self addSubview:self.timeBgView];
    [self.timeBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(16);
        make.right.offset(-16);
        make.bottom.offset(0);
        make.height.mas_equalTo(92);
    }];
    
    UIImageView *timeBgView = [UIImageView new];
    timeBgView.image = JCIMAGE(@"jc_activity_titleBg");
    [self.timeBgView addSubview:timeBgView];
    [timeBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(15);
        make.centerX.equalTo(self.timeBgView);
        make.size.mas_equalTo(CGSizeMake(98, 16));
    }];
    
    [timeBgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    
    [self.timeBgView addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(timeBgView.mas_bottom).offset(16);
        make.centerX.equalTo(self.timeBgView);
    }];
    
    
    
}

- (void)setDetailModel:(JCActivityDetailModel *)detailModel {
    if (!detailModel) {
        return;
    }
    _detailModel = detailModel;
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:detailModel.top_image_url] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        if (!error) {
            float rate = image.size.width/SCREEN_WIDTH;
            float height = image.size.height;
            if (rate>0) {
                height = height/rate;
            }
            

            [self.imgView mas_updateConstraints:^(MASConstraintMaker *make) {
                NSLog(@"图片高度%.0f",image.size.height);
              
                make.height.mas_equalTo(height);//240+25
            }];
            if (self.JCHeightBlock) {
                
                self.JCHeightBlock(height+35);
            }
        }
 
    }];
    self.timeLab.text = [NSString stringWithFormat:@"%@-%@",detailModel.start_time,detailModel.end_time];
}


- (UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [UIImageView new];
//        [_imgView hg_setAllCornerWithCornerRadius:20];
    }
    return _imgView;
}

- (UIView *)timeBgView {
    if (!_timeBgView) {
        _timeBgView = [UIView new];
        _timeBgView.backgroundColor = JCWhiteColor;
        [_timeBgView hg_setAllCornerWithCornerRadius:16];
    }
    return _timeBgView;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"活动时间" andFont:16 andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _titleLab;
}

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [UILabel initWithTitle:@"" andFont:16 andWeight:1 andTextColor:[COLOR_2F2F2F colorWithAlphaComponent:0.8] andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _timeLab;
}

@end
