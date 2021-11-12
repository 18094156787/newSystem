//
//  JCPlaneDetailFreeVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/14.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCPlaneDetailFreeVC.h"
#import "JCPlaneDetailInfoCell.h"
#import "JCFootBallAuthorDetailWMViewController.h"
#import "JCPlaneDetailImageCell.h"
#import "JCPlaneDetailInfoTipCell.h"
#import "YBImageBrowser.h"
#import "JCFootBallBuyPlaneFootView.h"
#import "JCPlaneDetailMatchCell.h"
#import "JCMatchDetailWMStickVC.h"
#import "JCPlaneDetailInfo_MFCell.h"
#import "JCHongBangOrderDetailVC.h"
#import "JCPlaneDetailSM_View.h"
#import "JCPlaneDetailNewSubTitleCell.h"
#import "JCPlaneDetailNewAnalysisCell.h"
#import "JCPlanDetailFreeContentCell.h"
#import "JCPlaneDetailFreeHeadView.h"
#import "JCPlaneDetailQRcodeCell.h"
#import "JCPlanDetailMZ_Cell.h"
#import "JCFanganSaleOutCell.h"
@interface JCPlaneDetailFreeVC ()

@property (nonatomic,strong) JCFootBallBuyPlaneFootView *footView;

@property (nonatomic,strong) JCPlaneDetailSM_View *smView;

@property (nonatomic, assign) float cellHeight;

@property (nonatomic, assign)  BOOL is_soldOut;//已下架

@end

@implementation JCPlaneDetailFreeVC

- (void)viewDidLoad {
    self.style = 1;
    [super viewDidLoad];
    self.view.backgroundColor = JCWhiteColor;
    // Do any additional setup after loading the view.
//    self.is_soldOut = YES;
    if ([self.planDetailModel.status integerValue]==8) {
//        planDetailModel.status  ==8 表示需要展示已下架的情况
        self.is_soldOut = YES;
    }
    [self initViews];
//    [self refreshData];
//    [self getPeoPleList];
}




- (void)initViews {

    [self.view bringSubviewToFront:self.tableView];

    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.estimatedRowHeight = 80;
    self.tableView.backgroundColor = JCClearColor;
    // 表格注册cell
    [self.tableView registerClass:[JCPlaneDetailInfoCell class] forCellReuseIdentifier:@"JCPlaneDetailInfoCell"];
    [self.tableView registerClass:[JCPlaneDetailImageCell class] forCellReuseIdentifier:@"JCPlaneDetailImageCell"];
    [self.tableView registerClass:[JCPlanDetailMZ_Cell class] forCellReuseIdentifier:@"JCPlanDetailMZ_Cell"];
    
    
    [self.tableView registerClass:[JCPlaneDetailInfo_MFCell class] forCellReuseIdentifier:@"JCPlaneDetailInfo_MFCell"];
    
    
    [self.tableView registerClass:[JCPlaneDetailInfoTipCell class] forCellReuseIdentifier:@"JCPlaneDetailInfoTipCell"];
    [self.tableView registerClass:[JCPlaneDetailNewSubTitleCell class] forCellReuseIdentifier:@"JCPlaneDetailNewSubTitleCell"];
    [self.tableView registerClass:[JCPlaneDetailNewAnalysisCell class] forCellReuseIdentifier:@"JCPlaneDetailNewAnalysisCell"];
    [self.tableView registerClass:[JCPlanDetailFreeContentCell class] forCellReuseIdentifier:@"JCPlanDetailFreeContentCell"];
    [self.tableView registerClass:[JCPlaneDetailMatchCell class] forCellReuseIdentifier:@"JCPlaneDetailMatchCell"];
    [self.tableView registerClass:[JCPlaneDetailQRcodeCell class] forCellReuseIdentifier:@"JCPlaneDetailQRcodeCell"];
    [self.tableView registerClass:[JCFanganSaleOutCell class] forCellReuseIdentifier:@"JCFanganSaleOutCell"];
    
    
    
    
    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.left.right.equalTo(self.view);
        make.bottom.offset(0);
    }];
    
    WeakSelf;
    self.footView.JCMoreBlock = ^{
        [weakSelf getPeoPleList];
    };
}

