//
//  JCPoissonDataModelDetailAttackCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/11.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCPoissonDataModelDetailAttackCell.h"

@implementation JCPoissonDataModelDetailAttackCell

- (void)initViews {
    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(5));
        make.centerX.equalTo(self.contentView);
        make.height.mas_equalTo(AUTO(20));
    }];
    
    [self.contentView addSubview:self.homeRateLab];
    [self.homeRateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(16));
        make.centerY.equalTo(self.titleLab);
    }];
    
    [self.contentView addSubview:self.awayRateLab];
    [self.awayRateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-16));
        make.centerY.equalTo(self.titleLab);
    }];
    
    [self.contentView addSubview:self.homeProgressView];
    [self.homeProgressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(16));
        make.top.equalTo(self.titleLab.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(AUTO(160), AUTO(8)));
//        make.bottom.offset(-AUTO(30));
    }];
    
    [self.contentView addSubview:self.awayProgressView];
    [self.awayProgressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-16));
        make.top.equalTo(self.titleLab.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(AUTO(160), AUTO(8)));
    }];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    


//    [self setupLineView:self.homeProgressView colors:JCBaseColor startPoint:0.6 endPoint:1];
//
//        [self setupLineView:self.awayProgressView colors:COLOR_002868 startPoint:0 endPoint:0.6];
}

- (void)setAgainstModel:(JCTransactionDataContrastModel *)againstModel {
    if (self.againstModel) {
        return;
    }
    _againstModel = againstModel;
    [self layoutIfNeeded];
    if (self.againstModel) {
        self.titleLab.text = self.againstModel.title;
        NSString *left = [NSString stringWithFormat:@"%@",@([self.againstModel.home_average_value floatValue])];
        NSString *right = [NSString stringWithFormat:@"%@",@([self.againstModel.away_average_value floatValue])];
        self.homeRateLab.text = left;
        self.awayRateLab.text = right;
        float total = [left floatValue]+[right floatValue];

        if (total>0) {

            float homeRate = [right floatValue]/total;
            [self setupLineView:self.homeProgressView colors:JCBaseColor startPoint:homeRate endPoint:1];
            [self setupLineView:self.awayProgressView colors:UIColorFromRGB(0x3578E3) startPoint:0 endPoint:homeRate];
            

        }else{
            [self setupLineView:self.homeProgressView colors:JCBaseColor startPoint:0 endPoint:0];

            [self setupLineView:self.awayProgressView colors:UIColorFromRGB(0x3578E3) startPoint:0 endPoint:0];
        }
    }


}
- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    [self layoutIfNeeded];
    if (dataArray.count==2) {
        NSString *left = [NSString stringWithFormat:@"%@",@([dataArray.firstObject floatValue])];
        NSString *right = [NSString stringWithFormat:@"%@",@([dataArray.lastObject floatValue])];
        self.homeRateLab.text = left;
        self.awayRateLab.text = right;
        float total = [left floatValue]+[right floatValue];

        if (total>0) {

            float homeRate = [right floatValue]/total;
            [self setupLineView:self.homeProgressView colors:JCBaseColor startPoint:homeRate endPoint:1];
            [self setupLineView:self.awayProgressView colors:COLOR_002868 startPoint:0 endPoint:homeRate];
            

        }else{
            [self setupLineView:self.homeProgressView colors:JCBaseColor startPoint:0 endPoint:0];

            [self setupLineView:self.awayProgressView colors:COLOR_002868 startPoint:0 endPoint:0];
        }
    }else{
        [self setupLineView:self.homeProgressView colors:JCBaseColor startPoint:0 endPoint:0];

            [self setupLineView:self.awayProgressView colors:COLOR_002868 startPoint:0 endPoint:0];

    }
}



-(void)setupLineView:(UIView *)lineView colors:(UIColor *)color startPoint:(float)start endPoint:(float)end{
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    [linePath moveToPoint:CGPointMake(0, lineView.bounds.size.height/2)];
    [linePath addLineToPoint:CGPointMake(lineView.bounds.size.width, lineView.bounds.size.height/2)];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    //每次动画的持续时间
    animation.duration = 0.25;
    //动画起始位置
    animation.fromValue = @(0);
    //动画结束位置
    animation.toValue = @(1);
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = linePath.CGPath;
    shapeLayer.lineWidth = lineView.bounds.size.height;
    shapeLayer.fillColor = nil;
    shapeLayer.strokeColor = color.CGColor;
    shapeLayer.lineCap = kCALineCapRound;
    //strokeStart defaults to zero and strokeEnd to one.
    shapeLayer.strokeStart = start;
    //分成了多少段，每次加多少分之一
    shapeLayer.strokeEnd = end;
    //添加动画
//    [shapeLayer addAnimation:animation forKey:@"strokeEndAnimation"];
    [lineView.layer addSublayer:shapeLayer];
    

}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _titleLab;
}

- (UILabel *)homeRateLab {
    if (!_homeRateLab) {
        _homeRateLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _homeRateLab;
}

- (UILabel *)awayRateLab {
    if (!_awayRateLab) {
        _awayRateLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _awayRateLab;
}

- (UIView *)homeProgressView {
    if (!_homeProgressView) {
        _homeProgressView = [UIView new];
        _homeProgressView.backgroundColor = UIColorFromRGB(0xEEEEEE);
        _homeProgressView.layer.cornerRadius = AUTO(4);
        _homeProgressView.layer.masksToBounds = YES;
    }
    return _homeProgressView;
}

- (UIView *)awayProgressView {
    if (!_awayProgressView) {
        _awayProgressView = [UIView new];
        _awayProgressView.backgroundColor = UIColorFromRGB(0xEEEEEE);
        _awayProgressView.layer.cornerRadius = AUTO(4);
        _awayProgressView.layer.masksToBounds = YES;
    }
    return _awayProgressView;
}
@end
