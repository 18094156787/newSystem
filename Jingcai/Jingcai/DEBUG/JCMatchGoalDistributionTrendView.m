//
//  JCMatchGoalDistributionTrendView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/11.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCMatchGoalDistributionTrendView.h"

#define totalWidth SCREEN_WIDTH-50
#define singleWidth (SCREEN_WIDTH-80)/90.0f

@implementation JCMatchGoalDistributionTrendView

- (void)initViews {
    [self addSubview:self.bgScrollow];
    self.bgScrollow.backgroundColor = COLOR_F4F6F9;
    self.bgScrollow.frame= CGRectMake(50, 50, singleWidth*92, 90);

    
    
    [self.bgScrollow addSubview:self.homeView];
    self.homeView.frame = CGRectMake(0, 0, singleWidth*92, 30);

    
    [self.bgScrollow addSubview:self.awayView];
    self.awayView.frame = CGRectMake(0, 30, singleWidth*92, 30);

}

- (void)drawGoalViewWithDataArray:(NSArray *)rateArray view:(UIView *)trendView{
        NSMutableArray *pointArray = [NSMutableArray array];
//        NSArray *rateArray = @[@"1",@"2",@"2",@"1",@"5",@"5",@"1"];
    NSLog(@"每个宽度=%.0f",singleWidth);
    float xLength = singleWidth;//每一格x的宽度
//    float xLength = 10;//每一格x的宽度
    float yLength = 30/100.0f;
        float startX = 0;
        float startY = 0;
    if (trendView==self.homeView) {
        startY = 30;
    }
                
    UIBezierPath* path = [UIBezierPath bezierPath];
    path.lineWidth = 0.001f;
        
        path.lineCapStyle = kCGLineCapButt; //线条拐角
        path.lineJoinStyle = kCGLineCapButt; //终点处理
        for (int i=0; i<rateArray.count; i++) {
            NSString *value = rateArray[i];

            if (i>0) {
                startX = startX+xLength;
//                startY = -[value floatValue]*yLength+30;
                if (trendView==self.homeView) {
                    startY = -[value floatValue]*yLength+30;
                }else{
                    startY = -[value floatValue]*yLength;
                }
            }
            CGPoint point = CGPointMake(startX, startY);
            if (i==0) {
                [path moveToPoint:point];
            }else{
                [path addLineToPoint:point];//终点
            }
            if (i==rateArray.count-1) {
                NSLog(@"屏幕%f,最后=%ld",SCREEN_WIDTH,startX);
            }
            
//            UIView *lineView = [UIView new];
//            if (trendView==self.awayView) {
//                lineView.backgroundColor = JCBaseColor;
//            }else{
//                lineView.backgroundColor = [UIColor blueColor];
//            }
//
//            [trendView addSubview:lineView];
//            lineView.frame = CGRectMake(0, 0, 2, 50);
//            lineView.center = point;

        }


            [path stroke];
    //        [path closePath];//第五条线通过调用closePath方法得到的
            //    [path stroke];//Draws line 根据坐标点连线
            [path fill];//颜色填充

            CAShapeLayer *shapeLayer = [CAShapeLayer layer];
            //    shapeLayer.lineDashPattern = @[@(distance),@(distance1),@0,@0,@0];
            shapeLayer.path = path.CGPath;
    shapeLayer.lineWidth = 0.0001f;
            shapeLayer.strokeColor = JCClearColor.CGColor;
    if (trendView==self.awayView) {
        shapeLayer.fillColor = COLOR_DDDDDD.CGColor;
    }else {
        shapeLayer.fillColor = [UIColor yellowColor].CGColor;
    }
            
              trendView.layer.masksToBounds = YES;
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

- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    self.homeGoalArray = [NSMutableArray array];
    [dataArray enumerateObjectsUsingBlock:^(NSArray  * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj enumerateObjectsUsingBlock:^(NSString *goal, NSUInteger idxx, BOOL * _Nonnull stop) {
            [self.homeGoalArray addObject:goal];
        }];
        
    }];
//    self.realCount = self.homeGoalArray.count;

    
//    NSInteger count = dataArray.count;
//    if ([dataArray containsObject:self.firstValue]) {
//        count--;
//    }
//    if ([dataArray containsObject:self.lastValue]) {
//        count--;
//    }
    
//    self.bgScrollow.frame = CGRectMake(50, 50, singleWidth*self.homeGoalArray.count, 60);


    self.firstValue = self.homeGoalArray.firstObject;
    self.lastValue = self.homeGoalArray.lastObject;
    if ([self.firstValue intValue]!=0) {
        [self.homeGoalArray insertObject:@"0" atIndex:0];
    }
    if ([self.lastValue intValue]!=0) {
        [self.homeGoalArray addObject:@"0"];;
    }
    


    [self drawGoalViewWithDataArray:self.homeGoalArray view:self.homeView];
    [self drawGoalViewWithDataArray:self.homeGoalArray view:self.awayView];

    
    if (self.homeGoalArray.count>92) {
        self.bgScrollow.frame = CGRectMake(50, 50, singleWidth*self.homeGoalArray.count, 60);
        self.homeView.frame = CGRectMake(0, 0, singleWidth*self.homeGoalArray.count, 30);
        self.awayView.frame = CGRectMake(0, 30, singleWidth*self.homeGoalArray.count, 30);

        if (singleWidth*self.homeGoalArray.count>totalWidth) {
            self.bgScrollow.frame = CGRectMake(50, 50, totalWidth, 60);
            self.bgScrollow.contentSize = CGSizeMake(singleWidth*self.homeGoalArray.count, 60);
        }

    }else{
        self.homeView.frame = CGRectMake(0, 0, singleWidth*self.homeGoalArray.count, 30);
        self.awayView.frame = CGRectMake(0, 30, singleWidth*self.homeGoalArray.count, 30);
        self.bgScrollow.frame = CGRectMake(50, 50, singleWidth*92, 60);

    }
     [self.bgScrollow addSubview:self.endLineView];
    self.endLineView.frame = CGRectMake(singleWidth*self.homeGoalArray.count-1, 0, 1, 60);

    

}


- (UIScrollView *)bgScrollow {
    if (!_bgScrollow) {
        _bgScrollow = [UIScrollView new];
    }
    return _bgScrollow;
}

- (UIView *)homeView {
    if (!_homeView) {
        _homeView = [UIView new];
        _homeView.backgroundColor = [[UIColor orangeColor] colorWithAlphaComponent:0.5];
    }
    return _homeView;
}

- (UIView *)awayView {
    if (!_awayView) {
        _awayView = [UIView new];
//        _awayView.backgroundColor = COLOR_F4F6F9;
    }
    return _awayView;
}

- (UIView *)endLineView {
    if (!_endLineView) {
        _endLineView = [UIView new];
        _endLineView.backgroundColor = [[UIColor orangeColor] colorWithAlphaComponent:0.5];
    }
    return _endLineView;
}

@end
