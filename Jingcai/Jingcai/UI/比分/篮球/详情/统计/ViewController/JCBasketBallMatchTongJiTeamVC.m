//
//  JCBasketBallMatchTongJiTeamVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/5.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBasketBallMatchTongJiTeamVC.h"
#import "JJStockView.h"
@interface JCBasketBallMatchTongJiTeamVC ()<StockViewDataSource,StockViewDelegate>

@property(nonatomic,readwrite,strong)JJStockView* stockView;

@end

@implementation JCBasketBallMatchTongJiTeamVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = JCBaseColor;
    self.stockView.frame = CGRectMake(15, 15, SCREEN_WIDTH-15, SCREEN_HEIGHT-50-kNavigationBarHeight-44-kBottomTabSafeAreaHeight-15);
    [self.view addSubview:self.stockView];
}
#pragma mark - Stock DataSource

- (NSUInteger)countForStockView:(JJStockView*)stockView{
    return self.contentArray.count;
}

- (UIView*)titleCellForStockView:(JJStockView*)stockView atRowPath:(NSUInteger)row{
//    if (row==self.emptyIndex) {
//        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 10)];
//        label.text = @"";
//        label.textColor = [UIColor grayColor];
//        label.backgroundColor = [UIColor redColor];
//        label.textAlignment = NSTextAlignmentCenter;
//        return label;
//    }
    UILabel* label = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCWhiteColor andTextAlignment:NSTextAlignmentCenter];
    label.text = self.titleArray[row];
//    if (row>0) {
//        label.font = [UIFont fontWithName:@"PingFangSC-Medium" size:font]
//    }e

    if (self.emptyIndex>0&&self.emptyIndex==row) {
        label.backgroundColor = COLOR_F0F0F0;
        label.frame = CGRectMake(0, 0, 100, 4);
    }else{
        label.frame = CGRectMake(0, 0, 100, 30);
        label.layer.borderColor = [UIColor lightGrayColor].CGColor;
        label.layer.borderWidth = 0.25;
    }

    return label;
}

- (UIView*)contentCellForStockView:(JJStockView*)stockView atRowPath:(NSUInteger)row{
    if (row==self.emptyIndex&&self.emptyIndex>0) {
        UIView* bg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50*14, 4)];
        bg.backgroundColor = COLOR_F0F0F0;
        return bg;
    }
    UIView* bg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50*14, 30)];
//    bg.backgroundColor = row % 2 == 0 ?[UIColor whiteColor] :[UIColor colorWithRed:240.0f/255.0 green:240.0f/255.0 blue:240.0f/255.0 alpha:1.0];
    JCBasketBallMatchTongJiUserModel *userModel = self.contentArray[row];
    JCBasketBallMatchTongJiTeamModel *model = userModel.play_info;
    for (int i = 0; i < 14; i++) {
//        UIButton* button = [[UIButton alloc] initWithFrame:CGRectMake(i * 100, 0, 100, 30)];
//        [button setTitle:[NSString stringWithFormat:@"内容:%d",i] forState:UIControlStateNormal];
//        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
//        button.titleLabel.textAlignment = NSTextAlignmentCenter;
//        button.tag = i;
//        [bg addSubview:button];
        UILabel* label = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCWhiteColor andTextAlignment:NSTextAlignmentCenter];
        label.frame = CGRectMake(i * 50, 0, 50, 30);
//        label.text = [NSString stringWithFormat:@"内容:%d",i];
        label.layer.borderColor = [UIColor lightGrayColor].CGColor;
        label.layer.borderWidth = 0.25;
        if (i==0) {
            label.text = model.zccxsj;//;
        }
        if (i==1) {
            label.text = model.df;
        }
        if (i==2) {
            label.text = model.zdlb;
        }
        if (i==3) {
            label.text = model.zgs;
        }
        if (i==4) {
            label.text = model.mzcs_tlcs;
        }
        if (i==5) {
            label.text = model.sfqtlmzcs_sftlcs;
        }
        if (i==6) {
            label.text = model.fqmzcs_fqtlcs;
        }
        if (i==7) {
            label.text = model.jglb;
        }
        if (i==8) {
            label.text = model.fslb;
        }
        if (i==9) {
            label.text = model.qds;
        }
        if (i==10) {
            label.text = model.gms;
        }
        if (i==11) {
            label.text = model.swcs;
        }
        if (i==12) {
            label.text = model.grfgcs;
        }
        if (i==13) {
            label.text = model.z;
        }

        [bg addSubview:label];
    }

    return bg;
}

