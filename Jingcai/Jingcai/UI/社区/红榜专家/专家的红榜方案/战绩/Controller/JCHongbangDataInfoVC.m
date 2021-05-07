//
//  JCHongbangDataInfoVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/19.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCHongbangDataInfoVC.h"
#import "JCHongbangTopInfoView.h"
#import "JCHBExpertZhanjiHeadView.h"
#import "JCHBExpertZhanjiCell.h"
#import "JCCommunityEventModel.h"
#import "JCTeamMatchWMStickVC.h"
@interface JCHongbangDataInfoVC ()

@property (nonatomic,strong) JCHongbangTopInfoView *headView;

@property (nonatomic,strong) JCHBExpertZhanjiHeadView *zhanjiHeadView;

@end

@implementation JCHongbangDataInfoVC



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initViews];
}

- (void)initViews {
    self.view.backgroundColor = COLOR_F0F0F0;
    self.tableView.separatorInset = UIEdgeInsetsMake(0, AUTO(15), 0, AUTO(15));
    self.tableView.estimatedRowHeight = 180;
    self.tableView.separatorColor = COLOR_DBDBDB;
    self.tableView.scrollEnabled = YES;
    // 表格注册cell
    [self.tableView registerClass:[JCHBExpertZhanjiCell class] forCellReuseIdentifier:@"JCHBExpertZhanjiCell"];
//    [self.tableView registerNib:[UINib nibWithNibName:@"JCVerTuijianUserZJCell" bundle:nil] forCellReuseIdentifier:@"JCVerTuijianUserZJCell"];
//    [self.tableView registerNib:[UINib nibWithNibName:@"JCVerTuijianUserTJCell" bundle:nil] forCellReuseIdentifier:@"JCVerTuijianUserTJCell"];
//    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.top.offset(0);
//        make.left.right.equalTo(self.view);
//        make.bottom.equalTo(self.view).mas_offset(-kBottomTabSafeAreaHeight-20);
//
//    }];

//    self.tableView.mj_header = [JCFootBallHeader headerWithRefreshingBlock:^{
//        self.pageNo = 1;
//        [self loadNewHistoryData];
//    }];
//
//    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
//        [self loadNewHistoryData];
//    }];
//
    WeakSelf;
    JNDIYemptyView *emptyView = [JNDIYemptyView diyNoDataEmptyViewWithBlock:^{
        [weakSelf refreshData];
    }];
    emptyView.contentViewOffset = -100;
    self.tableView.ly_emptyView = emptyView;
}

#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
        return 0;
    }
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    JCHBExpertZhanjiCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCHBExpertZhanjiCell"];
    cell.selectionStyle = 0;
    cell.model = self.dataArray[indexPath.row];
    NSString *imgName = [NSString stringWithFormat:@"hb_zj_%ld",indexPath.row];
    if (indexPath.row>2) {
        cell.iconImgView.image = JCIMAGE(@"hb_zj_2");
    }else{
       cell.iconImgView.image = JCIMAGE(imgName);
    }
    
    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
 
    return AUTO(40);
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section==1) {
        if (self.hbArray.count>0||self.hotArray.count>0) {
            WeakSelf;
            self.zhanjiHeadView.JCHeadBlock = ^(NSString * _Nonnull type) {
                if ([type integerValue]==1) {
                    weakSelf.dataArray = [NSMutableArray arrayWithArray:weakSelf.hbArray];
                }
                if ([type integerValue]==2) {
                    weakSelf.dataArray = [NSMutableArray arrayWithArray:weakSelf.hotArray];
                }
                [weakSelf.tableView reloadData];
            };
            return self.zhanjiHeadView;
        }


    }
    return [UIView new];

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section==1) {
         if (self.hbArray.count>0||self.hotArray.count>0) {
            return AUTO(44);
         }
        return AUTO(44);
    }
    return 0.001f;
}



- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
//    if (section==0) {
//        if (self.hbArray.count>0||self.hotArray.count>0) {
//           return AUTO(10);
//        }
//
//    }
    return 0.0001;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *backView= [UIView new];
    backView.backgroundColor = COLOR_F4F6F9;
    return backView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (indexPath.section==1) {
//        JCTeamMatchWMStickVC *vc = [JCTeamMatchWMStickVC new];
//        JCCommunityEventModel *model = self.dataArray[indexPath.row];
//        vc.event_id= model.event_id;
//        [self.navigationController pushViewController:vc animated:YES];
//    }
}

- (void)setExprtModel:(JCWExpertBall *)exprtModel {
    _exprtModel =exprtModel;
    self.headView.exprtModel = exprtModel;
    if (self.hbArray.count==0&&self.hotArray.count==0&&exprtModel.trend.length==0) {
//                [self chageImageStr:@"nodata" Title:@"没有想要的结果，换个搜索词试试~~" BtnTitle:@""];
        [self chageImageStr:@"nodata_fangan" Title:@"暂时还没有任何战绩噢~" BtnTitle:@""];
        [self.tableView ly_showEmptyView];
    }else {
        self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 255);
        self.tableView.tableHeaderView = self.headView;
        [self.tableView ly_hideEmptyView];
    }
}

- (void)setEvent_Data:(NSDictionary *)event_Data {
    _event_Data = event_Data;
    NSArray *array = event_Data[@"list"];
    [array enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *type = obj[@"type"]; //类别 1盈利率 0命中率
        if ([type integerValue]==1) {
            self.hbArray = [JCWJsonTool arrayWithJson:obj[@"info"] class:[JCCommunityEventModel class]];
        }
        if ([type integerValue]==0) {
            self.hotArray = [JCWJsonTool arrayWithJson:obj[@"info"] class:[JCCommunityEventModel class]];
        }
        
    }];
    
//    self.hotArray = [JCWJsonTool arrayWithJson:event_Data[@"target"] class:[JCCommunityEventModel class]];
    if (self.hbArray.count>0) {
        self.dataArray =  [NSMutableArray arrayWithArray:self.hbArray];
    }else{
        self.dataArray =  [NSMutableArray arrayWithArray:self.hotArray];
    }
    
    self.zhanjiHeadView.yllArray = self.hbArray;
    self.zhanjiHeadView.mzArray = self.hotArray;
    
    

    [self.tableView reloadData];
}


- (JCHongbangTopInfoView *)headView {
    if (!_headView) {
        _headView = [JCHongbangTopInfoView new];
    }
    return _headView;
}

- (JCHBExpertZhanjiHeadView *)zhanjiHeadView {
    if (!_zhanjiHeadView) {
        _zhanjiHeadView = [JCHBExpertZhanjiHeadView new];
    }
    return _zhanjiHeadView;
}

@end
