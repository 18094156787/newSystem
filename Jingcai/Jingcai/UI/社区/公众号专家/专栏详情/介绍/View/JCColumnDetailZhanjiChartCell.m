//
//  JCColumnDetailZhanjiChartCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/19.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCColumnDetailZhanjiChartCell.h"

@implementation JCColumnDetailZhanjiChartCell

- (void)initViews {
//    self.bgView.backgroundColor = [UIColor greenColor];
    self.bgView.transform = CGAffineTransformScale(self.bgView.transform, 1.0, -1.0);
    [self.contentView addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(30));
        make.top.offset(0);
        make.right.offset(AUTO(-15));
        make.height.mas_equalTo(84+21+50);
        make.bottom.offset(0);
    }];

    
    for (int i=0; i<5; i++) {
        UIView *lineView = [UIView new];
        lineView.backgroundColor = [COLOR_000000 colorWithAlphaComponent:0.06];
        lineView.frame = CGRectMake(AUTO(15), 21*(i+1), SCREEN_WIDTH-AUTO(30), 0.8);
        [self.contentView addSubview:lineView];
    }
    
    
//    [self addCircle];
}

- (void)setDataSource:(NSArray *)dataSource {
    _dataSource = dataSource;
    self.dataArray = [NSMutableArray array];

    
    JCColumnHitRateModel *hitRateModel0 = [JCColumnHitRateModel new];
    hitRateModel0.hit_rate = @"0";
    [self.dataArray insertObject:hitRateModel0 atIndex:0];
    
    [self.dataArray addObjectsFromArray:dataSource];
    
//    JCColumnHitRateModel *hitRateModel100 = [JCColumnHitRateModel new];
//    hitRateModel100.hit_rate = @"1";
//    [self.dataArray addObject:hitRateModel100];
//
//    JCColumnHitRateModel *hitRateModel60 = [JCColumnHitRateModel new];
//    hitRateModel60.hit_rate = @"0.75";
//    [self.dataArray addObject:hitRateModel60];
//
//    JCColumnHitRateModel *hitRateModel40 = [JCColumnHitRateModel new];
//    hitRateModel40.hit_rate = @"0.5";
//    [self.dataArray addObject:hitRateModel40];
    
    JCColumnHitRateModel *hitRateModel1 = [JCColumnHitRateModel new];
    hitRateModel1.hit_rate = @"0";
    [self.dataArray addObject:hitRateModel1];
    
    float width = SCREEN_WIDTH-AUTO(30);
    float height = 84;
    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.frame = CGRectMake(0, 50, width, height);
    //渐变的颜色
    layer.colors = @[(__bridge id)[UIColor whiteColor].CGColor,  (__bridge id)COLOR_EF2F2F.CGColor];
    //渐变点
    layer.locations = @[@0,@1];
    //起
    layer.startPoint = CGPointMake(0, 0);
    //终点
    layer.endPoint = CGPointMake(0, 1);
    //提供形状
    UIBezierPath* path = [UIBezierPath bezierPath];
    path.lineWidth = 0.001f;
    path.lineCapStyle = kCGLineCapButt; //线条拐角
    path.lineJoinStyle = kCGLineJoinRound; //终点处理
    
    if (self.dataArray.count<=2) {
        return;
    }

    float XLength = width/self.dataArray.count;
    if (self.dataArray.count<12) {
        XLength = width/12;
    }
    for (int i=0; i<self.dataArray.count; i++) {
        JCColumnHitRateModel *model = self.dataArray[i];
        float value = [model.hit_rate floatValue]/100.0f;
        float startX = i*XLength;
        float startY = value*height;
        CGPoint point = CGPointMake(startX, startY);

        if (i==0) {
            [path moveToPoint:point];
        }else{
            [path addLineToPoint:point];//终点
        }

    }
    [path stroke];

    [path fill];//颜色填充
    CAShapeLayer *maskLayer = [CAShapeLayer layer];

    maskLayer.path = path.CGPath;

    layer.mask = maskLayer;

    [self.bgView.layer addSublayer:layer];

        
        for (int i=0; i<self.dataArray.count; i++) {




            if (i>=1&&i<=(self.dataArray.count-2)) {
                JCColumnHitRateModel *model = self.dataArray[i];
                float value = [model.hit_rate floatValue]/100.0f;
                float startX = i*XLength;
                float startY = value*height;
                CGPoint points = CGPointMake(startX, startY);

                UIView *view  = [UIView new];
                view.backgroundColor = JCBaseColor;
                view.frame = CGRectMake(0, 0, 8, 8);
                [view hg_setAllCornerWithCornerRadius:4];

                view.center = CGPointMake(startX, startY+50);
                
                [self.bgView addSubview:view];
                
                UIView *tipView = [UIView new];
                tipView.backgroundColor = JCClearColor;
                tipView.tag = i+100;
                tipView.frame = CGRectMake(0, 0, 30, 30);
                [tipView hg_setAllCornerWithCornerRadius:4];
                tipView.center = view.center;
                [self.bgView addSubview:tipView];
                
                
                
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
                [tipView addGestureRecognizer:tap];
                
                
                
                
                UILabel *label = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
                [self.contentView addSubview:label];
                label.size = CGSizeMake(XLength, 20);
                label.center = CGPointMake(points.x+30, 0);
                label.bottom = 135;
                if (model.period.length>0) {
                    label.text = [NSString stringWithFormat:@"%@期",model.period];
                }
                
            }
            


        }
    
    
    [self.bgView bringSubviewToFront:self.bgView];
}


- (void)tapClick:(UITapGestureRecognizer *)tap {
    UIView *view = tap.view;
    JCColumnHitRateModel *model = self.dataArray[view.tag-100];
//    self.dataArray

    self.showLab.frame = CGRectMake(0, 0, 50, 20);
    self.showLab.text = [NSString stringWithFormat:@"%@%%",@([model.hit_rate floatValue])];
    self.showLab.center = CGPointMake(view.center.x, view.center.y+AUTO(10));
    [self.bgView addSubview:self.showLab];
    self.showLab.transform = CGAffineTransformScale(self.transform, 1.0, -1.0);
    
}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];

    }
    return _bgView;
}

- (UILabel *)showLab {
    if (!_showLab) {
        _showLab = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _showLab.textAlignment = NSTextAlignmentCenter;
    }
    return _showLab;
}

- (UIView *)chartBgView {
    if (!_chartBgView) {
        _chartBgView = [UIView new];
        _chartBgView.backgroundColor = [UIColor blueColor];
    }
    return _chartBgView;
}

@end
