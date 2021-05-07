//
//  JCTeamMatchInfoZhenRongCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/6.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCTeamMatchInfoZhenRongCell.h"
#import "JCTeamMatchInfoZhenRongItemView.h"
@implementation JCTeamMatchInfoZhenRongCell

- (void)initViews {
//    NSLog(@"宽度%.0f,",self.height);
    self.contentView.backgroundColor = COLOR_F0F0F0;
    float width = SCREEN_WIDTH-AUTO(16);
    UIImageView *imgBgView = [UIImageView new];
    imgBgView.image = JCIMAGE(@"teamMatch_img_bg_zjzr");
    [self addSubview:imgBgView];
    [imgBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(8));
        make.right.offset(AUTO(-8));
        make.top.offset(AUTO(8));
        make.height.mas_equalTo(width);
    }];
    self.bgImgView = imgBgView;
    [self addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.bottom.offset(0);
        make.top.equalTo(imgBgView.mas_bottom);
    }];
    

}

- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    [self.bgImgView removeAllSubviews];
    float width = (SCREEN_WIDTH-AUTO(16));
    [dataArray enumerateObjectsUsingBlock:^(JCTeamMatchPlayerModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        JCTeamMatchInfoZhenRongItemView *itemView = [JCTeamMatchInfoZhenRongItemView new];
        CGFloat x = [obj.location_x floatValue] * 0.01 * width;
        CGFloat y = width-[obj.location_y floatValue] * 0.01 * width;
        itemView.center = CGPointMake(x, y-AUTO(30));
        itemView.model = obj;
        [self.bgImgView addSubview:itemView];
    }];
}

- (void)setZhenRongTime:(NSString *)zhenRongTime {
    _zhenRongTime = zhenRongTime;
    self.timeLab.text = [NSString stringWithFormat:@"更新日期：%@",zhenRongTime];
}



- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _timeLab;
}

@end
