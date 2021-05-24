//
//  JCMatchFilterVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/6/16.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCMatchFilterVC.h"
#import "JCMatchFilterCell.h"
#import "JCMatchFilterTitleSectionView.h"
#import "JCMatchFilterModel.h"
#import "JCMatchSelectModel.h"
@interface JCMatchFilterVC ()

@property(nonatomic,strong)NSMutableArray *firstLetterArray;

@property(nonatomic,strong)JNDIYemptyView *emptyView;

@end

@implementation JCMatchFilterVC

- (void)viewDidLoad {
    self.style = 1;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initViews];
//    [self refreshData];
}

- (void)initViews {
//    UIView *colorView = [UIView new];
//    colorView.backgroundColor = color
    
    self.tableView.backgroundColor = JCWhiteColor;
    self.tableView.separatorColor = COLOR_DDDDDD;
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.separatorStyle = 0;
    self.tableView.sectionIndexColor = COLOR_333333;//右侧索引字体颜色
    UIView * headView= [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 10)];
    self.tableView.tableHeaderView = headView;
    
    
    self.emptyView = [JNDIYemptyView diyNoDataEmptyViewWithBlock:^{
//        [self refreshData];
    }];
    self.emptyView.imageStr = @"nodata";
    self.emptyView.titleStr = @"当前暂无符合条件赛事！";
    self.emptyView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [self.view addSubview:self.emptyView];
    self.emptyView.hidden = YES;


}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    if (self.selectIndex==1) {
        return [self.firstLetterArray count];
    }
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.selectIndex==1) {
        JCMatchSelectModel *model = self.dataSource[indexPath.section];
        int height = ceil(model.list.count/3.0f);
        return height*AUTO(35)+15;
    }
    
 
    int height = ceil(self.dataArray.count/3.0f);
    return height*AUTO(35)+15;
}



- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.001f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    if (self.selectIndex==1) {
        JCMatchFilterTitleSectionView *view = [JCMatchFilterTitleSectionView new];
        view.titleLab.text = self.firstLetterArray[section];
        return view;
    }

    return [UIView new];
    

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return self.selectIndex==1?AUTO(20):0.001f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    JCMatchFilterCell *cell = [[JCMatchFilterCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"JCMatchFilterCell"];
    cell.backgroundColor = JCClearColor;
    if (self.selectIndex==1) {
        JCMatchSelectModel *model = self.dataSource[indexPath.section];
        cell.dataArray = model.list;
    }else{
        cell.dataArray = self.dataArray;
    }
    
    WeakSelf;
    cell.JCSelectBlock = ^{
        if (weakSelf.JCSelectBlock) {
            weakSelf.JCSelectBlock(weakSelf.selectIndex);
        }
    };

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}

//section右侧index数组
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{

//    return self.type==2?self.firstLetterArray:@[];
    if (self.selectIndex==1) {
        return self.firstLetterArray;
    }
    return @[];
}



#pragma mark --

- (void)selectAllWithStatus:(BOOL)select {
    self.isSelectAll = select;
    
    [self.dataArr enumerateObjectsUsingBlock:^(JCMatchFilterModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.isSelect = select;
    }];
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        [self.dataArr enumerateObjectsUsingBlock:^(JCMatchFilterModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            obj.isSelect = select;
        }];
        
        dispatch_async(dispatch_get_main_queue(), ^{
              [self.tableView reloadData];
        });
    });

  
}

- (void)resetData {
    [self.dataArray removeAllObjects];
    [self.dataArr removeAllObjects];
    self.dataSource = @[];
    [self.tableView reloadData];
}

- (void)setDataSource:(NSArray *)dataSource {
    _dataSource = dataSource;
//    [self.firstLetterArray removeAllObjects];
    if (self.selectIndex==1) {
            self.firstLetterArray = [NSMutableArray array];
            [dataSource enumerateObjectsUsingBlock:^(JCMatchSelectModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [self.firstLetterArray addObject:obj.initials];
                [self.dataArr addObjectsFromArray:obj.list];

            }];
    }else{
        self.dataArray = [NSMutableArray array];
        [self.dataArray addObjectsFromArray:self.dataSource];
        [self.dataArr addObjectsFromArray:self.dataSource];
    }

    [self selectAllWithStatus:YES];//默认全选中
    [self.tableView reloadData];
    self.emptyView.hidden = self.dataSource.count==0?NO:YES;
}


- (NSMutableArray *)firstLetterArray {
    if (!_firstLetterArray) {
        _firstLetterArray = [NSMutableArray array];
    }
    return _firstLetterArray;
}

- (NSMutableArray *)dataArr {
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

@end