- (void)getPeoPleList {
    if (self.planDetailModel.type==0) {
         //免费
         self.smView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(80));
         self.tableView.tableFooterView = self.smView;
     }
 
//    if (self.planDetailModel.type==0||!self.planDetailModel) {
//        return;
//    }
//    @weakify(self);
//    [self.view showLoading];
    JCHomeService_New *service = [JCHomeService_New service];
    [service getPlanLookWithTuijian_id:self.planDetailModel.id Page:self.pageNo success:^(id  _Nullable object) {
//        @strongify(self);
        [self.view endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            NSArray *array = [JCWJsonTool arrayWithJson:object[@"data"][@"brown_info"] class:[JCPlanBuyPersonModel class]];
            [self.dataArray addObjectsFromArray:array];
            if (self.planDetailModel.type==0) {
                //免费
//                self.smView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(80));
//                self.tableView.tableFooterView = self.smView;
            }else{
                if (array.count>0) {
                    float width = (SCREEN_WIDTH-AUTO(10))/8.0f;
                    float height = ceil(self.dataArray.count/8.0)*width+AUTO(120);
                    self.footView.frame = CGRectMake(0, 0, SCREEN_WIDTH, height);
                    self.footView.dataArray = self.dataArray;
                    self.tableView.tableFooterView = self.footView;



                }
            }

            
            [self.tableView reloadData];
            self.pageNo++;
            if (array.count==24) {
                self.footView.moreBtn.hidden = NO;
            }else {
                self.footView.moreBtn.hidden = YES;
            }
            
            NSString *count = [NSString stringWithFormat:@"该文章已有%@人查看",self.planDetailModel.click];
            
            NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:count];
            if (self.planDetailModel.click.length>0) {
                NSRange range = [count rangeOfString:self.planDetailModel.click];
                [attrString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(18)] range:range];
                [attrString addAttribute:NSForegroundColorAttributeName value:JCBaseColor range:range];
                self.footView.countLab.attributedText = attrString;
            }

            
        }
    } failure:^(NSError * _Nonnull error) {
        [self.view endLoading];
    }];

    
}

#pragma mark - Protocol
#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    if (self.is_soldOut) {
        return 4;
    }
    if (self.planDetailModel.qr_code_info.url.count>0||self.planDetailModel.qr_code_info.desc.length>0) {
        return 5+self.matchArray.count;
    }
    return 4+self.matchArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.is_soldOut) {
        return 1;
    }
    if (section==0) {
        return 1;
    }
    if (section==1) {
        return 1;
    }
    if (section==2) {
        return 1;
    }
    if (section==self.matchArray.count+3) {
        return 1;
    }
    if (self.planDetailModel.qr_code_info.url.count>0||self.planDetailModel.qr_code_info.desc.length>0) {
        if (section==self.matchArray.count+4) {
            return 1;
        }
    }
    if (self.matchArray.count>0) {
        JCGZHTuiJianModel *model = self.matchArray[section-3];
        return model.match_info.count;
    }

    return 0;
