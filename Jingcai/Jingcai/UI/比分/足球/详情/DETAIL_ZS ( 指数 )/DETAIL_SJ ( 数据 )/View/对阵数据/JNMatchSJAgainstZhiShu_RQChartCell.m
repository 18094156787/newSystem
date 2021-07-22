//
//  JNMatchSJAgainstZhiShu_RQChartCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/18.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JNMatchSJAgainstZhiShu_RQChartCell.h"
#import "JCBigDataZhishuModel.h"
#import "JCBigDataZhishuTrendModel.h"
#import "JNMatchSJAgainstZhiShu_RQChartContentCell.h"
@interface JNMatchSJAgainstZhiShu_RQChartCell()

@property (nonatomic, strong) NSArray *titleArray;

@end

@implementation JNMatchSJAgainstZhiShu_RQChartCell

- (void)initViews {
    UIView *titleBgView = [UIView new];
    [self addSubview:titleBgView];
    titleBgView.backgroundColor = [COLOR_002868 colorWithAlphaComponent:0.06];
    [titleBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.height.mas_equalTo(AUTO(28));
    }];
    
    [titleBgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(5));
        make.centerY.equalTo(titleBgView);
    }];
    
    UILabel *awayWinLab = [UILabel initWithTitle:@"客队" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [titleBgView addSubview:awayWinLab];
    [awayWinLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(titleBgView);
        make.right.offset(AUTO(-5));
    }];
    
    UIView *awayWinView =[UIView new];
    awayWinView.backgroundColor = COLOR_002868;
    [awayWinView hg_setAllCornerWithCornerRadius:AUTO(4)];
    [self addSubview:awayWinView];
    [awayWinView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(titleBgView);
        make.right.equalTo(awayWinLab.mas_left).offset(-4);
        make.width.height.mas_equalTo(AUTO(8));
    }];
    
    UILabel *eqalWinLab = [UILabel initWithTitle:@"指数" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [self addSubview:eqalWinLab];
    [eqalWinLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(titleBgView);
        make.height.mas_equalTo(AUTO(15));
        make.right.equalTo(awayWinView.mas_left).offset(-10);
    }];
    
    UIView *eqalView =[UIView new];
    eqalView.backgroundColor = COLOR_30B27A;
    [eqalView hg_setAllCornerWithCornerRadius:AUTO(4)];
    [self addSubview:eqalView];
    [eqalView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(titleBgView);
        make.right.equalTo(eqalWinLab.mas_left).offset(-4);
        make.width.height.mas_equalTo(AUTO(8));
    }];
    
    UILabel *homeWinLab = [UILabel initWithTitle:@"主队" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [self addSubview:homeWinLab];
    [homeWinLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(titleBgView);
        make.height.mas_equalTo(AUTO(15));
        make.right.equalTo(eqalView.mas_left).offset(-10);
    }];
    
    UIView *homeWindView =[UIView new];
    homeWindView.backgroundColor = JCBaseColor;
    [homeWindView hg_setAllCornerWithCornerRadius:AUTO(4)];
    [self addSubview:homeWindView];
    [homeWindView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(titleBgView);
        make.right.equalTo(homeWinLab.mas_left).offset(-4);
        make.width.height.mas_equalTo(AUTO(8));
    }];
    
    UIView *bottomView = [UIView new];
    [self addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleBgView.mas_bottom).offset(AUTO(10));
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.height.mas_equalTo(AUTO(20));
    }];
    
    [bottomView addSubview:self.chupanLab];
    [self.chupanLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(5));
        make.centerY.equalTo(bottomView);
        make.height.mas_equalTo(AUTO(20));
    }];
    
    [bottomView addSubview:self.jipanLab];
    [self.jipanLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-5));
        make.centerY.equalTo(bottomView);
        make.height.mas_equalTo(AUTO(20));
    }];
    
    
    
    [self addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.equalTo(bottomView.mas_bottom).offset(AUTO(20));
        make.height.mas_equalTo(AUTO(110));
    }];
    

    
    [self addSubview:self.lastTimeLab];
    [self.lastTimeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(45));
        make.top.equalTo(self.bgView.mas_bottom).offset(0);
        make.height.mas_equalTo(AUTO(17));
    }];
    
    [self addSubview:self.nowTimeLab];
    [self.nowTimeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_centerX).offset(AUTO(10));
        make.top.equalTo(self.bgView.mas_bottom).offset(0);
        make.height.mas_equalTo(AUTO(17));
    }];
    


    
    [self addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.equalTo(self.lastTimeLab.mas_bottom).offset(AUTO(10));
        make.height.mas_equalTo(AUTO(106));
        make.bottom.offset(AUTO(-10));
    }];
    [self.tableView registerClass:[JNMatchSJAgainstZhiShu_RQChartContentCell class] forCellReuseIdentifier:@"JNMatchSJAgainstZhiShu_RQChartContentCell"];
}

