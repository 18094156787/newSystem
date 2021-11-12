//
//  JCHongbangInfoTopCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/5/19.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCHongbangInfoTopCell.h"
#import "JCWDateTool.h"
@implementation JCHongbangInfoTopCell

- (void)initViews {
    self.backgroundColor= JCWhiteColor;
    UIView *bgView = [UIView new];
    bgView.backgroundColor = JCWhiteColor;
    [self.contentView addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    [bgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.offset(AUTO(5));
    }];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = COLOR_F0F0F0;
    [bgView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(15));
        make.height.mas_equalTo(1);
        make.bottom.offset(0);
    }];
    
 
    
//    [bgView addSubview:self.orderDetailView];
//    [self.orderDetailView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.offset(0);
//        make.top.equalTo(lineView.mas_bottom);
//        make.size.mas_equalTo(CGSizeMake(AUTO(80), AUTO(25)));
//    }];
//
//    [self.orderDetailView addSubview:self.orderDetailLab];
//    [self.orderDetailLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.offset(0);
//        make.centerY.equalTo(self.orderDetailView);
//    }];
//
//    [self.orderDetailView addSubview:self.indicateImgView];
//    [self.indicateImgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.orderDetailLab.mas_right).offset(1.5);
//        make.centerY.equalTo(self.orderDetailView);
//        make.size.mas_equalTo(CGSizeMake(AUTO(5), AUTO(10)));
//    }];
//
//    WeakSelf;
//    [self.orderDetailView bk_whenTapped:^{
//        if (weakSelf.JCOrderDetailBlock) {
//            weakSelf.JCOrderDetailBlock();
//        }
//    }];
//
}


- (void)setInfoModel:(JCWTjInfoDetailBall *)infoModel {
    _infoModel = infoModel;
    if (!infoModel) {
        return;
    }

    self.titleLab.text =infoModel.title;
    

    
//    self.orderDetailView.hidden = infoModel.is_pay==2?NO:YES;
}

- (void)setDetailModel:(JCHongbangOrderDetailModel *)detailModel {
    _detailModel = detailModel;
    if (detailModel.match_data.count>0) {
        JCDianPingMatchBall *matchModel = detailModel.match_data.firstObject;
        self.titleLab.text = [NSString stringWithFormat:@"%@vs%@",matchModel.home_name,matchModel.away_name];
    }
    
//    self.infoLab.text = [NSString stringWithFormat:@"%@发布",detailModel.release_time];
    self.orderDetailView.hidden = YES;
}


- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(16) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
        _titleLab.numberOfLines = 2;
    }
    return _titleLab;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _infoLab;
}

- (UIView *)orderDetailView {
    if (!_orderDetailView) {
        _orderDetailView = [UIView new];
        _orderDetailView.hidden = YES;
    }
    return _orderDetailView;
}

- (UILabel *)orderDetailLab {
    if (!_orderDetailLab) {
        _orderDetailLab = [UILabel initWithTitle:@"·订单详情" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _orderDetailLab;
}

- (UIImageView *)indicateImgView {
    if (!_indicateImgView) {
        _indicateImgView = [UIImageView new];
        _indicateImgView.image = JCIMAGE(@"common_arrow_right");
    }
    return _indicateImgView;
}

@end
