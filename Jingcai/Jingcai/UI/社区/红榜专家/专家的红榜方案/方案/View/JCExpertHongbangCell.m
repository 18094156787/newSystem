//
//  JCExpertHongbangCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/20.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCExpertHongbangCell.h"
#import "JCImgCollectionViewCell.h"
#import "YBImageBrowser.h"
#import <YYAnimatedImageView.h>
#import "JCCommentMatchCell.h"
#import "JCPostImageModel.h"
#import "JCAIPlanMatchTableCell.h"
@implementation JCExpertHongbangCell

- (void)initViews {

    
    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(AUTO(15));
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
    
    
    [self.contentView addSubview:self.typeLab];
    [self.typeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.equalTo(self.tableView.mas_bottom).offset(AUTO(8));
        make.height.mas_equalTo(AUTO(16));
    }];
    
    [self.contentView addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.typeLab.mas_right).offset(5);
        make.centerY.equalTo(self.typeLab);
    }];
    
    [self.contentView addSubview:self.priceLab];
    [self.priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self.typeLab);
    }];
    

    
    [self.contentView addSubview:self.checkView];
    [self.checkView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
         make.top.equalTo(self.typeLab.mas_bottom).offset(AUTO(8));
        make.bottom.offset(AUTO(-10));
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
        data.imageURL = [NSURL URLWithString:model.image];
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
//    JCCommentMatchCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCCommentMatchCell"];
//    cell.matchDic = self.dianPingBall.match_data[indexPath.row];
//    return cell;
    JCAIPlanMatchTableCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCAIPlanMatchTableCell"];
    cell.dianPingBall = self.dianPingBall;
    cell.model = self.dianPingBall.zucai_tuijian_match[indexPath.row];
    cell.statusImgView.hidden = YES;
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    JCHongBangMatchModel *model = self.dianPingBall.zucai_tuijian_match[indexPath.row];
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


//    self.titleLab.text = dianPingBall.title;
    
    if (dianPingBall.base_info.refund.length>0) {
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
    
    if (dianPingBall.base_info.is_free==0) {
        self.priceLab.text = @"免费";
        self.priceLab.textColor = JCBaseColor;
    }else{
        
        if (dianPingBall.base_info.is_pay==1) {
    //        不需要购买
            self.priceLab.text = @"已购买";
            self.priceLab.textColor = COLOR_666666;
        }else{
            self.priceLab.textColor = JCBaseColor;
            self.priceLab.text = [NSString stringWithFormat:@"%@红币",@([dianPingBall.base_info.sf floatValue]/100.0f)];
        }
        
    }
    


    

    self.timeLab.text = [NSString stringWithFormat:@"%@ 发布 %@人浏览",dianPingBall.base_info.created_at,NonNil(dianPingBall.base_info.click)];
    if ([dianPingBall.base_info.click intValue]==0) {
        self.timeLab.text = [NSString stringWithFormat:@"%@ 发布",dianPingBall.base_info.created_at];
    }
    
    
//    self.typeLab.hidden = dianPingBall.base_info.classfly_desc.length>0?NO:YES;
    if ([dianPingBall.base_info.classfly integerValue]==2) {
        self.typeLab.backgroundColor = [COLOR_002868 colorWithAlphaComponent:0.1];
        self.typeLab.layer.borderColor = COLOR_002868.CGColor;
        self.typeLab.textColor = COLOR_002868;
        self.typeLab.text = [NSString stringWithFormat:@"  %@  ",@"让球"];
    }else if([dianPingBall.base_info.classfly integerValue]==3){
        self.typeLab.backgroundColor = [COLOR_30B27A colorWithAlphaComponent:0.1];
        self.typeLab.layer.borderColor = COLOR_30B27A.CGColor;
        self.typeLab.textColor = COLOR_30B27A;
        self.typeLab.text = [NSString stringWithFormat:@"  %@  ",@"进球数"];;
    }else{
        self.typeLab.backgroundColor = [JCBaseColor colorWithAlphaComponent:0.1];
        self.typeLab.layer.borderColor = JCBaseColor.CGColor;
        self.typeLab.textColor = JCBaseColor;
        self.typeLab.text = [NSString stringWithFormat:@"  %@  ",@"竞足"];
    }
    
    self.resultImgView.hidden = dianPingBall.base_info.wl==0?YES:NO;
//    self.refundImgView.hidden = dianPingBall.out_info.length>0?NO:YES;
    
    self.priceLab.hidden =  dianPingBall.base_info.wl==0?NO:YES;
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
    
    //收费的不展示图片
    if (dianPingBall.base_info.image.count==0||dianPingBall.base_info.sf>0) {
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

//    //不要忘记刷新列表
    [self.tableView reloadData];
//    [self setNeedsLayout];
//
//    //未结束的不能点击赛程
//    self.tableView.userInteractionEnabled = [dianPingBall isMatchEnd];
    self.tableView.userInteractionEnabled = NO;
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        if (dianPingBall.base_info.image.count==0||dianPingBall.base_info.sf>0) {
            make.top.equalTo(self.collectionView.mas_bottom).offset(0);
            make.height.mas_equalTo(AUTO(32)*dianPingBall.zucai_tuijian_match.count);
        }else{
            make.top.equalTo(self.collectionView.mas_bottom).offset(AUTO(8));
            make.height.mas_equalTo(AUTO(32)*dianPingBall.zucai_tuijian_match.count);
        }

    }];
    
    //
    
    [self.checkView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.typeLab.mas_bottom).offset(AUTO(8));
        make.left.right.offset(0);
        make.height.mas_equalTo(0);
        make.bottom.offset(AUTO(-5));
    }];
    //2021-2-7号开始,这边只展示审核通过
    self.checkView.hidden = YES;

}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = COLOR_DDDDDD;
    }
    return _lineView;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(16) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
        _titleLab.numberOfLines = 2;
    }
    return _titleLab;
}

- (UILabel *)checkTimeLab {
    if (!_checkTimeLab) {
        _checkTimeLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _checkTimeLab;
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
        _priceLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _priceLab;
}

- (UILabel *)statusLabel {
    if (!_statusLabel) {
        _statusLabel = [UILabel initWithTitle:@"状态:" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _statusLabel;
}

- (UILabel *)statusLab {
    if (!_statusLab) {
        _statusLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _statusLab;
}



- (UILabel *)editLab {
    if (!_editLab) {
        _editLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_057AFF andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _editLab.layer.borderColor =  COLOR_057AFF.CGColor;
        _editLab.layer.borderWidth = 1;
        _editLab.layer.cornerRadius = 4;
        _editLab.layer.masksToBounds = YES;
        _editLab.userInteractionEnabled = YES;
    }
    return _editLab;
}

- (UILabel *)reasonLab {
    if (!_reasonLab) {
        _reasonLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_FF924B andBackgroundColor:JCClearColor andTextAlignment:0];
        _reasonLab.numberOfLines = 0;
    }
    return _reasonLab;
}

- (UIView *)checkView {
    if (!_checkView) {
        _checkView = [UIView new];
    }
    return _checkView;
}

@end
