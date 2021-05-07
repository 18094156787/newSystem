//
//  JCPostCheckArticleInfoCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/23.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCPostCheckArticleInfoCell.h"
#import "JCImgCollectionViewCell.h"
#import "YBImageBrowser.h"
#import <YYAnimatedImageView.h>
#import "JCCommentMatchCell.h"
#import "JCPostPlanRequestModel.h"
@implementation JCPostCheckArticleInfoCell

- (void)initViews {
    
    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(AUTO(10));
        make.right.offset(AUTO(-15));
//        make.bottom.offset(AUTO(-20));
    }];
    
    [self.contentView addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(10));
        make.height.mas_equalTo(0);
    }];
    
    [self.contentView addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.equalTo(self.collectionView.mas_bottom).offset(AUTO(8));
        make.height.mas_equalTo(0);
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
    if (self.imgArray.count>3) {
        return 3;
    }
    return self.imgArray.count;
    
}

#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
//    float width = SCREEN_WIDTH/3.0f-AUTO(15);
    
//    if (self.imgArray.count==1&&self.model.imageSize.width>0) {
//        return self.model.imageSize;
//
//    }
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
    JCPostImageModel *model = self.imgArray[indexPath.row];
    if ([model.url isKindOfClass:[UIImage class]]) {
        cell.imgView.image = model.url;
    }else{
        [cell.imgView sd_setImageWithURL:[NSURL URLWithString:model.url]];
    }
    


    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
        NSMutableArray *datas = [NSMutableArray array];
        [self.imgArray enumerateObjectsUsingBlock:^(JCPostImageModel *_Nonnull model, NSUInteger idx, BOOL * _Nonnull stop) {

    //        // 网络图片
            YBIBImageData *data = [YBIBImageData new];
            if ( model.asset) {
                data.imagePHAsset = model.asset;
            }else{
                if (model.url) {
                     data.imageURL = [NSURL URLWithString:model.url];
                }
            }

            [datas addObject:data];
        }];


        YBImageBrowser *browser = [YBImageBrowser new];
        browser.shouldHideStatusBar = NO;
        browser.dataSourceArray = datas;
        browser.currentPage = indexPath.row;
        [browser show];
}

#pragma mark <UITableViewDelegate>

//@{@"matchdata":matchArray,@"title":self.titleTV.text,@"content":self.contentTV.text,@"citation":NonNil(self.citationTV.text),@"type":type,@"class":self.type,@"image":imageArray}
//JCPostPlanRequestModel
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (self.model.zucai_examine_tuijian_match.count>0) {
      return  self.model.zucai_examine_tuijian_match.count;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return AUTO(30);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JCCommentMatchCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCCommentMatchCell"];
    NSArray *matchArray = self.model.zucai_examine_tuijian_match;
    JCPostPlanMathInfoModel *model = matchArray[indexPath.row];
    if (model.match_time_three.length>0) {
        model.match_time = model.match_time_three;
    }
    NSString *title= [NSString stringWithFormat:@"%@ %@ %@vs%@",model.match_time,model.competition_name,model.home_team_name,model.away_team_name];
    if (model.round_num.length>0) {
        title = [NSString stringWithFormat:@"%@ [%@] %@ %@vs%@",model.match_time,model.round_num,model.competition_name,model.home_team_name,model.away_team_name];
    }
    cell.title = title;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    JCPostPlanMathInfoModel *matchInfoModel = self.model.zucai_examine_tuijian_match[indexPath.row];
    if (self.matchClickBlock) {
        self.matchClickBlock(matchInfoModel.match_id);
    }
//    NSDictionary * matchDic = self.dianPingBall.match_data[indexPath.row];
//    if (self.matchClickBlock) {
//        self.matchClickBlock(matchDic[@"match_num"]);
//    }
}

- (void)setModel:(JCMyPostCheckTuiJianModel *)model {
    _model = model;
    self.titleLab.text =  model.title;
    if (model.img_info.count>0) {
        self.imgArray = model.img_info;
    }
    
    NSInteger numLine = ceil(self.imgArray.count/3.0f);//多少行
    if (numLine>1) {
        numLine = 1;
    }
     float width = (SCREEN_WIDTH-AUTO(50))/3.0f;
    [self.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(numLine *width);
    }];
    
    NSArray *matchArray  = model.zucai_examine_tuijian_match;
    if (matchArray.count>1) {
        self.tableView.separatorStyle = 1;
    }else{
        self.tableView.separatorStyle = 0;
    }
    if (matchArray.count>0) {
        [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.collectionView.mas_bottom).offset(AUTO(8));
            make.height.mas_equalTo(AUTO(35)*matchArray.count);
            make.bottom.offset(AUTO(-10));
        }];
    }else{
        [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
            [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.collectionView.mas_bottom);
                make.height.mas_equalTo(0);
                make.bottom.offset(AUTO(10));
            }];
        }];
    }

    [self.collectionView reloadData];
    [self.tableView reloadData];
}

//- (void)setDataDic:(NSDictionary *)dataDic {
//    _dataDic = dataDic;
//    self.titleLab.text =  dataDic[@"title"];
//    if (dataDic[@"imageObject"]) {
//        self.imgArray = dataDic[@"imageObject"];
//    }
//    
//    NSInteger numLine = ceil(self.imgArray.count/3.0f);//多少行
//    if (numLine>1) {
//        numLine = 1;
//    }
//     float width = (SCREEN_WIDTH-AUTO(50))/3.0f;
//    [self.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.height.mas_equalTo(numLine *width);
//    }];
//    
//    NSArray *matchArray  = dataDic[@"matchdata"];
//    if (matchArray.count>1) {
//        self.tableView.separatorStyle = 1;
//    }else{
//        self.tableView.separatorStyle = 0;
//    }
//    if (matchArray.count>0) {
//        [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.collectionView.mas_bottom).offset(AUTO(8));
//            make.height.mas_equalTo(AUTO(35)*matchArray.count);
//            make.bottom.offset(AUTO(-10));
//        }];
//    }else{
//        [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
//            [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
//                make.top.equalTo(self.collectionView.mas_bottom);
//                make.height.mas_equalTo(0);
//                make.bottom.offset(AUTO(10));
//            }];
//        }];
//    }
//
//    [self.collectionView reloadData];
//    [self.tableView reloadData];
//}

- (void)setDianPingBall:(JCDianPingBall *)dianPingBall {
    _dianPingBall = dianPingBall;
 
    
    NSString *title = [NSString stringWithFormat:@"%@%@",dianPingBall.out_info,dianPingBall.title];
    NSMutableAttributedString *attrTitle = [[NSMutableAttributedString alloc] initWithString:title];
    NSRange range = [title rangeOfString:dianPingBall.out_info];
    [attrTitle addAttribute:NSForegroundColorAttributeName value:COLOR_E7221D range:range];
    self.titleLab.attributedText = attrTitle;


//    //不要忘记刷新列表
    [self.tableView reloadData];
//    [self setNeedsLayout];
//
//    //未结束的不能点击赛程
//    self.tableView.userInteractionEnabled = [dianPingBall isMatchEnd];
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(AUTO(35)*self.dianPingBall.match_data.count);
    }];

}



- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
        _titleLab.numberOfLines = 2;
    }
    return _titleLab;
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
//        [_tableView registerClass:[JCHongbangCommomMatchCell class] forCellReuseIdentifier:@"JCHongbangCommomMatchCell"];
        
    }
    
    return _tableView;
}


@end
