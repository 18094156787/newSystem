//
//  JCMyBuyHongbangCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/16.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCMyBuyHongbangCell.h"
#import "JCImgCollectionViewCell.h"
#import "YBImageBrowser.h"
#import <YYAnimatedImageView.h>
#import "JCCommentMatchCell.h"
#import "JCPostImageModel.h"
#import "JCAIPlanMatchTableCell.h"
@implementation JCMyBuyHongbangCell

- (void)initViews {
    
    [self.contentView addSubview:self.userInfoBgView];
    [self.userInfoBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.contentView);
        make.height.mas_equalTo(AUTO(50));
    }];
    
    
    [self.userInfoBgView addSubview:self.headImgView];
    [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.bottom.offset(0);
        make.width.height.mas_equalTo(AUTO(40));
    }];
    
    [self.userInfoBgView addSubview:self.nameLab];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImgView.mas_right).offset(AUTO(4));
        make.top.equalTo(self.headImgView);
        make.height.mas_equalTo(AUTO(22));

    }];
    
    [self.userInfoBgView addSubview:self.nearLab];
    [self.nearLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLab);
        make.top.equalTo(self.nameLab.mas_bottom);
        make.height.mas_equalTo(AUTO(14));
    }];

    [self.userInfoBgView addSubview:self.hongLab];
    [self.hongLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nearLab.mas_right).offset(AUTO(3));
        make.top.equalTo(self.nameLab.mas_bottom);
        make.height.mas_equalTo(AUTO(14));
    }];


    
    [self.userInfoBgView addSubview:self.yllLab];
    [self.yllLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.top.equalTo(self.nameLab);
        make.height.mas_equalTo(AUTO(28));
    }];

    [self.userInfoBgView addSubview:self.yllInfoLab];
    [self.yllInfoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.yllLab);
        make.top.equalTo(self.yllLab.mas_bottom);
    }];
    
    [self.userInfoBgView insertSubview:self.userClickView atIndex:0];
    [self.userClickView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.offset(0);
        make.bottom.equalTo(self.headImgView);
        make.right.equalTo(self.nameLab);
    }];
    
    
    
    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImgView);
        make.top.equalTo(self.userInfoBgView.mas_bottom).offset(AUTO(10));
        make.right.offset(AUTO(-15));
//        make.bottom.offset(AUTO(-20));
    }];
    
    [self.contentView addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(10));
        make.width.mas_equalTo(SCREEN_WIDTH-AUTO(30));
        make.height.mas_equalTo(AUTO(110));
    }];
    
    [self.contentView addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.equalTo(self.collectionView.mas_bottom).offset(AUTO(8));
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
    
    [self.contentView addSubview:self.timeView];
    [self.timeView mas_makeConstraints:^(MASConstraintMaker *make) {
       make.left.offset(0);
       make.right.offset(0);
        make.top.equalTo(self.tableView.mas_bottom);
       make.height.mas_equalTo(AUTO(40));
    }];
    
    [self.timeView addSubview:self.typeLab];
    [self.typeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(self.timeView);
        make.height.mas_equalTo(AUTO(16));
    }];
    
    [self.timeView addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.typeLab.mas_right).offset(5);
        make.centerY.equalTo(self.timeView);
    }];
    

    
    [self.timeView addSubview:self.priceLab];
    [self.priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self.timeView);
    }];
    
    
    
    UIView *lineView1= [UIView new];
    lineView1.backgroundColor = [COLOR_000000 colorWithAlphaComponent:0.06];
    [self.contentView addSubview:lineView1];
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.equalTo(self.timeView.mas_bottom).offset(0);
        make.height.mas_equalTo(1);
    }];
    
    [self.contentView addSubview:self.priceView];
    [self.priceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView1.mas_bottom).offset(AUTO(8));
        make.left.right.offset(0);
        make.height.mas_equalTo(AUTO(30));
        make.bottom.offset(AUTO(0));
    }];
    
    [self.priceView addSubview:self.payPriceLab];
    [self.payPriceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(0);
    }];
    
    [self.priceView addSubview:self.statusLab];
    [self.statusLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.payPriceLab.mas_right).offset(AUTO(40));
        make.top.offset(0);
    }];
    
    [self.priceView addSubview:self.indicateImgView];
    [self.indicateImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self.payPriceLab);
        make.size.mas_equalTo(CGSizeMake(AUTO(5), AUTO(10)));
    }];

    [self.priceView addSubview:self.orderDetailLab];
    [self.orderDetailLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.indicateImgView.mas_left).offset(-3);
        make.centerY.equalTo(self.indicateImgView);
    }];
    
    WeakSelf;
    [self.userClickView bk_whenTapped:^{
        if (weakSelf.userClickBlock) {
            weakSelf.userClickBlock(weakSelf.dianPingBall.base_info.user_id);
        }
    }];
    

    [self.orderDetailLab bk_whenTapped:^{
        if (weakSelf.JCBlock) {
            weakSelf.JCBlock();
        }
    }];
    
}

