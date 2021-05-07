//
//  JCMatchQBViewController.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/8.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCMatchQBViewController.h"
#import "JCMatchQBTitleHeadView.h"
#import "JCMatchQBContentCell.h"
@interface JCMatchQBViewController ()

@property (assign, nonatomic) CGFloat tableH;



@end

@implementation JCMatchQBViewController



- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    CGFloat tableH = self.tableView.contentSize.height;
    if (self.needReturnHeightBlock) {
        self.needReturnHeightBlock(tableH);
    }
}

- (void)viewDidLoad {
    self.style = 1;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initViews];
   
}

- (void)initViews {
//    self.tableView.scrollEnabled = NO;
    self.tableView.backgroundColor = COLOR_F0F0F0;
    self.tableView.separatorStyle = 0;
    self.tableView.estimatedRowHeight = 100;
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
    
    [self.tableView registerClass:[JCMatchQBContentCell class] forCellReuseIdentifier:@"JCMatchQBContentCell"];
}

#pragma mark - Protocol
#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
        return self.goodInfoArray.count>0?self.goodInfoArray.count:1;
    }
    if (section==1) {
        return self.badInfoArray.count>0?self.badInfoArray.count:1;
    }
    if (section==2) {
        return self.natureInfoArray.count>0?self.natureInfoArray.count:1;
    }
    return 0;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JCMatchQBContentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCMatchQBContentCell"];
    if (indexPath.section==0&&self.goodInfoArray.count>0) {
        JNMatchQingbaoBall *model =  self.goodInfoArray[indexPath.row];
        cell.contentLab.text = model.info;
        [cell hideNoData];
        return cell;
    }
    if (indexPath.section==1&&self.badInfoArray.count>0) {
        JNMatchQingbaoBall *model =  self.badInfoArray[indexPath.row];
        cell.contentLab.text = model.info;
        [cell hideNoData];
        return cell;
    }
    if (indexPath.section==2&&self.natureInfoArray.count>0) {
        JNMatchQingbaoBall *model =  self.natureInfoArray[indexPath.row];
        cell.contentLab.text = model.info;
        [cell hideNoData];
        return cell;
    }
    JCMatchQBContentCell *commentcell = [tableView dequeueReusableCellWithIdentifier:@"JCMatchQBContentCell"];
    cell.contentLab.text = @"";
    [commentcell showNoDataClearViewWithTitle:@"暂无数据"];
//    UIView *nodataView=  [commentcell clea];
//    nodataView.backgroundColor = JCClearColor;
    return commentcell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0&&self.goodInfoArray.count>0) {
        return UITableViewAutomaticDimension;
    }
    if (indexPath.section==1&&self.badInfoArray.count>0) {
        return UITableViewAutomaticDimension;
    }
    if (indexPath.section==2&&self.natureInfoArray.count>0) {
        return UITableViewAutomaticDimension;
    }
    return 80;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return AUTO(40);
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    JCMatchQBTitleHeadView *headView = [JCMatchQBTitleHeadView new];
    headView.titleLab.font = [UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(14)];
    if (section==0) {
        headView.colorView.backgroundColor = JCBaseColor;
        headView.titleLab.text = @"有利情报";
        return headView;
    }
    if (section==1) {
        headView.colorView.backgroundColor = COLOR_30B27A;
        headView.titleLab.text = @"不利情报";
        return headView;
    }
    if (section==2) {
        headView.colorView.backgroundColor = COLOR_002868;
        headView.titleLab.text = @"中立情报";
        return headView;
    }
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return AUTO(8);
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *backView= [UIView new];
    backView.backgroundColor = COLOR_F0F0F0;
    return backView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if([indexPath row] == ((NSIndexPath*)[[tableView indexPathsForVisibleRows] lastObject]).row) {
        WeakSelf;
        dispatch_async(dispatch_get_main_queue(), ^{
            CGFloat tableH = tableView.contentSize.height;
            weakSelf.tableH = tableH;
            if (weakSelf.needReturnHeightBlock) {
                weakSelf.needReturnHeightBlock(tableH);
            }
        });
    }
}

- (void)setGoodInfoArray:(NSArray *)goodInfoArray {
    _goodInfoArray = goodInfoArray;
    [self.tableView reloadData];
}

- (void)setBadInfoArray:(NSArray *)badInfoArray {
    _badInfoArray = badInfoArray;
    [self.tableView reloadData];
}

- (void)setNatureInfoArray:(NSArray *)natureInfoArray {
    _natureInfoArray = natureInfoArray;
    [self.tableView reloadData];
}



//- (void)setQingbaoBall:(JNMatchQingbaoBall *)qingbaoBall {
//    _qingbaoBall = qingbaoBall;
//    [self.goodInfoArray removeAllObjects];
//    [self.badInfoArray removeAllObjects];
//    NSArray *goodArray = [qingbaoBall.good componentsSeparatedByString:@"<br/><br/>"];
//    [goodArray enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        if (obj.length>0) {
//            [self.goodInfoArray addObject:obj];
//        }
//    }];
//    NSArray *badArray = [qingbaoBall.bad componentsSeparatedByString:@"<br/><br/>"];
//    [badArray enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        if (obj.length>0) {
//            [self.badInfoArray addObject:obj];
//        }
//    }];
//
//    [self.tableView reloadData];
//
//
//}
//- (void)setNeutralBall:(JNMatchQingbaoBall *)neutralBall {
//    _neutralBall = neutralBall;
//
//    NSArray *natureArray = [neutralBall.good componentsSeparatedByString:@"<br/><br/>"];
//    [natureArray enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        if (obj.length>0) {
//            [self.natureInfoArray addObject:obj];
//        }
//    }];
//     [self.tableView reloadData];
////    [self.view setNeedsLayout];
////    if (self.needReturnHeightBlock) {
////        self.needReturnHeightBlock([self contentH]);
////    }
//
////    if (self.goodInfoArray.count==0&&self.badInfoArray.count==0&&self.natureInfoArray.count==0) {
////         [self.view showTopNoData];
////    }
//}



#pragma mark - OVERRIDE
- (CGFloat)contentH {
    return self.tableView.contentSize.height;
}

@end