//    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (indexPath.section==1) {
    if (self.is_soldOut) {
        return UITableViewAutomaticDimension;
    }
    
    if (indexPath.section==0&&self.planDetailModel.subtitle.length==0) {
        return 0.01f;
    }
    if (indexPath.section==1) {
        return self.cellHeight;
    }
    if (indexPath.section==self.matchArray.count+3) {
        return UITableViewAutomaticDimension;
    }
    if (self.planDetailModel.qr_code_info.url.count>0||self.planDetailModel.qr_code_info.desc.length>0) {
//        return 0.01f;
        if (indexPath.section==self.matchArray.count+4) {
            return UITableViewAutomaticDimension;
        }
    }

    
    if (indexPath.section>2) {
        return AUTO(100);
    }

    return UITableViewAutomaticDimension;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.is_soldOut) {
        if (indexPath.section==0) {
            JCPlaneDetailNewSubTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCPlaneDetailNewSubTitleCell"];
            cell.planDetailModel = self.planDetailModel;
            return cell;
            
        }
        if (indexPath.section==1) {
            JCFanganSaleOutCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCFanganSaleOutCell"];
//            cell.planDetailModel = self.planDetailModel;
            return cell;
            
        }
        if (indexPath.section==2) {
            JCPlanDetailMZ_Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCPlanDetailMZ_Cell"];
            return cell;
        }
        if (indexPath.section==3) {
            JCPlaneDetailQRcodeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCPlaneDetailQRcodeCell"];
            cell.model= self.planDetailModel.qr_code_info;
            return cell;
        }
    }

    if (indexPath.section==0) {
        JCPlaneDetailNewSubTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCPlaneDetailNewSubTitleCell"];
        cell.planDetailModel = self.planDetailModel;
        return cell;
        
    }
    if (indexPath.section==1) {
//        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
//        return cell;
        JCPlanDetailFreeContentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCPlanDetailFreeContentCell"];
        WeakSelf;
        cell.JCRefreshBlock = ^(float height) {
            weakSelf.cellHeight = height+10;
            [weakSelf.tableView reloadData];
        };
        cell.planDetailModel = self.planDetailModel;

        return cell;
    }
    if (indexPath.section==2) {
        JCPlaneDetailNewAnalysisCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCPlaneDetailNewAnalysisCell"];
        cell.freeDetailModel = self.planDetailModel;
        return cell;
    }
    
    
    if (indexPath.section==self.matchArray.count+3) {
        JCPlanDetailMZ_Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCPlanDetailMZ_Cell"];
        cell.planDetailModel = self.planDetailModel;
        return cell;
    }
    if (indexPath.section==self.matchArray.count+4) {
        JCPlaneDetailQRcodeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCPlaneDetailQRcodeCell"];
        cell.model= self.planDetailModel.qr_code_info;
        return cell;
    }
    if (self.matchArray.count>0) {
        JCGZHTuiJianModel *model = self.matchArray[indexPath.section-3];
        JCPlaneDetailMatchCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCPlaneDetailMatchCell"];
        JCWVerTjInfoMatchBall  *matchModel = model.match_info[indexPath.row];
        cell.model = matchModel;
        return cell;
//        return model.match_info.count;
    }

    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    return cell;
    
    
}
/** 解析成html的富文本 */
- (NSAttributedString *)attrHtmlStringFrom:(NSString *)str {
 
    NSString *headStr = [NSString stringWithFormat:@"<head><style>img{max-width:%f !important;height:auto}</style></head>", SCREEN_WIDTH-AUTO(30)];
//    str = [str stringByAppendingString:@"\n\n\n\n"];
    str = [NSString stringWithFormat:@"%@<html><meta content=\"width=device-width, initial-scale=1.0, maximum-scale=3.0, user-scalable=0; \" name=\"viewport\" /><body style=\"overflow-wrap:break-word;word-break:break-all;white-space: normal; font-size:15px; color:#333333; \">%@</body></html>",headStr,str];
    NSAttributedString *attrStr=  [[NSAttributedString alloc] initWithData:[str dataUsingEncoding:NSUTF8StringEncoding] options:@{NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType,NSCharacterEncodingDocumentAttribute:@(NSUTF8StringEncoding)} documentAttributes:nil error:nil];
    return attrStr;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (!self.is_soldOut&&section==1&&self.planDetailModel.content.length>0) {
        JCPlaneDetailFreeHeadView *headView = [JCPlaneDetailFreeHeadView new];
        return headView;
    }
    UIView *view = [UIView new];
    view.backgroundColor = COLOR_F4F6F9;
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

    if (self.is_soldOut) {
        if (section==0) {
            return AUTO(4);
        }
        if (section==3) {
            if (self.planDetailModel.qr_code_info.url.count==0) {
                return 0.01;
            }
            return AUTO(4);
        }
        return 0.001f;
    }
    if (section==0) {
        return AUTO(4);
    }
    if (!self.is_soldOut&&section==1&&self.planDetailModel.content.length>0) {
        
        return AUTO(45);
    }
    return 0.001f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    UIView *view = [UIView new];
    view.backgroundColor = COLOR_F4F6F9;
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
//    if (section==0) {
//        return AUTO(8);
//    }
//    if (self.planDetailModel.qr_code_info.url.count>0||self.planDetailModel.qr_code_info.desc.length>0){
//        if (section==3+self.matchArray.count) {
//            return AUTO(4);
//        }
//    }
//    else{
//        if (section==1) {
//            return AUTO(4);
//        }
//    }
    


    return 0.001f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (self.planDetailModel.sf_type==2) {
//        //免费
//
//    }
    
    
    if (indexPath.section==0&&indexPath.row>0) {
            NSMutableArray *datas = [NSMutableArray array];
            [self.planDetailModel.image enumerateObjectsUsingBlock:^(JCPostImageModel * object, NSUInteger idx, BOOL * _Nonnull stop) {
//                    JCImgCollectionViewCell *cell = (JCImgCollectionViewCell *)[collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:idx inSection:0]];
        //        // 网络图片
                YBIBImageData *data = [YBIBImageData new];
                data.imageURL = [NSURL URLWithString:object.url];
        //        data.projectiveView = cell.imgView;
                [datas addObject:data];
            }];


            YBImageBrowser *browser = [YBImageBrowser new];
            browser.shouldHideStatusBar = NO;
            browser.dataSourceArray = datas;
            browser.currentPage = indexPath.row-1;
            [browser show];
    }
//    if (indexPath.section==2) {
//        JCWVerTjInfoMatchBall  *model = self.planDetailModel.match[indexPath.row];
//        JCMatchDetailWMStickVC *vc = [JCMatchDetailWMStickVC new];
//        vc.matchNum = model.match_num;
//        [self.navigationController pushViewController:vc animated:YES];
//    }
}

- (void)showBigImage:(NSArray *)imgArray {
    NSMutableArray *datas = [NSMutableArray array];
    [imgArray enumerateObjectsUsingBlock:^(UIImage *_Nonnull img, NSUInteger idx, BOOL * _Nonnull stop) {
//                    JCImgCollectionViewCell *cell = (JCImgCollectionViewCell *)[collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:idx inSection:0]];
//        // 网络图片
        YBIBImageData *data = [YBIBImageData new];
        data.image = ^UIImage * _Nullable{
            return img;
        };
//        data.projectiveView = cell.imgView;
        [datas addObject:data];
    }];


    YBImageBrowser *browser = [YBImageBrowser new];
    browser.shouldHideStatusBar = NO;
    browser.dataSourceArray = datas;
//                browser.currentPage = indexPath.row-1;
    [browser show];
}

- (void)setPlanDetailModel:(JCWTjInfoBall *)planDetailModel {
    _planDetailModel = planDetailModel;
    if (planDetailModel) {
        NSArray *array = planDetailModel.matchs.tuijian;
        if (array.count>0) {
            NSMutableArray *matchArray = [NSMutableArray array];
            for (JCGZHTuiJianModel *model in array) {
                if (model.match.count>0) {
                    [matchArray addObjectsFromArray:model.match];
                }
            }
            planDetailModel.match = [NSArray arrayWithArray:matchArray];
        }
    }
}


- (JCFootBallBuyPlaneFootView *)footView {
    if (!_footView) {
        _footView = [JCFootBallBuyPlaneFootView new];
    }
    return _footView;
}

- (JCPlaneDetailSM_View *)smView {
    if (!_smView) {
        _smView = [JCPlaneDetailSM_View new];
    }
    return _smView;
}

@end