- (void)data {
    self.titleLab.text = @"让球分析";
    self.lastTimeLab.text = @"(赛前48h)";
    self.nowTimeLab.text = @"(赛前24h)";


}



- (void)drawGoalViewWithDataArray:(NSArray *)rateArray timeArray:(NSArray *)timeArray view:(UIView *)trendView lineColor:(UIColor *)lineColor {
    NSMutableArray *pointArray = [NSMutableArray array];
    float startY = 0;
    UIBezierPath* path = [UIBezierPath bezierPath];
    path.lineWidth = 0.001f;
        
        path.lineCapStyle = kCGLineCapButt; //线条拐角
        path.lineJoinStyle = kCGLineCapButt; //终点处理
        for (int i=0; i<rateArray.count; i++) {
            NSString *value = rateArray[i];
            NSString *time = timeArray[i];
            float startX = 55+[time integerValue]/172800.0f*(SCREEN_WIDTH-65);

            float value1 = [value floatValue]-[self.largeModel.small floatValue];
            float value2 = [self.largeModel.large floatValue]-[self.largeModel.small floatValue];
            float value3 = AUTO(100)*value1/value2;
            startY = -value3+AUTO(100);
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
            shapeLayer.lineWidth = 2;
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

#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArray.count+1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JNMatchSJAgainstZhiShu_RQChartContentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JNMatchSJAgainstZhiShu_RQChartContentCell"];
    cell.row = indexPath.row;
    if (indexPath.row==0) {
        cell.labelOne.text = self.productModel.rq;
//        cell.labelOne.textColor = [COLOR_2F2F2F colorWithAlphaComponent:0.6];
        cell.labelTwo.text = @"最高";
        cell.labelThree.text = @"最低";
        cell.labelFour.text = @"平均";
        cell.labelFive.text = @"趋势\n相比初始";

        
    }else{
        cell.model = self.dataArray[indexPath.row-1];

    }

    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row==0) {
            return AUTO(40);
        }
        return AUTO(28);
}


- (UITableView *)tableView {
    if (!_tableView) {
        
        UITableView *view = [[UITableView alloc] initWithFrame:CGRectZero style:0];
        view.dataSource = self;
        view.delegate = self;
        view.separatorStyle = UITableViewCellSeparatorStyleNone;

        view.showsVerticalScrollIndicator = NO;
        //        view.delaysContentTouches = NO;
        view.estimatedSectionHeaderHeight = 0;
        view.estimatedSectionFooterHeight = 0;
        view.backgroundColor = JCClearColor;
        view.scrollEnabled = NO;
        //注册cell
        [view registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
        
        _tableView = view;

        
    }
    
    return _tableView;
}

- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    [self.tableView reloadData];
}

