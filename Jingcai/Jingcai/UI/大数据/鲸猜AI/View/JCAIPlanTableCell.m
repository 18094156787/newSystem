//
//  JCAIPlanTableCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/25.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCAIPlanTableCell.h"
#import "JCAIPlanMatchTableCell.h"
@implementation JCAIPlanTableCell

- (void)initViews{
    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(AUTO(15));
        make.right.offset(AUTO(-15));
//        make.height.mas_equalTo(AUTO(22));
    }];
    
    [self.contentView addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(8));
        make.height.mas_equalTo(AUTO(32));
    }];
    
    [self.contentView addSubview:self.resultImgView];
    [self.resultImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tableView).offset(AUTO(10));
        make.right.equalTo(self.tableView);
        make.size.mas_equalTo(CGSizeMake(AUTO(35), AUTO(35)));
    }];
    
    [self.contentView addSubview:self.refundImgView];
    [self.refundImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tableView);
        make.right.equalTo(self.tableView).offset(AUTO(-5));
        make.size.mas_equalTo(CGSizeMake(AUTO(52), AUTO(18)));
    }];
    
    [self.contentView addSubview:self.priceView];
    [self.priceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentView);
        make.top.equalTo(self.tableView.mas_bottom).offset(AUTO(10));
        make.height.mas_equalTo(AUTO(20));
        make.bottom.offset(AUTO(-10));
    }];
    
    [self.contentView addSubview:self.buyInfoView];
    [self.buyInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentView);
        make.top.equalTo(self.tableView.mas_bottom).offset(AUTO(10));
        make.height.mas_equalTo(AUTO(20));
        make.bottom.offset(AUTO(-10));
    }];
    

}

#pragma mark <UITableViewDelegate>


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dianPingBall.zucai_tuijian_match.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return AUTO(32);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JCAIPlanMatchTableCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCAIPlanMatchTableCell"];
    cell.dianPingBall = self.dianPingBall;
    cell.refundImgView.hidden = YES;
    cell.statusImgView.hidden = YES;
    cell.is_zh = self.is_zh;
    cell.is_round_num = self.is_round_num;
    cell.model = self.dianPingBall.zucai_tuijian_match[indexPath.row];


    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSDictionary * matchDic = self.dianPingBall.match_data[indexPath.row];
//    if (self.matchClickBlock) {
//        self.matchClickBlock(matchDic[@"match_num"]);
//    }
}


- (void)setDianPingBall:(JCHongBangBall *)dianPingBall {
    _dianPingBall = dianPingBall;
    self.tableView.userInteractionEnabled = NO;
    
    self.resultImgView.hidden = dianPingBall.base_info.wl==0?YES:NO;
    NSString *title = dianPingBall.base_info.title;
    if (dianPingBall.base_info.refund.length>0) {
            NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@" %@",title]];
                NSTextAttachment *attch = [[NSTextAttachment alloc] init];
                   // 表情图片
                   attch.image = JCIMAGE(@"icon_bzfh");
                   // 设置图片大小
                   attch.bounds = CGRectMake(0, -4, 52, 18);
                   // 创建带有图片的富文本
                   NSAttributedString *string = [NSAttributedString attributedStringWithAttachment:attch];

           //    [attr appendAttributedString:string]; //在文字后面添加图片
                [attr insertAttributedString:string atIndex:0];
               self.titleLab.attributedText = attr;

        }else{
            self.titleLab.text = title;
        }
    
    
    
    if (dianPingBall.base_info.wl==1||dianPingBall.base_info.wl==3) {
        self.resultImgView.image = JCIMAGE(@"hb_list_hong");
//        [self.resultImgView mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.tableView).offset(AUTO(10));
//            make.right.equalTo(self.tableView);
//            make.size.mas_equalTo(CGSizeMake(AUTO(35), AUTO(35)));
//        }];
    }
    if (dianPingBall.base_info.wl==2||dianPingBall.base_info.wl==4) {
        self.resultImgView.image = JCIMAGE(@"hb_list_hei");
//        [self.resultImgView mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.tableView).offset(AUTO(10));
//            make.right.equalTo(self.tableView);
//            make.size.mas_equalTo(CGSizeMake(AUTO(35), AUTO(35)));
//        }];
    }
    if (dianPingBall.base_info.wl==5) {
        self.resultImgView.image = JCIMAGE(@"hb_list_zou");
//        [self.resultImgView mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.tableView).offset(AUTO(10));
//            make.right.equalTo(self.tableView);
//            make.size.mas_equalTo(CGSizeMake(AUTO(35), AUTO(35)));
//        }];
    }
    if (dianPingBall.base_info.wl==6) {
        self.resultImgView.image = JCIMAGE(@"hb_list_yq");
//        [self.resultImgView mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.tableView).offset(AUTO(10));
//            make.right.equalTo(self.tableView);
//            make.size.mas_equalTo(CGSizeMake(AUTO(70), AUTO(58)));
//        }];
    }
    if (dianPingBall.base_info.wl==7) {
        self.resultImgView.image = JCIMAGE(@"hb_list_qx");
//        [self.resultImgView mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.tableView).offset(AUTO(10));
//            make.right.equalTo(self.tableView);
//            make.size.mas_equalTo(CGSizeMake(AUTO(70), AUTO(58)));
//        }];
    }
    
    
    
//    self.titleLab.text = dianPingBall.title;
    
    
    
    if (self.showPriceView) {
        self.priceView.hidden = NO;
        self.buyInfoView.hidden = YES;
    }else{
        self.priceView.hidden = YES;
        self.buyInfoView.hidden = NO;
    }
    self.buyInfoView.isMine = self.isMine;
    self.priceView.dianPingBall = dianPingBall;
    self.buyInfoView.dianPingBall = dianPingBall;
    [self.tableView reloadData];
      
}


- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
        _titleLab.numberOfLines = 2;
    }
    return _titleLab;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:0];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorInset = UIEdgeInsetsMake(0.0f, 5, 0.0f, AUTO(10));
        _tableView.separatorColor = COLOR_DDDDDD;
        _tableView.showsVerticalScrollIndicator = NO;
        //        view.delaysContentTouches = NO;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.backgroundColor = JCClearColor;
        _tableView.tableFooterView = [UIView new];
        _tableView.estimatedRowHeight = 50;
        _tableView.separatorStyle = 0;
        _tableView.scrollEnabled = NO;
        [_tableView registerClass:[JCAIPlanMatchTableCell class] forCellReuseIdentifier:@"JCAIPlanMatchTableCell"];
        
    }
    
    return _tableView;
}

- (JCAIPlanPriceInfoView *)priceView {
    if (!_priceView) {
        _priceView = [JCAIPlanPriceInfoView new];
    }
    return _priceView;
}
- (JCAIPlanBuyInfoView *)buyInfoView {
    if (!_buyInfoView) {
        _buyInfoView = [JCAIPlanBuyInfoView new];
    }
    return _buyInfoView;
}


- (UIImageView *)refundImgView {
    if (!_refundImgView) {
        _refundImgView = [UIImageView new];
        _refundImgView.image = JCIMAGE(@"hb_bzfh");
        _refundImgView.hidden = YES;
    }
    return _refundImgView;
}

- (UIImageView *)resultImgView {
    if (!_resultImgView) {
        _resultImgView = [UIImageView new];
    }
    return _resultImgView;
}

@end