#pragma mark - Stock Delegate

- (CGFloat)heightForCell:(JJStockView*)stockView atRowPath:(NSUInteger)row{
    if (row==self.emptyIndex&&self.emptyIndex>0) {
        return 4;
    }
    return 30.0f;
}

- (UIView*)headRegularTitle:(JJStockView*)stockView{
    UILabel* label = [UILabel initWithTitle:@"球员" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:COLOR_F0F0F0 andTextAlignment:NSTextAlignmentCenter];
    label.frame = CGRectMake(0, 0, 100, 20);
    label.layer.borderColor = [UIColor lightGrayColor].CGColor;
    label.layer.borderWidth = 0.25;
    return label;
}

- (UIView*)headTitle:(JJStockView*)stockView{
   
    NSArray *array = @[@"时间",@"得分",@"篮板",@"助攻",@"投篮",@"三分",@"罚球",@"前板",@"后板",@"抢断",@"盖帽",@"失误",@"犯规",@"+/-"];
    UIView* bg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50*array.count, 20)];
    for (int i = 0; i < array.count; i++) {
        UILabel* label = [UILabel initWithTitle:array[i] andFont:AUTO(10) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:COLOR_F0F0F0 andTextAlignment:NSTextAlignmentCenter];
        label.frame = CGRectMake(i * 50, 0, 50, 20);
        label.layer.borderColor = [UIColor lightGrayColor].CGColor;
        label.layer.borderWidth = 0.25;
        [bg addSubview:label];
    }
    return bg;
}

- (CGFloat)heightForHeadTitle:(JJStockView*)stockView{
    return 20.0f;
}

- (void)didSelect:(JJStockView*)stockView atRowPath:(NSUInteger)row{
    NSLog(@"DidSelect Row:%ld",row);
}

#pragma mark - Button Action

- (void)buttonAction:(UIButton*)sender{
    NSLog(@"Button Row:%ld",sender.tag);
}

#pragma mark - Get

- (JJStockView*)stockView{
    if(_stockView != nil){
        return _stockView;
    }
    _stockView = [JJStockView new];
    _stockView.dataSource = self;
    _stockView.delegate = self;
    return _stockView;
}

- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    if (dataArray.count==0) {
        [self.view showTopNoData];
    }else{
        [self.view hideNoData];
    }
    self.titleArray = [NSMutableArray array];
    self.contentArray = [NSMutableArray array];
//    self.emptyIndex = 0;
//    NSString *empty = @"";
    for (int i=0; i<dataArray.count; i++) {
        JCBasketBallMatchTongJiUserModel *model = dataArray[i];

        if ([model.player_zw isEqualToString:@"总计"]) {
            [self.titleArray addObject:model.player_zw];
        }else{
            [self.titleArray addObject:[NSString stringWithFormat:@"#%@ %@",model.player_qyh,model.player_zw]];
        }
//        if ([model.name isEqualToString:@"总计"]||[model.time isEqualToString:@"-"]) {
//            [self.titleArray addObject:[NSString stringWithFormat:@"%@",model.name]];
//        }else{
//            [self.titleArray addObject:[NSString stringWithFormat:@"#%@ %@",model.number,model.name]];
//        }
        [self.contentArray addObject:model];
//        if ([model.tb isEqual:@"1"]&&self.emptyIndex==0) {
//            self.emptyIndex = i;
//        }
    }
    if (self.emptyIndex>0) {
        [self.titleArray insertObject:@"" atIndex:self.emptyIndex];
        JCBasketBallMatchTongJiUserModel *aModel = [JCBasketBallMatchTongJiUserModel new];
        [self.contentArray insertObject:aModel atIndex:self.emptyIndex];
    }

    [self.stockView reloadStockView];
}

@end
