//
//  JNMatchSJAgainstTeam_SeasonRankCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/18.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JNMatchSJAgainstTeam_SeasonRankCell.h"

@implementation JNMatchSJAgainstTeam_SeasonRankCell

- (void)initViews {
    [self addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.centerX.equalTo(self);
        make.height.mas_equalTo(AUTO(20));
    }];
    
    [self addSubview:self.leftLineImgView];
    [self.leftLineImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.titleLab);
        make.right.equalTo(self.titleLab.mas_left).offset(-8);
        make.size.mas_equalTo(CGSizeMake(45, 1));
    }];
    
    [self addSubview:self.rightLineImgView];
    [self.rightLineImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.titleLab);
        make.left.equalTo(self.titleLab.mas_right).offset(8);
        make.size.mas_equalTo(CGSizeMake(45, 1));
    }];
    
    [self addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(20));
        make.height.mas_equalTo(AUTO(110));
    }];

    
    UILabel *awayWinLab = [UILabel initWithTitle:@"客队名称" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
    [self addSubview:awayWinLab];
    [awayWinLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgView.mas_bottom);
        make.height.mas_equalTo(AUTO(15));
        make.right.offset(AUTO(-15));
    }];
    
    UIView *awayWinView =[UIView new];
    awayWinView.backgroundColor = COLOR_5194E3;
    [awayWinView hg_setAllCornerWithCornerRadius:AUTO(2)];
    [self addSubview:awayWinView];
    [awayWinView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(awayWinLab);
        make.right.equalTo(awayWinLab.mas_left).offset(-4);
        make.width.height.mas_equalTo(AUTO(12));
    }];
    
   
    
    UILabel *homeWinLab = [UILabel initWithTitle:@"主队名称" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
    [self addSubview:homeWinLab];
    [homeWinLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(awayWinLab);
        make.height.mas_equalTo(AUTO(15));
        make.right.equalTo(awayWinView.mas_left).offset(-4);
    }];
    
    UIView *homeWindView =[UIView new];
    homeWindView.backgroundColor = JCBaseColor;
    [homeWindView hg_setAllCornerWithCornerRadius:AUTO(2)];
    [self addSubview:homeWindView];
    [homeWindView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(homeWinLab);
        make.right.equalTo(homeWinLab.mas_left).offset(-4);
        make.width.height.mas_equalTo(AUTO(12));
    }];
 
}

- (void)data {
    self.titleLab.text = @"本赛季排名走势";
    NSArray *numberTitlteArray = @[@"4",@"3",@"2",@"1",@"0"];
    for (int i=0; i<numberTitlteArray.count; i++) {
        UIView *lineView = [UIView new];
        lineView.backgroundColor = COLOR_DDDDDD;
        lineView.frame = CGRectMake(40, i*AUTO(25), SCREEN_WIDTH-55, 0.5);
        [self.bgView addSubview:lineView];
        
        UILabel *numberLab = [UILabel initWithTitle:numberTitlteArray[i] andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        numberLab.frame = CGRectMake(15, 0, 25, 25);
        numberLab.centerY = lineView.centerY;
        [self.bgView addSubview:numberLab];
    }
    NSArray *winArray = @[@"1",@"1",@"2",@"3",@"1",@"4"];
    [self drawGoalViewWithDataArray:winArray view:self.bgView lineColor:JCBaseColor];
    NSArray *eqalArray = @[@"0",@"4",@"2",@"4",@"1",@"2"];
    [self drawGoalViewWithDataArray:eqalArray view:self.bgView lineColor:COLOR_5194E3];
    NSArray *loseArray = @[@"3",@"4",@"2",@"1",@"0",@"2"];
    [self drawGoalViewWithDataArray:loseArray view:self.bgView lineColor:COLOR_F7B500];


}

- (void)drawGoalViewWithDataArray:(NSArray *)rateArray view:(UIView *)trendView lineColor:(UIColor *)lineColor{
        NSMutableArray *pointArray = [NSMutableArray array];
    float xLength = 30;//每一格x的宽度
    float yLength = AUTO(25);
        float startX = 45;
        float startY = 0;
                
    UIBezierPath* path = [UIBezierPath bezierPath];
    path.lineWidth = 0.001f;
        
        path.lineCapStyle = kCGLineCapButt; //线条拐角
        path.lineJoinStyle = kCGLineCapButt; //终点处理
        for (int i=0; i<rateArray.count; i++) {
            NSString *value = rateArray[i];
            

            if (i>0) {
                startX = startX+xLength;

            }
            startY = -[value floatValue]*yLength+AUTO(100);
            CGPoint point = CGPointMake(startX, startY);
            if (i==0) {
                [path moveToPoint:point];
            }else{
                [path addLineToPoint:point];//终点
            }

        }


            [path stroke];
    //        [path closePath];//第五条线通过调用closePath方法得到的
            //    [path stroke];//Draws line 根据坐标点连线
            [path fill];//颜色填充

            CAShapeLayer *shapeLayer = [CAShapeLayer layer];
            //    shapeLayer.lineDashPattern = @[@(distance),@(distance1),@0,@0,@0];
            shapeLayer.path = path.CGPath;
            shapeLayer.lineWidth = 1;
            shapeLayer.strokeColor = lineColor.CGColor;
    shapeLayer.fillColor = nil;
  
//            trendView.layer.masksToBounds = YES;
            [trendView.layer addSublayer:shapeLayer];

            CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
            pathAnimation.duration = 1;
            pathAnimation.repeatCount = 1;
            pathAnimation.removedOnCompletion = YES;
            pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
            pathAnimation.toValue = [NSNumber numberWithFloat:1];
            // 设置动画代理，动画结束时添加一个标签，显示折线终点的信息
    //            pathAnimation.delegate = self;
//            [shapeLayer addAnimation:pathAnimation forKey:@"strokeEnd"];



        [pointArray enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [trendView bringSubviewToFront:obj];
        }];
}


- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _titleLab;
}

- (UIImageView *)leftLineImgView {
    if (!_leftLineImgView) {
        _leftLineImgView = [UIImageView new];
        _leftLineImgView.image = JCIMAGE(@"match_dec_left");
    }
    return _leftLineImgView;
}
- (UIImageView *)rightLineImgView {
    if (!_rightLineImgView) {
        _rightLineImgView = [UIImageView new];
        _rightLineImgView.image = JCIMAGE(@"match_dec_right");
    }
    return _rightLineImgView;
}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
    }
    return _bgView;
}

@end