- (void)setPanModel:(JCBigDataZhishuPanModel *)panModel {
    _panModel= panModel;
    NSString *chuPan = [NSString stringWithFormat:@"初始 %@ %@ %@",panModel.start_win,panModel.start_equal,panModel.start_lose];
    self.chupanLab.text = chuPan;

    NSString *jiPan = [NSString stringWithFormat:@"即时 %@ %@ %@",panModel.win,panModel.equal,panModel.lose];
    NSMutableAttributedString *jiPanAttributedStr = [[NSMutableAttributedString alloc] initWithString:jiPan];
    if ([jiPan containsString:panModel.win]) {
        NSRange range = [jiPan rangeOfString:panModel.win];
        [jiPanAttributedStr setAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:panModel.win_color]} range:range];

    }
    if ([jiPan containsString:panModel.equal]) {
        NSRange range = [jiPan rangeOfString:panModel.equal];
        [jiPanAttributedStr setAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:panModel.equal_color]} range:range];

    }
    if ([jiPan containsString:panModel.lose]) {
        NSRange range = [jiPan rangeOfString:panModel.lose];
        [jiPanAttributedStr setAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:panModel.lose_color]} range:range];

    }
    self.jipanLab.attributedText = jiPanAttributedStr;
}

- (void)setTrendArray:(NSArray *)trendArray {
    if (trendArray.count==0) {
        return;
    }
    _trendArray = trendArray;
    [self.bgView removeAllSubviews];
    float max = [self.largeModel.large floatValue] - [self.largeModel.small floatValue];
    float averag = max/4.0f;
//    NSMutableArray *numberTitlteArray = @[@"4",@"3",@"2",@"1",@"0"];
    NSMutableArray *numberTitlteArray = [NSMutableArray array];
       
    
    for (int i=0; i<5; i++) {
        NSString *title = [NSString stringWithFormat:@"%.2f",[self.largeModel.small floatValue]+i*averag];

        [numberTitlteArray addObject:title];
    }
//    [numberTitlteArray insertObject:[NSString stringWithFormat:@"%.2f",[self.largeModel.small floatValue]] atIndex:0];
   NSArray * titleArray = [NSArray arrayWithArray:numberTitlteArray];
     titleArray = [[[titleArray copy] reverseObjectEnumerator] allObjects];
    for (int i=0; i<titleArray.count; i++) {
        UIImageView *lineView = [UIImageView new];
        lineView.image = JCIMAGE(@"jc_bigdata_divider");
        lineView.frame = CGRectMake(55, i*AUTO(25), SCREEN_WIDTH-65, 1);
        [self.bgView addSubview:lineView];

        UILabel *numberLab = [UILabel initWithTitle:titleArray[i] andFont:AUTO(16) andWeight:1 andTextColor:[COLOR_000000 colorWithAlphaComponent:0.64] andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentRight];
        numberLab.frame = CGRectMake(5, 0, 45, 25);
        numberLab.centerY = lineView.centerY;
        [self.bgView addSubview:numberLab];
    }

    NSMutableArray *winArray = [NSMutableArray array];
    NSMutableArray *eqalArray = [NSMutableArray array];
    NSMutableArray *loseArray = [NSMutableArray array];
    NSMutableArray *timeArray = [NSMutableArray array];
    [trendArray enumerateObjectsUsingBlock:^(JCBigDataZhishuTrendModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [winArray addObject:obj.win];
        [eqalArray addObject:obj.equal];
        [loseArray addObject:obj.lose];
        [timeArray addObject:obj.time];
    }];
//    NSArray *winArrays = [[[winArray copy] reverseObjectEnumerator] allObjects];
    [self drawGoalViewWithDataArray:winArray  timeArray:timeArray view:self.bgView lineColor:JCBaseColor];
    [self drawGoalViewWithDataArray:eqalArray timeArray:timeArray view:self.bgView lineColor:COLOR_30B27A];
    [self drawGoalViewWithDataArray:loseArray timeArray:timeArray view:self.bgView lineColor:COLOR_002868];
    
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

- (UILabel *)lastTimeLab {
    if (!_lastTimeLab) {
        _lastTimeLab = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _lastTimeLab;
}

- (UILabel *)nowTimeLab {
    if (!_nowTimeLab) {
        _nowTimeLab = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _nowTimeLab;
}

- (UILabel *)chupanLab {
    if (!_chupanLab) {
        _chupanLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _chupanLab;
}

- (UILabel *)jipanLab {
    if (!_jipanLab) {
        _jipanLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _jipanLab;
}

- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@"半/一",@"最高",@"最低",@"平均",@"趋势\n（相比初时）"];
    }
    return _titleArray;
}

@end
