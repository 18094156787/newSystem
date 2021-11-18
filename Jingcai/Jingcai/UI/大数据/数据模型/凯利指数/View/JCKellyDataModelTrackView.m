//
//  JCKellyDataModelTrackView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/12.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCKellyDataModelTrackView.h"
#import "JCKellyDataModelTrackTitleView.h"
#import "JCPoissonDataModelDetailTitleView.h"
#import "JCKellyDataModelTrackCell.h"
#import "JCKellyDataDetailSampleModel.h"
@implementation JCKellyDataModelTrackView

- (void)initViews {
    
    self.backgroundColor = [JCBlackColor colorWithAlphaComponent:0.5];
    [self addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.offset(AUTO(0));
        make.height.mas_equalTo(SCREEN_HEIGHT-kNavigationBarHeight-AUTO(200));
    }];

    JCPoissonDataModelDetailTitleView *titleView = [JCPoissonDataModelDetailTitleView new];
    [self.bgView addSubview:titleView];
    titleView.titleLab.text = @"凯利指数变化轨迹";
    [titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.offset(0);
        make.height.mas_equalTo(AUTO(50));
    }];

    [self.bgView addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleView.mas_bottom);
        make.left.right.offset(0);
        make.bottom.offset(-kBottomTabSafeAreaHeight);
    }];
//
    UIButton *closeBtn = [UIButton new];
    [closeBtn setImage:JCIMAGE(@"post_match_close") forState:0];
    [closeBtn setImage:JCIMAGE(@"post_match_close") forState:UIControlStateHighlighted];
    [closeBtn addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
    [self.bgView addSubview:closeBtn];
    [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.top.offset(AUTO(5));
        make.width.height.mas_equalTo(AUTO(44));
    }];
    

}

- (void)show {

    
    self.bgView.transform = CGAffineTransformMakeTranslation(0, SCREEN_HEIGHT);
        WeakSelf;
        [UIView animateWithDuration:0.3f animations:^{
            weakSelf.bgView.transform = CGAffineTransformIdentity;
        }];
    
}

#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    JCKellyDataModelTrackCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCKellyDataModelTrackCell"];
    cell.row = indexPath.row;
    cell.dataArray = self.dataArray;
    cell.model = self.dataArray[indexPath.row];
    
    return cell;
    
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

        return AUTO(65);
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [JCKellyDataModelTrackTitleView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return AUTO(40);
}

//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
//    UIView *view = [UIView new];
//    UILabel *sourceLab = [UILabel initWithTitle:@"数据来源：bet365" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCWhiteColor andTextAlignment:NSTextAlignmentCenter];
//    sourceLab.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(40));
//    [view addSubview:sourceLab];
//    return view;;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
//    return AUTO(40);
//}

- (void)setMatch_id:(NSString *)match_id {
    _match_id = match_id;
    JCBaseViewController *vc = (JCBaseViewController *)[self getViewController];
    [vc.jcWindow showLoading];
    JCDataBaseService_New *service = [JCDataBaseService_New new];
    [service getKellyDataModeDetailTrackDataWithMatch_id:self.match_id Success:^(id  _Nullable object) {
        [vc.jcWindow endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            NSArray *array = [JCWJsonTool arrayWithJson:object[@"data"] class:[JCKellyDataDetailSampleModel class]];
            self.dataArray = [NSMutableArray arrayWithArray:array];
            [self.tableView reloadData];
//            self.detailModel = (JCKellyDataDetailModel *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCKellyDataDetailModel class]];



        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [vc.view endLoading];
    }];

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
//        view.scrollEnabled = NO;
        //注册cell
        [view registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
        [view registerClass:[JCKellyDataModelTrackCell class] forCellReuseIdentifier:@"JCKellyDataModelTrackCell"];

        _tableView = view;

        
    }
    
    return _tableView;
}
- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    [self.tableView reloadData];
}

- (void)hide {
    WeakSelf;
    [UIView animateWithDuration:0.3f animations:^{
        weakSelf.bgView.transform = CGAffineTransformMakeTranslation(0, SCREEN_HEIGHT);
         
    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakSelf removeFromSuperview];
        self.dataArray = @[];
        [self.tableView reloadData];
    });
}

-  (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.backgroundColor = JCWhiteColor;
        [_bgView hg_setCornerOnTopWithRadius:20];
    }
    return _bgView;
}
@end