#pragma mark -- UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return self.dianPingBall.base_info.image.count;
    
}

#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{

    JCPostImageModel *model = self.dianPingBall.base_info.image[indexPath.row];
    if (self.dianPingBall.base_info.image.count==1) {//model.height>0&&model.size.width>0
        return [model getImgSize];
    }
    float width = AUTO(110);
    return CGSizeMake(width, width);
    
}


//行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    
    return AUTO(8);
}
//列间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
    return AUTO(5);
}


//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    JCImgCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"JCImgCollectionViewCell" forIndexPath:indexPath];
    cell.countLab.hidden = YES;
    JCPostImageModel *model = self.dianPingBall.base_info.image[indexPath.row];
    [cell.imgView sd_setImageWithURL:[NSURL URLWithString:model.url] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
       
    }];

    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return;
    
    // 图片预览
    NSMutableArray *datas = [NSMutableArray array];
    [self.dianPingBall.base_info.image enumerateObjectsUsingBlock:^(JCPostImageModel *_Nonnull model, NSUInteger idx, BOOL * _Nonnull stop) {
            JCImgCollectionViewCell *cell = (JCImgCollectionViewCell *)[collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:idx inSection:0]];
//        // 网络图片
        YBIBImageData *data = [YBIBImageData new];
//        data.image = ^UIImage * _Nullable{
//
//        };
        data.imageURL = [NSURL URLWithString:model.url];
//        data.projectiveView = cell.imgView;
        [datas addObject:data];
    }];


    YBImageBrowser *browser = [YBImageBrowser new];
    browser.shouldHideStatusBar = NO;
    browser.dataSourceArray = datas;
    browser.currentPage = indexPath.row;
    [browser show];
}

#pragma mark <UITableViewDelegate>


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dianPingBall.zucai_tuijian_match.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return AUTO(30);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    JCAIPlanMatchTableCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCAIPlanMatchTableCell"];
//    cell.dianPingBall = self.dianPingBall;
    cell.is_zh= self.is_zh;
    cell.is_round_num = self.is_round_num;
    cell.model = self.dianPingBall.zucai_tuijian_match[indexPath.row];
    cell.statusImgView.hidden = YES;
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    JCHongBangMatchModel * model = self.dianPingBall.zucai_tuijian_match[indexPath.row];
    if (self.matchClickBlock) {
        self.matchClickBlock(model.match_id);
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
 
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {

        if (indexPath.row==self.dianPingBall.zucai_tuijian_match.count-1) {
            [cell setSeparatorInset: UIEdgeInsetsMake(0, SCREEN_WIDTH, 0, 0)];
        }else{
            [cell setSeparatorInset: UIEdgeInsetsMake(0.0f, AUTO(10), 0.0f, AUTO(10))];
            
        }
    }

}

- (void)setDianPingBall:(JCHongBangBall *)dianPingBall {
    _dianPingBall = dianPingBall;
if (![dianPingBall isKindOfClass:[JCHongBangBall class]]) {
    return;
    }
    self.userInfoBgView.hidden = self.hideUserView;
    if (self.hideUserView) {
       [self.userInfoBgView mas_updateConstraints:^(MASConstraintMaker *make) {
             make.height.mas_equalTo(0);
         }];
        
        [self.titleLab mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.userInfoBgView.mas_bottom).offset(AUTO(20));
        }];
    }else{
        [self.userInfoBgView mas_updateConstraints:^(MASConstraintMaker *make) {
             make.height.mas_equalTo(AUTO(50));
         }];
        
        [self.titleLab mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.userInfoBgView.mas_bottom).offset(AUTO(10));
        }];
    }
    
    
