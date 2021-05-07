//
//  JCActivityRedPacketListView.m
//  Jingcai
//
//  Created by 陈继伟 on 2019/9/26.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCActivityRedPacketListView.h"
#import "JCActivityRedPacketListCell.h"
@implementation JCActivityRedPacketListView

- (void)initViews {
    self.backgroundColor = [JCBlackColor colorWithAlphaComponent:0.5];
    
    UIImageView *imgView = [UIImageView new];
    imgView.image = JCIMAGE(@"redpacket_list");
    imgView.userInteractionEnabled = YES;
    [self addSubview:imgView];
    self.bgImgView = imgView;
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(23));
        make.right.offset(AUTO(-23));
        make.top.offset(AUTO(100));
        make.height.mas_equalTo(AUTO(418));
    }];
    
    [imgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(0));
        make.centerX.equalTo(imgView);
        make.size.mas_equalTo(CGSizeMake(AUTO(280), AUTO(120)));
    }];

    [imgView addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(30));
        make.height.mas_equalTo(AUTO(255));
        make.left.offset(AUTO(30));
        make.right.offset(AUTO(-30));
    }];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = JCWhiteColor;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(imgView.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(1, AUTO(20)));
    }];
    
    UIButton *closeBtn = [UIButton new];
    [closeBtn setImage:JCIMAGE(@"xx_close") forState:0];
     [closeBtn setImage:JCIMAGE(@"xx_close") forState:UIControlStateHighlighted];
    [self addSubview:closeBtn];
    [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView.mas_bottom).offset(0);
        make.centerX.equalTo(imgView);
        make.size.mas_equalTo(CGSizeMake(AUTO(23), AUTO(23)));
    }];
    WeakSelf;
    [closeBtn bk_whenTapped:^{
        [weakSelf removeFromSuperview];
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


    
    JCActivityRedPacketListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCActivityRedPacketListCell"];
    cell.selectionStyle = 0;
    cell.model = self.dataArray[indexPath.row];
    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return AUTO(85);
}


- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    [self.tableView reloadData];
    if (_dataArray.count<=2) {
        [self.bgImgView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.offset(AUTO(23));
            make.right.offset(AUTO(-23));
            make.top.offset(AUTO(100));
            make.height.mas_equalTo(AUTO(340));
        }];
    }

}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(40) andWeight:UIFontWeightHeavy andTextColor:COLOR_E02020 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _titleLab.font = [UIFont boldSystemFontOfSize:AUTO(28)];
//        _titleLab.numberOfLines = 2;
    }
    return _titleLab;
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

        //注册cell
        [view registerClass:[JCActivityRedPacketListCell class] forCellReuseIdentifier:@"JCActivityRedPacketListCell"];
        
        _tableView = view;

        
    }
    
    return _tableView;
}



@end
