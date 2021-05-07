//
//  JCHongBangCircleView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/17.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCHongBangCircleView.h"

@implementation JCHongBangCircleView

- (void)initViews {
//    self.backgroundColor = [UIColor greenColor];
    UIView *zouView = [UIView new];
    zouView.backgroundColor = COLOR_0091FF;
    [self addSubview:zouView];
    [zouView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self).offset(-15);
        make.left.offset(20);
        make.size.mas_equalTo(CGSizeMake(0, 7));
    }];
    
    
    [self addSubview:self.zouLab];
    [self.zouLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(zouView.mas_right).offset(0);
        make.centerY.equalTo(zouView);
    }];
    
    UIView *hongView = [UIView new];
    hongView.backgroundColor = JCBaseColor;
    [self addSubview:hongView];
    [hongView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(zouView);
        make.bottom.equalTo(zouView.mas_top).offset(-6);
        make.size.mas_equalTo(CGSizeMake(0, 7));
    }];
    
    
    [self addSubview:self.hongLab];
    [self.hongLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(hongView.mas_right).offset(0);
        make.centerY.equalTo(hongView);
    }];
    
    UIView *heiView = [UIView new];
    heiView.backgroundColor = COLOR_505050;
    [self addSubview:heiView];
    [heiView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(zouView);
        make.top.equalTo(zouView.mas_bottom).offset(6);
        make.size.mas_equalTo(CGSizeMake(0, 7));
    }];
    
    
    [self addSubview:self.heiLab];
    [self.heiLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(heiView.mas_right).offset(0);
        make.centerY.equalTo(heiView);
    }];
//
//    [self addSubview:self.rateLab];
//    [self.rateLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.infoLab.mas_bottom);
//        make.centerX.equalTo(self);
//        make.height.mas_equalTo(16);
//    }];
    

}


- (void)setHongProgress:(CGFloat)hongProgress {
    _hongProgress = hongProgress;
    self.hongLab.text = [NSString stringWithFormat:@"红:%.0f%%",hongProgress*100];
}

- (void)setHeiProgress:(CGFloat)heiProgress {
    _heiProgress = heiProgress;
    self.heiLab.text = [NSString stringWithFormat:@"黑:%.0f%%",heiProgress*100];
    
}

- (void)setZouProgress:(CGFloat)zouProgress {
    _zouProgress = zouProgress;
    self.zouLab.text = [NSString stringWithFormat:@"走:%.0f%%",zouProgress*100];
    
}

- (void)drawProgress
{
    [self.hong_progressLayer removeFromSuperlayer];
    [self.hei_progressLayer removeFromSuperlayer];
    [self.zou_progressLayer removeFromSuperlayer];
    [self setNeedsDisplay];
}




// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    [self drawCycleProgress];
    
}

- (void)drawCycleProgress
{
    CGPoint center = CGPointMake(40, 40);
    CGFloat radius = 40;
    CGFloat startA =  -M_PI_2;  //设置进度条起点位置
    CGFloat endA = startA + M_PI * 2 * self.hongProgress;  //设置进度条终点位置
//    self.backgroundColor = [UIColor whiteColor];
    //获取环形路径（画一个圆形，填充色透明，设置线框宽度为10，这样就获得了一个环形）
    self.hong_progressLayer = [CAShapeLayer layer];//创建一个track shape layer
    self.hong_progressLayer.frame = self.bounds;
    self.hong_progressLayer.fillColor = [[UIColor clearColor] CGColor];  //填充色为无色
    UIColor *color = JCBaseColor;
//    UIColor *color = self.drawColor;
    self.hong_progressLayer.strokeColor = [color CGColor]; //指定path的渲染颜色,这里可以设置任意不透明颜色
    self.hong_progressLayer.opacity = 1; //背景颜色的透明度
    self.hong_progressLayer.lineCap = kCALineCapButt;//指定线的边缘是圆的
    self.hong_progressLayer.lineWidth = 10;//线的宽度
    UIBezierPath *hong_path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];//上面说明过了用来构建圆形
    self.hong_progressLayer.path =[hong_path CGPath]; //把path传递給layer，然后layer会处理相应的渲染，整个逻辑和CoreGraph是一致的。
    [self.layer addSublayer:self.hong_progressLayer];
    
    startA = endA;
    endA = endA  + M_PI * 2 * self.zouProgress;
    

    

    
        self.zou_progressLayer = [CAShapeLayer layer];//创建一个track shape layer
        self.zou_progressLayer.frame = self.bounds;
        self.zou_progressLayer.fillColor = [[UIColor clearColor] CGColor];  //填充色为无色
        UIColor *zou_color = COLOR_2655B3;
    //    UIColor *color = self.drawColor;
        self.zou_progressLayer.strokeColor = [zou_color CGColor]; //指定path的渲染颜色,这里可以设置任意不透明颜色
        self.zou_progressLayer.opacity = 1; //背景颜色的透明度
        self.zou_progressLayer.lineCap = kCALineCapButt;//指定线的边缘是圆的
        self.zou_progressLayer.lineWidth = 10;//线的宽度
        UIBezierPath *zou_path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];//上面说明过了用来构建圆形
        self.zou_progressLayer.path =[zou_path CGPath]; //把path传递給layer，然后layer会处理相应的渲染，整个逻辑和CoreGraph是一致的。
        [self.layer addSublayer:self.zou_progressLayer];
    
    
        startA = endA;
        endA = endA  + M_PI * 2 * self.heiProgress;//
    
        self.hei_progressLayer = [CAShapeLayer layer];//创建一个track shape layer
    //    bottomLayer.backgroundColor = [UIColor clearColor].CGColor;
        self.hei_progressLayer.frame = self.bounds;
        self.hei_progressLayer.fillColor = [[UIColor clearColor] CGColor];  //填充色为无色
        
        self.hei_progressLayer.strokeColor = [COLOR_505050 CGColor]; //指定path的渲染颜色,这里可以设置任意不透明颜色
        self.hei_progressLayer.opacity = 1; //背景颜色的透明度
        self.hei_progressLayer.lineCap = kCALineCapButt;//指定线的边缘是圆的
        self.hei_progressLayer.lineWidth = 10;//线的宽度
        UIBezierPath *hei_path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];//上面说明过了用来构建圆形
        self.hei_progressLayer.path =[hei_path CGPath]; //把path传递給layer，然后layer会处理相应的渲染，整个逻辑和CoreGraph是一致的。
        [self.layer addSublayer:self.hei_progressLayer];
    


}

- (UILabel *)hongLab {
    if (!_hongLab) {
        _hongLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _hongLab;
}

- (UILabel *)zouLab {
    if (!_zouLab) {
        _zouLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_002868 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _zouLab;
}

- (UILabel *)heiLab {
    if (!_heiLab) {
        _heiLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_1B1B1B andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _heiLab;
}

@end