//    UIImage * placeImage = [JCWConvertTool imageWithColor:[UIColor groupTableViewBackgroundColor]];
    [self.headImgView sd_setImageWithURL:[NSURL URLWithString:dianPingBall.base_info.user_img] placeholderImage:JCIMAGE(@"ic_hb_default")];
    self.nameLab.text = NonNil(dianPingBall.base_info.user_name);
    if ([dianPingBall.base_info.refund intValue]==1||[dianPingBall.base_info.refund isEqualToString:@"不中返还"]) {
        NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@" %@",dianPingBall.base_info.title]];
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
        self.titleLab.text = dianPingBall.base_info.title;
    }
    
    

//    self.titleLab.text = dianPingBall.title;
    
    self.resultImgView.hidden = dianPingBall.base_info.wl==0?YES:NO;
//    self.refundImgView.hidden = dianPingBall.out_info.length>0?NO:YES;
    
    if (dianPingBall.base_info.wl==1||dianPingBall.base_info.wl==3) {
        self.resultImgView.image = JCIMAGE(@"hb_list_hong");

    }
    if (dianPingBall.base_info.wl==2||dianPingBall.base_info.wl==4) {
        self.resultImgView.image = JCIMAGE(@"hb_list_hei");

    }
    if (dianPingBall.base_info.wl==5) {
        self.resultImgView.image = JCIMAGE(@"hb_list_zou");

    }
    if (dianPingBall.base_info.wl==6) {
        self.resultImgView.image = JCIMAGE(@"hb_list_yq");

    }
    if (dianPingBall.base_info.wl==7) {
        self.resultImgView.image = JCIMAGE(@"hb_list_qx");

    }
    
    
    if (dianPingBall.base_info.image.count==0||dianPingBall.base_info.sf>0||self.hideImage) {
            [self.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0);
        }];
    }else{
        
        if (dianPingBall.base_info.image.count==1) {
            JCPostImageModel *model = dianPingBall.base_info.image.firstObject;
            [self.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo([model getImgSize].height);
                make.width.mas_equalTo([model getImgSize].width);
            }];
        }else{
            [self.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(AUTO(110));
                make.width.mas_equalTo(SCREEN_WIDTH-AUTO(30));
            }];
        }

    }
    if ([dianPingBall.base_info.sf integerValue]==0&&dianPingBall.base_info.image.count>0) {
        if (dianPingBall.base_info.image.count==1) {
            JCPostImageModel *model = dianPingBall.base_info.image.firstObject;
            [self.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo([model getImgSize].height);
                make.width.mas_equalTo([model getImgSize].width);
            }];
        }else{
            [self.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(AUTO(110));
                make.width.mas_equalTo(SCREEN_WIDTH-AUTO(30));
            }];
        }
    }
    [self.collectionView reloadData];
    

    self.timeLab.text = [NSString stringWithFormat:@"%@",dianPingBall.base_info.created_at];
    
    self.typeLab.text = [NSString stringWithFormat:@"  %@  ",dianPingBall.base_info.classfly_desc];
    self.typeLab.hidden = dianPingBall.base_info.classfly_desc.length>0?NO:YES;
    if ([dianPingBall.base_info.classfly integerValue]==2) {
        self.typeLab.backgroundColor = [COLOR_002868 colorWithAlphaComponent:0.1];
        self.typeLab.layer.borderColor = COLOR_002868.CGColor;
        self.typeLab.textColor = COLOR_002868;
    }else if([dianPingBall.base_info.classfly integerValue]==3){
        self.typeLab.backgroundColor = [COLOR_30B27A colorWithAlphaComponent:0.1];
        self.typeLab.layer.borderColor = COLOR_30B27A.CGColor;
        self.typeLab.textColor = COLOR_30B27A;
    }else{
        self.typeLab.backgroundColor = [JCBaseColor colorWithAlphaComponent:0.1];
        self.typeLab.layer.borderColor = JCBaseColor.CGColor;
        self.typeLab.textColor = JCBaseColor;
    }
    
    //原价
    NSString *ori_price = [NSString stringWithFormat:@"原价 %@",dianPingBall.base_info.total_price];
    NSMutableAttributedString *ori_attr = [[NSMutableAttributedString alloc] initWithString:ori_price];
    NSRange ori_range = [ori_price rangeOfString:@"原价"];
    [ori_attr addAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(10)],NSForegroundColorAttributeName:COLOR_9F9F9F} range:ori_range];
    self.priceLab.attributedText = ori_attr;

