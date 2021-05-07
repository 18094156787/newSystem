//
//  JCPostPlanSelectView.m
//  Jingcai
//
//  Created by 陈继伟 on 2019/12/26.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCPostPlanSelectView.h"
#import "JCPostPlanMatchModel.h"
@implementation JCPostPlanSelectView

- (void)initViews {
    
    
    
    self.backgroundColor = [JCBlackColor colorWithAlphaComponent:0.5];
    UIView *bgView = [UIView new];
    [bgView hg_setCornerOnTopWithRadius:AUTO(15)];
    bgView.backgroundColor = JCWhiteColor;
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.height.mas_equalTo(AUTO(360));
    }];
    self.bgView = bgView;
    
    UIView *bgView1 = [UIView new];
    bgView1.backgroundColor = JCClearColor;
    [self addSubview:bgView1];
    [bgView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self);
        make.bottom.equalTo(bgView.mas_top);
    }];
    
    UILabel *titleLab = [UILabel initWithTitle:@"选择比赛" andFont:AUTO(16) andWeight:0 andTextColor:COLOR_98989F andBackgroundColor:JCClearColor andTextAlignment:0];
    titleLab.font = [UIFont boldSystemFontOfSize:AUTO(15)];
    [bgView addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(15));
        make.centerX.equalTo(self);
        make.height.mas_equalTo(AUTO(20));
    }];
    
    UIButton *closeBtn = [UIButton initWithText:@"取消" FontSize:AUTO(16) Weight:1 BackGroundColor:JCClearColor TextColors:COLOR_2F2F2F];
//    [closeBtn setImage:JCIMAGE(@"post_match_close") forState:0];
//    [closeBtn setImage:JCIMAGE(@"post_match_close") forState:UIControlStateHighlighted];
    [bgView addSubview:closeBtn];
    [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(titleLab);
        make.width.height.mas_equalTo(AUTO(40));
    }];
    
    
    self.tableView.estimatedRowHeight = 100;
    [bgView addSubview:self.tableView];
     
     [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.offset(AUTO(50));
         make.left.right.equalTo(bgView);
         //        make.bottom.equalTo(self.view).offset(-kTabBarHeight);
         if (@available(iOS 11.0, *)) {
             make.bottom.equalTo(self.mas_safeAreaLayoutGuideBottom);
         } else {
             make.bottom.equalTo(self);
             // Fallback on earlier versions
         }
     }];
    
    
    WeakSelf;
    [closeBtn bk_whenTapped:^{
        [weakSelf removeFromSuperview];
    }];
    
    [bgView1 bk_whenTapped:^{
        [weakSelf removeFromSuperview];
    }];
    
//    [self show];
}


- (void)show {
      self.bgView.transform = CGAffineTransformMakeTranslation(0, SCREEN_HEIGHT);
    WeakSelf;
    [UIView animateWithDuration:0.3f animations:^{
        weakSelf.bgView.transform = CGAffineTransformIdentity;

    }];
}

#pragma mark - Protocol
#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    JCPostPlanMatchModel *model = self.dataArray[indexPath.row];
//    cell.textLabel.text = @"英超 周四013 热刺 vs 布莱顿";
    NSString *title = [NSString stringWithFormat:@"%@ %@ VS %@",model.leagueName,model.homeName,model.awayName];
    if (model.matchName.length>0) {
        title = [NSString stringWithFormat:@"%@ %@ %@ VS %@",model.leagueName,model.matchName,model.homeName,model.awayName];
    }
    cell.textLabel.text = title;
    cell.textLabel.textColor = COLOR_2F2F2F;
    cell.textLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(16)];
    cell.textLabel.numberOfLines = 0;
    cell.selectionStyle = 0;
    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.0001f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.0001;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *backView= [UIView new];
    return backView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.JCTitleBlock) {
            JCPostPlanMatchModel *model = self.dataArray[indexPath.row];
        //    cell.textLabel.text = @"英超 周四013 热刺 vs 布莱顿";
            NSString *name = [NSString stringWithFormat:@"%@ %@ %@",model.leagueName,NonNil(model.matchName),model.matchTime];
        if (model.matchName.length==0) {
            name = [NSString stringWithFormat:@"%@ %@",model.leagueName,model.matchTime];
        }
        NSDate *date = [NSDate dateWithString:model.matchTime format:@"YY-MM-dd HH:mm:ss"];
        NSString *matchTime =  [date stringWithFormat:@"MM/dd"];

        NSString *nameInfo = [NSString stringWithFormat:@"%@ [%@]  %@ %@vs%@",matchTime,NonNil(model.matchName),model.leagueName,model.homeName,model.awayName];
        if (model.matchName.length==0) {
            nameInfo = [NSString stringWithFormat:@"%@ %@ %@vs%@",matchTime,model.leagueName,model.homeName,model.awayName];
        }
        self.JCTitleBlock(name,nameInfo,model.match_id);
        [self removeFromSuperview];
    }
}

- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    [self.tableView reloadData];
}


- (UITableView *)tableView {
    if (!_tableView) {
        
        UITableView *view = [[UITableView alloc] initWithFrame:CGRectZero style:0];
        view.dataSource = self;
        view.delegate = self;
//                view.separatorStyle = UITableViewCellSeparatorStyleNone;
        //view.separatorColor = COLOR_SEPRATE;
        view.separatorInset = UIEdgeInsetsMake(0.0f, 15, 0.0f, 0.0f);
        view.showsVerticalScrollIndicator = NO;
        view.separatorColor = COLOR_DDDDDD;
        //        view.delaysContentTouches = NO;
        view.estimatedSectionHeaderHeight = 0;
        view.estimatedSectionFooterHeight = 0;
        view.backgroundColor = JCClearColor;
        //注册cell
        [view registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
        
        _tableView = view;
    }
    
    return _tableView;
}
@end