//    if (dianPingBall.base_info.is_pay==1) {
//        self.priceLab.text = @"已购买";
//        self.priceLab.textColor = COLOR_2F2F2F;
//    }else{
//        self.priceLab.textColor = JCBaseColor;
//        if ([dianPingBall.base_info.sf intValue]==0) {
//            self.priceLab.text = @"免费";
//        }else{
//            NSString *price = [NSString stringWithFormat:@"%@红币",@([dianPingBall.base_info.sf floatValue]/100.0f)];
//            self.priceLab.text = price;
//        }
//    }
    NSString *price = [NSString stringWithFormat:@"实付金额：%@",dianPingBall.base_info.zucai_order_pay_price];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:price];
    NSRange pay_range = [price rangeOfString:@"实付金额："];
    [attr addAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)]} range:pay_range];
    self.payPriceLab.attributedText = attr;
    
    if (dianPingBall.base_info.zucai_order_refund_status==4) {

        self.statusLab.text = @"已退款";
        self.statusLab.textColor  =COLOR_30B27A;
    }else {
        self.statusLab.text = @"正常";
        self.statusLab.textColor  =COLOR_999999;
    }


    
//    dianPingBall.lianhong = @"5连红";
    if (dianPingBall.base_info.mingzhong_rate.length==0) {
//        self.nearLab.text = @"";
        [self.hongLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLab);
            make.top.equalTo(self.nameLab.mas_bottom);
            make.height.mas_equalTo(AUTO(14));
        }];
    }else{
        [self.hongLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nearLab.mas_right).offset(AUTO(3));
            make.top.equalTo(self.nameLab.mas_bottom);
            make.height.mas_equalTo(AUTO(14));
        }];
//        self.nearLab.text = @"";
    }
    self.nearLab.text = [NSString stringWithFormat:@"  近10中%@  ",dianPingBall.base_info.mingzhong_rate];
    self.hongLab.hidden = [dianPingBall.base_info.hong integerValue]>0?NO:YES;
    self.nearLab.hidden = dianPingBall.base_info.mingzhong_rate.length>0?NO:YES;
    if ([dianPingBall.base_info.hong intValue]>0) {
        self.hongLab.text = [NSString stringWithFormat:@" %@连红 ",dianPingBall.base_info.hong];
    }else{
        self.hongLab.text = @"";
    }
    
    if (dianPingBall.base_info.mingzhong_rate.length==0&&[dianPingBall.base_info.hong integerValue]==0) {
        [self.nameLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.headImgView.mas_right).offset(AUTO(4));
            make.centerY.equalTo(self.headImgView);
            make.height.mas_equalTo(AUTO(22));
        }];
    }else{
        [self.nameLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.headImgView.mas_right).offset(AUTO(4));
            make.top.equalTo(self.headImgView);
            make.height.mas_equalTo(AUTO(22));
        }];
    }
    
    
    if (dianPingBall.base_info.talent_rate.length>0) {
//        NSString *yll = [NSString stringWithFormat:@"%@%%",dianPingBall.base_info.talent_rate];

        self.yllLab.text = [NSString stringWithFormat:@"%@%%",dianPingBall.base_info.talent_rate];
        self.yllInfoLab.text = @"盈利率";
        
    }else{
        self.yllLab.text = @"";
        self.yllInfoLab.text = @"";
    }
//    self.yllLab.text = @"100%";
//    self.yllInfoLab.text = @"盈亏率";


//    //不要忘记刷新列表
    [self.tableView reloadData];
//    [self setNeedsLayout];
//
//    //未结束的不能点击赛程
//    self.tableView.userInteractionEnabled = [dianPingBall isMatchEnd];
    self.tableView.userInteractionEnabled = NO;
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        if (dianPingBall.base_info.image.count>0&&[dianPingBall.base_info.sf integerValue]==0) {
            make.top.equalTo(self.collectionView.mas_bottom).offset(AUTO(8));
        }else{
            make.top.equalTo(self.collectionView.mas_bottom).offset(0);
        }
        make.height.mas_equalTo(1+AUTO(30)*self.dianPingBall.zucai_tuijian_match.count);
    }];
    
    if (self.dianPingBall.zucai_tuijian_match.count>0) {
        [self.resultImgView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.tableView).offset(AUTO(10));
        }];
    }else{
        [self.resultImgView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.tableView).offset(AUTO(-15));
        }];
    }
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = COLOR_DDDDDD;
    }
    return _lineView;
}


- (UIView *)userInfoBgView {
    if (!_userInfoBgView) {
        _userInfoBgView = [UIView new];
    }
    return _userInfoBgView;
}

-(UIImageView *)headImgView {
    if (!_headImgView) {
        _headImgView = [UIImageView new];
        [_headImgView hg_setAllCornerWithCornerRadius:AUTO(15)];
    }
    return _headImgView;
}

- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _nameLab;
}

- (UILabel *)nearLab {
    if (!_nearLab) {
        _nearLab = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
//        _nearLab.layer.borderColor = COLOR_0091FF.CGColor;
        _nearLab.layer.borderColor = JCBaseColor.CGColor;
        _nearLab.layer.borderWidth = 0.5;
        _nearLab.layer.cornerRadius = AUTO(7);
        _nearLab.layer.masksToBounds = YES;
    }
    return _nearLab;
}

- (UILabel *)hongLab {
    if (!_hongLab) {
        _hongLab = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
        _hongLab.layer.borderColor = JCBaseColor.CGColor;
        _hongLab.layer.borderWidth = 0.5;
        _hongLab.layer.cornerRadius = AUTO(7);
        _hongLab.layer.masksToBounds = YES;
    }
    return _hongLab;
}




- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
        _titleLab.numberOfLines = 2;
    }
    return _titleLab;
}

- (UILabel *)yllLab {
    if (!_yllLab) {
        _yllLab = [UILabel initWithTitle:@"" andFont:AUTO(20) andWeight:2 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _yllLab;
}

- (UILabel *)yllInfoLab {
    if (!_yllInfoLab) {
        _yllInfoLab = [UILabel initWithTitle:@"盈利率" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _yllInfoLab;
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

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        //确定是水平滚动，还是垂直滚动
        UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
//        flowLayout.sectionInset = UIEdgeInsetsMake(0, 0,AUTO(10), 0);
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.dataSource=self;
        _collectionView.delegate=self;
        [_collectionView setBackgroundColor:JCWhiteColor];
        _collectionView.scrollEnabled = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.userInteractionEnabled = NO;
        [_collectionView registerClass:[JCImgCollectionViewCell class]
            forCellWithReuseIdentifier:@"JCImgCollectionViewCell"];
    }
    return _collectionView;
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
        _tableView.scrollEnabled = NO;
        [_tableView registerNib:[UINib nibWithNibName:@"JCCommentMatchCell" bundle:nil] forCellReuseIdentifier:@"JCCommentMatchCell"];
        [_tableView registerClass:[JCAIPlanMatchTableCell class] forCellReuseIdentifier:@"JCAIPlanMatchTableCell"];
        
    }
    
    return _tableView;
}

- (UIView *)userClickView {
    if (!_userClickView) {
        _userClickView = [UIView new];
    }
    return _userClickView;
}

- (UILabel *)typeLab {
    if (!_typeLab) {
        _typeLab = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:[JCBaseColor colorWithAlphaComponent:0.1] andTextAlignment:0];
        _typeLab.layer.borderWidth = 0.5;
        _typeLab.layer.borderColor = JCBaseColor.CGColor;
        _typeLab.layer.masksToBounds = YES;
        _typeLab.layer.cornerRadius = AUTO(8);
    }
    return _typeLab;
}


- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _timeLab;
}


- (UILabel *)priceLab {
    if (!_priceLab) {
        _priceLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _priceLab;
}

- (UIView *)timeView {
    if (!_timeView) {
        _timeView = [UIView new];
    }
    return _timeView;
}

- (UIView *)priceView {
    if (!_priceView) {
        _priceView = [UIView new];
    }
    return _priceView;
}

- (UILabel *)payPriceLab {
    if (!_payPriceLab) {
        _payPriceLab = [UILabel initWithTitle:@"" andFont:AUTO(13) andWeight:2 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _payPriceLab;
}

- (UILabel *)statusLab {
    if (!_statusLab) {
        _statusLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_30B27A andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _statusLab;
}

- (UILabel *)orderDetailLab {
    if (!_orderDetailLab) {
        _orderDetailLab = [UILabel initWithTitle:@"订单详情" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
        _orderDetailLab.userInteractionEnabled = YES;
    }
    return _orderDetailLab;
}

- (UIImageView *)indicateImgView {
    if (!_indicateImgView) {
        _indicateImgView = [UIImageView new];
        _indicateImgView.image = JCIMAGE(@"common_arrow_right");
    }
    return _indicateImgView;
}
@end
