//
//  JCPostPlanVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/21.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCPostPlanVC.h"
#import "JCPostPlanHeadView.h"
#import "JCPostPlanFootView.h"
#import "JCPostPlanCommonCell.h"
#import "JCPostPlanOPCell.h"
#import "JCPostPlanSelectView.h"
#import "JCPostPlanMatchModel.h"
#import "JCPostPlanMathInfoModel.h"
#import "JCPostPlanItemModel.h"
#import "JCPostPlanRequestModel.h"
#import "UITextView+Placeholder.h"
#import "JCDatePickerView.h"
#import "BRDatePickerView.h"
#import "JCPostPlanSearchMatchHeadView.h"
#import "JCPostPlanAddFootView.h"
#import "JCPostImageModel.h"
#import "JCBaseTitleAlertView.h"
#import "JCPostPlanCell.h"
#import "JCBaseTitleAlertView.h"
#import "JCCommomSelectView.h"
#import "JCPostPriceModel.h"
#import "JCPostPlanRequest_integerModel.h"
#import "JCMyPostCheckTuiJianModel.h"
#import "JCWSensitiveWordsModel.h"
@interface JCPostPlanVC ()

@property (nonatomic,strong) JCPostPlanHeadView *headView;

@property (nonatomic,strong) UIView *bottomView;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) UIButton *submitBtn;

@property (nonatomic,strong) JCPostPlanSelectView *raceSelectView;

@property (nonatomic,strong) UITextView *titleTV;//标题

@property (nonatomic,strong) UITextView *citationTV;//引文

@property (nonatomic,strong) UITextView *contentTV;//正文

@property (nonatomic,strong) NSMutableArray *itemArray;

@property (nonatomic,strong) NSArray *matchArray;

@property (nonatomic,assign) NSInteger currentIndex;

@property (nonatomic,copy) NSString *titleInfo;

@property (nonatomic,copy) NSString *citation;

@property (nonatomic,copy) NSString *content;

@property (nonatomic,strong) NSString *matchSearchStr;//比赛搜索

@property (nonatomic,strong) JCPostPlanFootView *footView;

@property (nonatomic,assign) BOOL isAdd;

@property (nonatomic,strong) NSArray *selectedPhotos;

@property (nonatomic,strong) NSArray *deletedPhotos;

@property (nonatomic,strong) UIButton *addImgBtn;

@property (nonatomic,strong) NSDictionary *sensitiveData;

@property (nonatomic,assign) NSInteger fabu_count;

@property (nonatomic,strong) NSArray *dcPriceArray;//单场价格

@property (nonatomic,strong)  NSArray *scPriceArray;//多串价格

@property (nonatomic,strong) NSArray *dcPriceInfoArray;//单场价格

@property (nonatomic,strong)  NSArray *scPriceInfoArray;//多串价格

@property (nonatomic,strong) JCPostPriceModel *dcRefundModel;//单场不中返还价格

@property (nonatomic,strong) JCPostPriceModel *scRefundModel;//多串不中返还价格

@end

@implementation JCPostPlanVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
    [self setNavBackImg];
    
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
    
}

- (void)viewDidLoad {
    self.style = 1;
    [super viewDidLoad];
    self.view.backgroundColor = COLOR_F0F0F0;
    self.title = @"达人方案";
    self.fabu_count = [[JCWUserBall currentUser].fabu_count integerValue];
    [self initViews];
//    self.postID = @"37157";
    [self getPriceList];
    [self getMatchListWithShow:NO];//获取比赛列表
    [self getMyPostPlanDetail];//获取我发布的方案详情(ps:重新编辑时调用)
    [self canPostEanble];
}


- (void)initViews {
    if ([self.type integerValue]==1) {
        self.title = @"发布方案(竞足)";
    }
    if ([self.type integerValue]==2) {
        self.title = @"发布方案(让球)";
    }
    if ([self.type integerValue]==3) {
        self.title = @"发布方案(进球数)";
    }
    
    self.submitBtn.frame = CGRectMake(0, 0, 40, 40);
    UIView *itemBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [itemBgView addSubview:self.submitBtn];
    UIBarButtonItem *submitItem = [[UIBarButtonItem alloc] initWithCustomView:itemBgView];
    self.navigationItem.rightBarButtonItem = submitItem;
    
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(8));
    }];
    
    self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(110));
    self.tableView.tableHeaderView = self.headView;
    self.titleTV = self.headView.titleTFView;
    
    self.tableView.backgroundColor = COLOR_F6F6F6;
    self.tableView.separatorStyle = 0;
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    [self.tableView registerClass:[JCPostPlanOPCell class] forCellReuseIdentifier:@"JCPostPlanOPCell"];
    [self.tableView registerClass:[JCPostPlanCell class] forCellReuseIdentifier:@"JCPostPlanCell"];
    [self.tableView registerClass:[JCPostPlanCommonCell class] forCellReuseIdentifier:@"JCPostPlanCommonCell"];

    
    WeakSelf;
    self.footView.JCPhotoBlock = ^(NSArray * _Nonnull imgArray, NSArray * _Nonnull deleteImgArray) {
        weakSelf.selectedPhotos = [NSArray arrayWithArray:imgArray];
        weakSelf.addImgBtn.hidden = imgArray.count==9?YES:NO;
        weakSelf.deletedPhotos = [NSArray arrayWithArray:deleteImgArray];
    };

    self.headView.JCContentBlock = ^(NSString * _Nonnull str) {
        weakSelf.titleInfo = str;
        [weakSelf canPostEanble];
    };

    
}

#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section==0) {
       return self.itemArray.count;
    }
    if (section==1) {
        return self.dataArray.count;
    }
    return 0;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {


    if (indexPath.section==0) {
        JCPostPlanCommonCell *commonCell = [tableView dequeueReusableCellWithIdentifier:@"JCPostPlanCommonCell"];
        JCPostPlanItemModel *model = self.itemArray[indexPath.row];
        if (indexPath.row==2) {
            commonCell.switchBtn.userInteractionEnabled = [self configRefundStatusWithCell:commonCell];
        }
        
        commonCell.model = model;
        return commonCell;
    }
    if ([self.type integerValue]>1) {
        JCPostPlanCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCPostPlanCell"];
        cell.type = self.type;
        JCPostPlanMathInfoModel *model = self.dataArray[indexPath.row];
        cell.model = model;
        WeakSelf;
        cell.JCTitleSelectBlock = ^{
            weakSelf.currentIndex = indexPath.row;
            [weakSelf.view endEditing:YES];
            weakSelf.isAdd = NO;
            [weakSelf showMatchSelView];
        };

        [cell.deleteBtn bk_whenTapped:^{
            weakSelf.currentIndex = indexPath.row;
            [weakSelf.dataArray removeObjectAtIndex:indexPath.row];
            [weakSelf.tableView reloadData];


        }];

        return cell;
    }
    
    JCPostPlanOPCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCPostPlanOPCell"];
    JCPostPlanMathInfoModel *model = self.dataArray[indexPath.row];
    cell.model = model;
    cell.lineView.hidden = NO;
    if (self.dataArray.count>1) {
        if (indexPath.row==self.dataArray.count-1) {
            cell.lineView.hidden = YES;
        }
    }else{
        cell.lineView.hidden = YES;
    }

    cell.dataArray = self.dataArray;
    
    WeakSelf;
    cell.JCTitleSelectBlock = ^{
        weakSelf.currentIndex = indexPath.row;
        [weakSelf.view endEditing:YES];
        weakSelf.isAdd = NO;
        [weakSelf showMatchSelView];
    };

    [cell.deleteBtn bk_whenTapped:^{
        
        
        weakSelf.currentIndex = indexPath.row;
        [weakSelf.dataArray removeObjectAtIndex:indexPath.row];
        if (weakSelf.dataArray.count==1) {
            JCPostPlanMathInfoModel *infoModel = weakSelf.dataArray.firstObject;
            [infoModel.btnArray removeAllObjects];
//            if (infoModel.btnArray.count==1) {
//                JCPostButton *btn = infoModel.btnArray.firstObject;
//                if ([btn.value intValue]<1.4) {
//                    [infoModel.btnArray removeObject:btn];
//                }
//            }
        }
        [weakSelf.tableView reloadData];
        [weakSelf configMatchCount];
        [weakSelf canPostEanble];
    }];
    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section==1) {
        if ([self.type integerValue]==1) {
            return AUTO(240);
        }
         return AUTO(170);
    }
//    JCPostPlanItemModel *model = self.itemArray[indexPath.row];
//    if (indexPath.row==2&&model.bztk_string.length==0&&model.is_bztk) {
//        return 0;
//
//    }

    return AUTO(44);
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section==1) {
        JCPostPlanSearchMatchHeadView *headView= [JCPostPlanSearchMatchHeadView new];
        WeakSelf;
        headView.JCContentBlock = ^(NSString * _Nonnull content) {
            weakSelf.matchSearchStr = content;
        };
        headView.contentTF.text = self.matchSearchStr;
        return headView;
    }
    UIView *headView = [UIView new];
    headView.backgroundColor = COLOR_F4F6F9;
    return headView;

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section==1) {
        return AUTO(50);
    }
    if (section==2) {
        return AUTO(10);
    }
    return 0.001f;
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section==1) {
        if ([self.type integerValue]==1) {
            if (self.dataArray.count>=3) {
                return 0.01;
            }
        }else{
            if (self.dataArray.count>=1) {
                return 0.01;
            }
        }
        return AUTO(60);
    }
    if (section==2) {
         return AUTO(1120);
    }
    
    return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (section==1) {
        if ([self.type integerValue]==1) {
            if (self.dataArray.count>=3) {
                return [UIView new];
            }
        }else{
            if (self.dataArray.count>=1) {
                return [UIView new];
            }
        }
        
        JCPostPlanAddFootView *footView = [JCPostPlanAddFootView new];
        WeakSelf;
        [footView.postBtn bk_whenTapped:^{
            if ([weakSelf.type integerValue]>1&&weakSelf.dataArray.count>0) {
                [JCWToastTool showHint:@"最多只能选择一场"];
                return;
            }
            if ([weakSelf.type integerValue]==1&&weakSelf.dataArray.count>2) {
                [JCWToastTool showHint:@"最多只能选择三场"];
                return;
            }
            weakSelf.isAdd = YES;
            if (weakSelf.matchArray>0) {
                if (weakSelf.matchSearchStr.length>0) {
                    NSMutableArray *array = [NSMutableArray array];
                    [weakSelf.matchArray enumerateObjectsUsingBlock:^(JCPostPlanMatchModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                        if ([obj.leagueName containsString:weakSelf.matchSearchStr]||[obj.homeName containsString:weakSelf.matchSearchStr]||[obj.awayName containsString:weakSelf.matchSearchStr]) {
                            [array addObject:obj];
                        }
                    }];
                    if (array.count ==0) {
                        [JCWToastTool showHint:@"当前筛选暂无比赛"];
                        return;
                    }
                    weakSelf.raceSelectView.dataArray = array;
                    [[UIApplication sharedApplication].keyWindow addSubview:weakSelf.raceSelectView];
                    [weakSelf.raceSelectView show];
                    if (array.count==0) {
                        [weakSelf.raceSelectView.tableView showNoDataClearViewWithTitle:@"暂无比赛数据"];
                    }else{
                        [weakSelf.raceSelectView.tableView hideNoData];
                    }


                }else{
                    weakSelf.raceSelectView.dataArray = weakSelf.matchArray;
                    [[UIApplication sharedApplication].keyWindow addSubview:weakSelf.raceSelectView];
                    [weakSelf.raceSelectView show];
                    if (weakSelf.matchArray.count==0) {
                        [weakSelf.raceSelectView.tableView showNoDataClearViewWithTitle:@"暂无比赛数据"];
                    }else{
                        [weakSelf.raceSelectView.tableView hideNoData];
                    }
                }
            }else{
                [weakSelf getMatchListWithShow:YES];
            }

        }];
        return footView;;
    }
    
    
    if (section==2) {
        self.addImgBtn = self.footView.addImgBtn;
        self.citationTV = self.footView.yinwenContentTV;
        self.contentTV = self.footView.zhengweContentTV;
//        self.titleTF = self.footView.titleTF;
        WeakSelf;
        self.footView.JCYinWenBlock = ^(NSString * _Nonnull str) {
            weakSelf.citation= str;
            [weakSelf canPostEanble];
            if (str.length==0) {
                weakSelf.citationTV.textColor = COLOR_333333;
            }
        };
        self.footView.JCZhengWenBlock = ^(NSString * _Nonnull str) {
            weakSelf.content= str;
            [weakSelf canPostEanble];
            if (str.length==0) {
                weakSelf.contentTV.textColor = COLOR_333333;
            }
            
        };
        self.footView.clearImg = self.selectedPhotos.count==0?YES:NO;
        self.footView.yinwenContentTV.text = self.citation;
        self.footView.zhengweContentTV.text = self.content;
        self.titleTV.text = self.titleInfo;
        if (self.sensitiveData) {
            [self dealWithSensitiveWord:self.sensitiveData];
        }


        
        return self.footView;
    }
    UIView *backView= [UIView new];
    return backView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.view endEditing:YES];
    JCPostPlanCommonCell *commonCell = (JCPostPlanCommonCell *)[tableView cellForRowAtIndexPath:indexPath];
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            if ([[JCWUserBall currentUser].fabu_type intValue]==2) {
                //只能发布免费方案
                [JCWToastTool showHint:@"当前用户权限只能发布免费方案~"];
                return;
            }
//            NSMutableArray *array = [n]
            NSArray *array = self.dcPriceInfoArray;
            if (self.dataArray.count>1) {
                array = self.scPriceInfoArray;
            }
            JCCommomSelectView *selectView = [[JCCommomSelectView alloc] initWithTitle:@"收费方式"];
            selectView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
            selectView.dataArray = array;
            WeakSelf;
            selectView.JCTitleBlock = ^(NSString * _Nonnull title, NSInteger index) {
                    JCPostPlanItemModel *priceModel = weakSelf.itemArray[0];
                    NSString *price = array[index];
                    priceModel.price = price;
                    //单场大于等于38有不中退款
                     //二串一大于等于48有不中退款
 
                [weakSelf configMatchCount];
    //                [self.tableView beginUpdates];
                    [weakSelf.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
    //                [self.tableView endUpdates];
            };
            [[UIApplication sharedApplication].keyWindow addSubview:selectView];
            [selectView show];

        }
        
        if (indexPath.row==1&&self.itemArray.count==3) {
            JCCommomSelectView *selectView = [[JCCommomSelectView alloc] initWithTitle:@"是否推送"];
            selectView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
            selectView.dataArray = @[@"是",@"否"];
            WeakSelf;
            selectView.JCTitleBlock = ^(NSString * _Nonnull title, NSInteger index) {
                    JCPostPlanItemModel *model = weakSelf.itemArray[indexPath.row];
                if (model.is_push) {
                    if (index==1) {
                            model.push = NO;
                            model.time = @"否";
                        }else{
                            model.push = YES;
                            [weakSelf showdDataPickView];
                        }
                    }

                [weakSelf.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationAutomatic];
            };
            [[UIApplication sharedApplication].keyWindow addSubview:selectView];
            [selectView show];


        }
        if (indexPath.row==2) {
            BOOL value = [self configRefundStatusWithCell:commonCell];
            if (!value) {
                if (self.dcRefundModel&&self.scRefundModel) {
                    [JCWToastTool showHint:[NSString stringWithFormat:@"单关小于%@，串关小于%@，不可选择不中返还",self.dcRefundModel.total,self.scRefundModel.total]];
                }
                
                return;
            }
        }

    }
}


#pragma mark 网络请求

//发布方案价格列表
- (void)getPriceList {
    JCUserService_New *service = [JCUserService_New service];
    [service getPostPlanPriceWithSuccess:^(id  _Nullable object) {
        if ([JCWJsonTool isSuccessResponse:object]) {
            self.dcPriceArray = [JCWJsonTool arrayWithJson:object[@"data"][@"dc"] class:[JCPostPriceModel class]];
            self.scPriceArray = [JCWJsonTool arrayWithJson:object[@"data"][@"sc"] class:[JCPostPriceModel class]];
            NSMutableArray *dcInfoArray = [NSMutableArray array];
            [self.dcPriceArray enumerateObjectsUsingBlock:^(JCPostPriceModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [dcInfoArray addObject:obj.total];
                if (!self.dcRefundModel&&[obj.refund integerValue]==1) {
                    self.dcRefundModel = obj;
                }
            }];
            self.dcPriceInfoArray = [NSArray arrayWithArray:dcInfoArray];
            NSMutableArray *scInfoArray = [NSMutableArray array];
            [self.scPriceArray enumerateObjectsUsingBlock:^(JCPostPriceModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [scInfoArray addObject:obj.total];
                if (!self.scRefundModel&&[obj.refund integerValue]==1) {
                    self.scRefundModel = obj;
                }
                
            }];
            self.scPriceInfoArray = [NSArray arrayWithArray:scInfoArray];
            
        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        
    }];

}

//获取联赛列表
- (void)getMatchListWithShow:(BOOL)show {
    WeakSelf;
    [self.view showLoading];
    JCUserService_New *service = [JCUserService_New service];
    [service getPostPlan_MatchListWithType:self.type page:1 Success:^(id  _Nullable object) {
        [self.view endLoading];
       if ([JCWJsonTool isSuccessResponse:object]) {
           weakSelf.matchArray = [JCWJsonTool arrayWithJson:object[@"data"][@"match"] class:[JCPostPlanMatchModel class]];
           weakSelf.raceSelectView.dataArray = weakSelf.matchArray;
           
           if (show) {
               [[UIApplication sharedApplication].keyWindow addSubview:weakSelf.raceSelectView];
               [weakSelf.raceSelectView show];
           }
           
           [self canPostEanble];
       }else{
           [JCWToastTool showHint:object[@"msg"]];
       }

    } failure:^(NSError * _Nonnull error) {
        [self.view endLoading];
    }];
}

//根据联赛match_num获取比赛详情
- (void)getMatchDetailWithMatch_num:(NSString *)match_num {
//    WeakSelf;
    [self.view showLoading];
    JCUserService_New *service = [JCUserService_New service];
    [service getPostPlan_MatchDetailWithMatch_id:match_num type:self.type Success:^(id  _Nullable object) {
        [self.view endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            JCPostPlanMathInfoModel *infoModel =  (JCPostPlanMathInfoModel *)[JCWJsonTool entityWithJson:object[@"data"][@"match"] class:[JCPostPlanMathInfoModel class]];
            if ([self.type integerValue]==1) {
                JCPostPlanMathInfoSPFModel *odds_spf_model = (JCPostPlanMathInfoSPFModel *)[JCWJsonTool entityWithJson:object[@"data"][@"odds_spf"] class:[JCPostPlanMathInfoSPFModel class]];
                JCPostPlanMathInfoSPFModel *odds_rq_model = (JCPostPlanMathInfoSPFModel *)[JCWJsonTool entityWithJson:object[@"data"][@"odds_rq"] class:[JCPostPlanMathInfoSPFModel class]];
                infoModel.odds_spf_model = odds_spf_model;
                infoModel.odds_rq_model = odds_rq_model;
                
            }else{
                NSString *win = object[@"data"][@"win"];
                NSString *draw = object[@"data"][@"draw"];
                NSString *lost = object[@"data"][@"lost"];
                if ([self.type integerValue]==2) {
                    JCPostPlanMathInfoSPFModel *odds_yp_model = [JCPostPlanMathInfoSPFModel new];
                    odds_yp_model.win = [NSString stringWithFormat:@"%@",win];
                    odds_yp_model.draw = [NSString stringWithFormat:@"%@",draw];
                    odds_yp_model.lost = [NSString stringWithFormat:@"%@",lost];
                    infoModel.odds_yp_model = odds_yp_model;
                }
                if ([self.type integerValue]==3) {
                    JCPostPlanMathInfoSPFModel *odds_dxq_model = [JCPostPlanMathInfoSPFModel new];
                    odds_dxq_model.win = [NSString stringWithFormat:@"%@",win];
                    odds_dxq_model.draw = [NSString stringWithFormat:@"%@",draw];
                    odds_dxq_model.lost = [NSString stringWithFormat:@"%@",lost];
                    infoModel.odds_dxq_model = odds_dxq_model;
                }
                

                
            }
            if (self.isAdd) {
                [self.dataArray addObject:infoModel];
            }else{
                [self.dataArray replaceObjectAtIndex:self.currentIndex withObject:infoModel];
            }
//            [self.tableView reloadData];
            if (self.dataArray.count==2) {
                JCPostPlanItemModel *itemModel = self.itemArray[0];
//                nslog
                if (itemModel.is_sf) {
                    if ([[JCWUserBall currentUser].fabu_type intValue]==1) {
                        if (![itemModel.price isEqualToString:@"免费"]) {
                            NSArray *array = [itemModel.price componentsSeparatedByString:@"元"];
                            if (array.count>1) {
                                NSString *price = array[0];
                                NSInteger prize = [price integerValue];
                                
                                if (self.scPriceArray.count>1) {
    //                                itemModel.price = self.scPriceInfoArray[1];
                                    JCPostPriceModel *smallModel = self.scPriceArray.firstObject;
                                    if ([smallModel.sf intValue]==0) {
                                        JCPostPriceModel *priceModel = self.scPriceArray[1];
                                        if (prize*100<[priceModel.sf integerValue]) {
                                            itemModel.price = priceModel.total;
                                        }
                                        
                                        
                                    }else{
                                        if (prize*100<[smallModel.sf integerValue]) {
                                            itemModel.price = smallModel.total;
                                        }
                                        
                                    }
                                }
                            }else{
                                itemModel.price= @"免费";
                            }

                        }else{
                            itemModel.price= @"免费";
                        }
                        
                        
                    }
                    if ([[JCWUserBall currentUser].fabu_type intValue]==2) {
                        itemModel.price= @"免费";
                    }
                    
                }
            }
            [self.tableView reloadData];
            [self canPostEanble];
            [self configMatchCount];
            self.titleTV.text = self.titleInfo;
            self.citationTV.text = self.citation;
            self.contentTV.text = self.content;

        }
        
    } failure:^(NSError * _Nonnull error) {
        [self.view endLoading];
    }];
    
}


- (void)getMyPostPlanDetail{
  
    if (self.postID.length==0) {
        return;
    }
//    WeakSelf;
    JCUserService_New *service = [JCUserService_New service];
    [service getMyPostMatchDetailWithTuiJianID:self.postID success:^(id  _Nullable object) {
        {
            if ([JCWJsonTool isSuccessResponse:object]) {
                JCMyPostCheckTuiJianModel *matchModel = (JCMyPostCheckTuiJianModel *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCMyPostCheckTuiJianModel class]];
                self.type = matchModel.classfly;
                self.selectedPhotos = [JCWJsonTool arrayWithJson:object[@"data"][@"img_info"] class:[JCPostImageModel class]];
                self.titleInfo = matchModel.title;
                self.titleTV.text = self.titleInfo;
                self.citation = matchModel.citation;
                self.citationTV.text = self.citation;
                self.content = matchModel.content;
                self.contentTV.text = self.content;
                self.headView.numLab.text =  [NSString stringWithFormat:@"%ld/40",self.titleTV.text.length];
                self.footView.yinwenCountLab.text = [NSString stringWithFormat:@"%ld/300",self.citationTV.text.length];
                self.footView.zhengweCountLab.text = [NSString stringWithFormat:@"%ld/1000",self.contentTV.text.length];
                
                NSArray *array = [NSArray arrayWithArray:matchModel.zucai_tuijian_match];
                [array enumerateObjectsUsingBlock:^(JCPostPlanMathInfoModel *model, NSUInteger idx, BOOL * _Nonnull stop) {
                    model.home_team_name = model.home_team_name;
                    model.away_team_name = model.away_team_name;
                    model.competition_name = model.competition_name;
                    model.match_long_time = [NSDate timeStringWithIntervalWithFormat:@"yyyy-MM-dd HH:mm" time:[model.get_match_time doubleValue]];

                    model.issue_num = model.round_num;
                    if ([self.type integerValue]==1) {
                        if (model.odds_spf.length>0||model.odds_rq.length>0) {
                            
                            //非让球
                            JCPostPlanMathInfoSPFModel *odds_spf_model = [JCPostPlanMathInfoSPFModel new];
                            odds_spf_model.rq = @"0";
                            NSArray *odds_spf_array = [model.odds_spf componentsSeparatedByString:@","];
                            for (int i=0; i<odds_spf_array.count; i++) {
                                NSString *value = odds_spf_array[i];
                                if (i==0) {
                                    odds_spf_model.win = value;
                                }
                                if (i==1) {
                                    odds_spf_model.draw = value;
                                }
                                if (i==2) {
                                    odds_spf_model.lost = value;
                                }
                            }
                            if (model.odds_spf.length>0) {
                                model.odds_spf_model = odds_spf_model;
                            }
                            
                            
                            //让球
                            JCPostPlanMathInfoSPFModel *odds_rq_model = [JCPostPlanMathInfoSPFModel new];
        
                            NSArray *odds_rq_array = [model.odds_rq componentsSeparatedByString:@","];
                            for (int i=0; i<odds_rq_array.count; i++) {
                                NSString *value = odds_rq_array[i];
                                if (i==0) {
                                    odds_rq_model.rq = value;
                                }
                                if (i==1) {
                                    odds_rq_model.win = value;
                                }
                                if (i==2) {
                                    odds_rq_model.draw = value;
                                }
                                if (i==3) {
                                    odds_rq_model.lost = value;
                                }
                            }
                            if (model.odds_rq.length>0) {
                                model.odds_rq_model = odds_rq_model;
                            }
                            
                        }
                        
                    }else if([self.type integerValue]==2){
                        JCPostPlanMathInfoSPFModel *odds_yp_model = [JCPostPlanMathInfoSPFModel new];
                        NSArray *odds_yp_array = [model.odds_yp componentsSeparatedByString:@","];
                        for (int i=0; i<odds_yp_array.count; i++) {
                            NSString *value = odds_yp_array[i];
                            if (i==0) {
                                odds_yp_model.draw = value;
                            }
                            if (i==1) {
                                odds_yp_model.win = value;
                            }
                            if (i==2) {
                                odds_yp_model.lost = value;
                            }
                        }
                        model.odds_yp_model = odds_yp_model;
                        
                    }else {
                        JCPostPlanMathInfoSPFModel *odds_dxq_model = [JCPostPlanMathInfoSPFModel new];
                        NSArray *odds_dxq_array = [model.odds_dxq componentsSeparatedByString:@","];
                        for (int i=0; i<odds_dxq_array.count; i++) {
                            NSString *value = odds_dxq_array[i];
                            if (i==0) {
                                odds_dxq_model.draw = value;
                            }
                            if (i==1) {
                                odds_dxq_model.win = value;
                            }
                            if (i==2) {
                                odds_dxq_model.lost = value;
                            }
                        }
                        model.odds_dxq_model = odds_dxq_model;
                        
                    }
                    if ([self.type integerValue]==1) {
                        NSMutableArray *array = [NSMutableArray array];
                        NSArray *spfArray = [model.spf componentsSeparatedByString:@","];
                        for (NSString *value in spfArray) {
                            JCPostButton *postBtn = [JCPostButton new];

                            postBtn.spf = value;
                            [array addObject:postBtn];
                        }
                        model.btnArray = array;

                    }else{

                        JCPostButton *postBtn = [JCPostButton new];
                        postBtn.spf = model.spf;
                        model.selectBtn = postBtn;
                    }


                }];

                self.dataArray = [NSMutableArray arrayWithArray:array];
                
                NSString *sf = [NSString stringWithFormat:@"%ld",matchModel.sf/100];
                NSString *is_push = matchModel.is_push;
                NSString *push_time = matchModel.push_time;
                NSString *refund = matchModel.refund;//不中退款
                NSString *hb = matchModel.hb;//红包抵扣
                for (int i=0; i<self.itemArray.count; i++) {
                    JCPostPlanItemModel *itemModel = self.itemArray[i];
                    if (itemModel.is_sf) {
                        itemModel.price= [NSString stringWithFormat:@"%@元",sf];
                        if (matchModel.sf==0) {
                            itemModel.price = @"免费";
                        }
       
                    }
                    
                    
                    if (itemModel.is_push) {
                        if ([is_push integerValue]==1&&[push_time integerValue]>0) {
                            itemModel.is_push = YES;
                            itemModel.push = YES;
                            itemModel.time = [NSDate wholeTimeStringWithInterval:[push_time longLongValue]];
                        }
                    }
                    
                    if (itemModel.is_bztk) {
                        itemModel.bztk_string = @"不中返还";
                        if ([refund integerValue]==1) {
                            
                            itemModel.bztk = YES;
                        }else{
                            itemModel.bztk = NO;
                        }
                    }
                    if (itemModel.is_hongbao) {
                        if ([hb integerValue]==1) {
                            
                            itemModel.hongbao = YES;
                        }else{
                            itemModel.hongbao = NO;
                        }
                    }

                        
                    }
                
                [self.tableView reloadData];
               [self canPostEanble];
               self.footView.selectedPhotos = [NSMutableArray arrayWithArray:self.selectedPhotos];
               [self.footView refresgImageData];

                
            }else {
                [JCWToastTool showHint:object[@"msg"]];
            }
            
            }
    } failure:^(NSError * _Nonnull error) {
        
    }];


}



- (void)submitBtnClick {
    [self.view endEditing:YES];
    
    JCWUserBall *user =  [JCWUserBall currentUser];
    if ([user.fabu_count integerValue]==0&&self.postID.length==0) {
         JCBaseTitleAlertView *alertView = [JCBaseTitleAlertView new];
        [alertView alertTitle:@"" TitleColor:COLOR_333333 Mesasge:@"非常抱歉,您今日发布方案已达上限!\n请明天再来" MessageColor:COLOR_333333 ComfirmTitle:@"确认" ComfirmColor:JCBaseColor confirmHandler:^{
            [alertView removeFromSuperview];
        }];
        alertView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        [[UIApplication sharedApplication].keyWindow addSubview:alertView];
        return;
    }
    
    
    
    
    if (self.titleTV.text.length==0) {
         [JCWToastTool showHint:@"请输入标题"];
           return;
    }
    if (self.dataArray.count==0) {
         [JCWToastTool showHint:@"请选择比赛"];
           return;
    }
    NSString *content = [self.contentTV.text stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (content.length<300) {
         [JCWToastTool showHint:@"您输入的文章纯文本内容不足300字,请重新输入"];
           return;
    }

//    if (self.contentTV.text.length<300) {
//         [JCWToastTool showHint:@"您输入的文章内容不足300字,请重新输入"];
//           return;
//    }
    
    
    for (JCPostPlanMathInfoModel *mathModel in self.dataArray) {
        if ([self.type integerValue]==1) {
            if (mathModel.btnArray.count==0) {
                [JCWToastTool showHint:@"请选择赔率"];
                return;
            }
        }else{
            if (mathModel.selectBtn.spf.length==0) {
                [JCWToastTool showHint:@"请选择赔率"];
                return;
            }
        }
    }



    //本地校验是否符合发帖规则
    BOOL result = [self configPostRule];
    if (result) {
       [self observeSensitiveWord];
    }

}
//检测敏感词
- (void)observeSensitiveWord {

    if (self.contentTV.text.length==0) {
         [JCWToastTool showHint:@"请输入内容"];
           return;
    }
    [self.view showLoading];
      JCUserService_New * service = [JCUserService_New service];
    [service getPlanSensitiveWordWithTitle:NonNil(self.titleInfo) Citation:NonNil(self.citation) Content:[NSString stringWithFormat:@"%@",NonNil(self.content)] success:^(id  _Nullable object) {
        [self endRefresh];
        NSString *code = object[@"code"];
        if ([JCWJsonTool isSuccessResponse:object]) {
             NSMutableAttributedString *titleAttr = [[NSMutableAttributedString alloc] initWithString:NonNil(self.titleInfo) attributes:@{NSForegroundColorAttributeName:COLOR_333333,NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(14)]}];
            NSMutableAttributedString *ciAttr = [[NSMutableAttributedString alloc] initWithString:NonNil(self.citation) attributes:@{NSForegroundColorAttributeName:COLOR_333333,NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(14)]}];
            NSMutableAttributedString *contentAttr = [[NSMutableAttributedString alloc] initWithString:NonNil(self.content) attributes:@{NSForegroundColorAttributeName:COLOR_333333,NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(14)]}];
            self.titleTV.attributedText = titleAttr;
            self.citationTV.attributedText = ciAttr;
            self.contentTV.attributedText = contentAttr;
            
            
            [self uploadImgToService];

            
        }else if ([code integerValue]==10003){

                JCBaseTitleAlertView *alertView = [JCBaseTitleAlertView new];
                [alertView alertTitle:@"敏感词警告" TitleColor:COLOR_333333 Mesasge:@"您编辑的达人方案内容中含有敏感词不适宜发布，请修改后再次发布" MessageColor:COLOR_666666 ComfirmTitle:@"确定" ComfirmColor:JCBaseColor confirmHandler:^{
                    [alertView removeFromSuperview];
                }];
                alertView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
                [[UIApplication sharedApplication].keyWindow addSubview:alertView];
                if (object[@"data"]) {
                    self.sensitiveData = object[@"data"];
                  [self dealWithSensitiveWord:object[@"data"]];
                }

            

        }else {
            [JCWToastTool showHint:object[@"msg"]];
        }
    } failure:^(NSError * _Nonnull error) {
        [self endRefresh];
    }];

}

- (void)dealWithSensitiveWord:(NSDictionary *)data {
        if (data) {//JCWSensitiveWordsModel
             NSArray *titleArray = [JCWJsonTool arrayWithJson:data[@"title"] class:[JCWSensitiveWordsModel class]];
            NSArray *citationArray = [JCWJsonTool arrayWithJson:data[@"citation"] class:[JCWSensitiveWordsModel class]];//citation
            NSArray *contentArray = [JCWJsonTool arrayWithJson:data[@"content"] class:[JCWSensitiveWordsModel class]];//content
            
            if (titleArray.count>0) {
              NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:self.titleInfo attributes:@{NSForegroundColorAttributeName:COLOR_333333,NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(14)]}];
                for (JCWSensitiveWordsModel *model in titleArray) {
                    NSString *word = model.word;
                    NSArray *rangeArray = [self getSensitiveWordRangeWithContent:self.titleInfo word:word];

                    for (int i=0; i<rangeArray.count; i++) {

                        NSNumber *location = rangeArray[i];
                        NSInteger locValue = [location integerValue];
//                                locValue = locValue;
                        NSRange range = NSMakeRange(locValue, word.length);

                        if (range.location!=NSNotFound) {
                            [attr addAttributes:@{NSForegroundColorAttributeName:JCBaseColor,NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(14)]} range:range];
                           
                        }else {
                            [attr addAttributes:@{NSForegroundColorAttributeName:COLOR_333333,NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(14)]} range:range];
                        }
                    }
                     
                    NSLog(@"%@",rangeArray);
                }
                self.titleTV.attributedText = attr;


            }
            
            if (citationArray.count>0) {
              NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:self.citation attributes:@{NSForegroundColorAttributeName:COLOR_333333,NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(14)]}];
                for (JCWSensitiveWordsModel *model in citationArray) {
                    NSString *word = model.word;
                    NSArray *rangeArray = [self getSensitiveWordRangeWithContent:self.citation word:word];

                    for (int i=0; i<rangeArray.count; i++) {

                        NSNumber *location = rangeArray[i];
                        NSInteger locValue = [location integerValue];
//                                locValue = locValue;
                        NSRange range = NSMakeRange(locValue, word.length);

                        if (range.location!=NSNotFound) {
                            [attr addAttributes:@{NSForegroundColorAttributeName:JCBaseColor,NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(14)]} range:range];
                           
                        }else{
                           [attr addAttributes:@{NSForegroundColorAttributeName:COLOR_333333,NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(14)]} range:range];
                        }
                    }
                     
                    NSLog(@"%@",rangeArray);
                }
                self.citationTV.attributedText = attr;


            }
            
            
            if (contentArray.count>0) {
              NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:self.content attributes:@{NSForegroundColorAttributeName:COLOR_333333,NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(14)]}];
                for (JCWSensitiveWordsModel *model in contentArray) {
                    NSString *word = model.word;
                    NSArray *rangeArray = [self getSensitiveWordRangeWithContent:self.content word:word];

                    for (int i=0; i<rangeArray.count; i++) {

                        NSNumber *location = rangeArray[i];
                        NSInteger locValue = [location integerValue];
//                                locValue = locValue;
                        NSRange range = NSMakeRange(locValue, word.length);

                        if (range.location!=NSNotFound) {
                            [attr addAttributes:@{NSForegroundColorAttributeName:JCBaseColor,NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(14)]} range:range];
                           
                        }else {
                            [attr addAttributes:@{NSForegroundColorAttributeName:COLOR_333333,NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(14)]} range:range];

                        }
                    }
                     
                    NSLog(@"%@",rangeArray);
                }
                self.contentTV.attributedText = attr;


            }

        }
}

- (void)uploadImgToService {
    if (self.selectedPhotos.count>0) {
        //图片上传
        NSMutableArray *imageArray = [NSMutableArray array];
        [self.selectedPhotos enumerateObjectsUsingBlock:^(JCPostImageModel * _Nonnull data, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([data.url isKindOfClass:[UIImage class]]) {
                 [self.view showLoading];
                
        JCUserService_New * service = [JCUserService_New service];
        [service uploadAvatarWithImage:data.url type:@"1" width:[NSString stringWithFormat:@"%ld",data.width] height:[NSString stringWithFormat:@"%ld",data.height] success:^(id  _Nullable object) {
            
            if ([JCWJsonTool isSuccessResponse:object]) {
                if (object[@"data"][@"image_id"]) {
                    JCImageModel *imaeModel = [JCImageModel new];
                    imaeModel.id = [NSString stringWithFormat:@"%@",object[@"data"][@"image_id"]];
                    imaeModel.index = idx;
                    [imageArray addObject:imaeModel];
                }
                if (imageArray.count==self.selectedPhotos.count) {
                    [self endRefresh];
                    NSMutableArray *imageObject_Array = [NSMutableArray array];
                    NSMutableArray *imageID_Array = [NSMutableArray array];
                    for (id image_object in imageArray) {
                        if ([image_object isKindOfClass:[JCImageModel class]]) {
                            [imageObject_Array addObject:image_object];
                        }else {
                            [imageID_Array addObject:image_object];
                        }
                    }
                    
                    //对图片进行排序
                    NSArray *result = [imageObject_Array sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
                        JCImageModel *objModel1 = (JCImageModel *)obj1;
                        JCImageModel *objModel2 = (JCImageModel *)obj2;
                          if (objModel1.index>objModel2.index) {
                              return NSOrderedDescending;
                          }else if(objModel1.index<objModel2.index){
                              return NSOrderedAscending;
                          }else{
                              return NSOrderedSame;
                          }
                      }];
                    NSMutableArray *array = [NSMutableArray array];
                    if (imageID_Array.count>0) {
                        [array addObjectsFromArray:imageID_Array];
                    }
                    
                    for (JCImageModel *model in result) {
                        if (model.id) {
                            [array addObject:model.id];
                        }
                        
                    }



                    [self submitSuggestionUploadWithImages:array];
                }
            }else{

                 [JCWToastTool showHint:@"图片上传失败"];
            }

        } failure:^(NSError * _Nonnull error) {
            [self endRefresh];
            [JCWToastTool showHint:@"图片上传失败"];
        }];

            }else{
                if (data.id.length>0) {
                    [imageArray addObject:data.id];
                }
                if (imageArray.count==self.selectedPhotos.count) {

                    [self submitSuggestionUploadWithImages:imageArray];
                }
            }
            
            
        }];
    }else{
        [self submitSuggestionUploadWithImages:nil];
    }

}

- (void)submitSuggestionUploadWithImages:(NSArray *)imageArray {
    NSMutableArray *matchArray = [NSMutableArray array];
    if ([self.type integerValue]==1) {
        //欧指
        for (JCPostPlanMathInfoModel *mathModel in self.dataArray) {
            if (mathModel.btnArray.count>0) {
                NSString *value = @"";
                for (int i=0; i<mathModel.btnArray.count; i++) {
                    JCPostButton *btn = mathModel.btnArray[i];
                    
                    if (i==0) {
                        value = btn.spf;
                    }else{
                        value = [NSString stringWithFormat:@"%@,%@",value,btn.spf];
                    }
                }
                
                JCPostPlanRequest_integerModel *model = [JCPostPlanRequest_integerModel new];
                model.spf = value;
                model.match_num = [mathModel.match_id intValue];
                model.match_id = [mathModel.match_id intValue];
                [matchArray addObject:model];
                
//                JCPostPlanRequestModel *model = [JCPostPlanRequestModel new];
//
//                model.spf = value;
//                model.match_num = mathModel.match_num;
//                model.rq = @"";
//                model.is_rq = @"";
               
            }else{
                //
                [JCWToastTool showHint:@"请选择赔率"];
                return;
            }
        }
    }else {
        //让球和进球数
        for (JCPostPlanMathInfoModel *mathModel in self.dataArray) {
            if (mathModel.selectBtn.spf.length>0) {
                JCPostPlanRequest_integerModel *model = [JCPostPlanRequest_integerModel new];
                model.spf = mathModel.selectBtn.spf;
                model.match_num = [mathModel.match_id intValue];
                model.match_id = [mathModel.match_id intValue];
//                JCPostPlanRequestModel *model = [JCPostPlanRequestModel new];
//                model.spf = mathModel.selectBtn.spf;
//                model.match_num = mathModel.match_num;
//                model.rq = @"";
//                model.is_rq = @"";
                [matchArray addObject:model];
            }else{
                //
                [JCWToastTool showHint:@"请选择赔率"];
                return;
            }
        }
        
    }


     if (matchArray.count==0) {
         [JCWToastTool showHint:@"请选择赔率"];
         return;
     }
     if (self.titleTV.text.length==0) {
          [JCWToastTool showHint:@"请输入标题"];
            return;
     }

     if (self.contentTV.text.length==0) {
          [JCWToastTool showHint:@"请输入内容"];
            return;
     }
     
      //判断内容纯空格
      NSString *titleStr = self.titleTV.text;
     titleStr = [titleStr stringByReplacingOccurrencesOfString:@" " withString:@""];
      if (titleStr.length==0) {
           [JCWToastTool showHint:@"请输入标题"];
             return;
      }

     //判断内容纯空格
     NSString *contentStr = self.contentTV.text;
    contentStr = [contentStr stringByReplacingOccurrencesOfString:@" " withString:@""];
     if (contentStr.length==0) {
          [JCWToastTool showHint:@"请输入内容"];
            return;
     }
    NSString *imgStr = @"";
    if (imageArray.count>0) {
        for (int i=0; i<imageArray.count; i++) {
            if (i==0) {
                imgStr = imageArray.firstObject;
            }else{
                imgStr = [NSString stringWithFormat:@"%@,%@",imgStr,imageArray[i]];
            }
        }
    }


     NSString *sf = @"";//收费金额
     NSString *hb = @"1";//默认红包抵扣
     NSString *refund = @"0";//是否不中退款
     for (int i=0; i<self.itemArray.count; i++) {
         JCPostPlanItemModel *itemModel = self.itemArray[i];
         if (itemModel.is_sf) {
             NSArray *priceArray = [itemModel.price componentsSeparatedByString:@"元"];
             if (priceArray.count==2) {
                 NSString *price = priceArray.firstObject;
                 NSInteger price_inter = [price integerValue]*100;
                 sf = [NSString stringWithFormat:@"%ld",price_inter];
             }

         }
         if (itemModel.hongbao&&itemModel.is_hongbao) {
             hb = @"1";
         }
         if (itemModel.bztk&&itemModel.is_bztk) {
             refund = @"1";
         }
     }
    //需要删除的旧图片
    NSString *old_image = @"";
    for (int i=0; i<self.deletedPhotos.count; i++) {
        JCPostImageModel *model = self.deletedPhotos[i];
        if (i==0) {
            old_image = model.id;
        }else{
            old_image = [NSString stringWithFormat:@"%@,%@",old_image,model.id];
        }
    }

     NSLog(@"%@",sf);
//     //type 1是单场 2是二串一 单场还是二串一
//     NSString *type = @"1";
//     if (matchArray.count>1) {
//         type = @"2";
//     }
     //是否推送 is_push 1是 0否 push_time 推送时间
     JCPostPlanItemModel *pushModel = self.itemArray[1];
     NSString *is_push  = pushModel.push?@"1":@"0";
     NSString *push_time = pushModel.push?pushModel.time:@"";
    NSMutableArray *matchJsonArray = [matchArray yy_modelToJSONObject];
    NSDictionary *dic = @{@"match_data":matchJsonArray,@"title":self.titleTV.text,@"content":self.content,@"citation":NonNil(self.citationTV.text),@"image":imgStr,@"sf":sf,@"hb":hb,@"refund":refund,@"classfly":self.type,@"id":NonNil(self.postID),@"is_push":is_push,@"push_time":push_time};
     [self.view showLoading];
     JCUserService_New *service = [JCUserService_New service];
    [service getPostMatchInfoWithPostID:self.postID Param:dic success:^(id  _Nullable object) {
        [self.view endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            JCWUserBall *user = [JCWUserBall currentUser];
            [self getUserInfo];
            [JCWToastTool showHint:@"发布成功"];
            [self resetData];
//             if (self.JCRefreshBlock) {
//                 self.JCRefreshBlock();
//             }
            if (self.postID.length>0) {
                if (self.JCRefreshBlock) {
                    self.JCRefreshBlock();
                }
                [self.navigationController popViewControllerAnimated:YES];//修改成功,退回列表
                
            }
        }else{
//             [self clearData];
            [JCWToastTool showHint:object[@"msg"]];

     
            if (self.JCRefreshBlock) {
                self.JCRefreshBlock();
            }
        }

    } failure:^(NSError * _Nonnull error) {
        if (self.JCRefreshBlock) {
            self.JCRefreshBlock();
        }
        [self.view endLoading];
        [JCWToastTool showHint:@"发布失败"];
    }];
}
- (void)getUserInfo {

    JCUserService_New *service = [JCUserService_New service];
    [service getMyUserInfoWithSuccess:^(id  _Nullable object) {

        [self.jcWindow endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            NSString *token = [JCWUserBall currentUser].token;
            NSLog(@"token=%@",token);
            //缓存userBall对象
            JCWUserBall *userBall = (JCWUserBall *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCWUserBall class]];
//            userBall.fabu = @"1";
            userBall.token = token;
            [JCWUserBall save:userBall];
   
        }

    } failure:^(NSError * _Nonnull error) {
        [self.jcWindow endLoading];
        [JCWToastTool showHint:@"获取用户信息失败"];
    }];

}
//符合条件,发布按钮才能高亮点击
- (void)canPostEanble {
    //文本限制字数,多串只要100字即可
//    NSInteger number = 300;

    
    if (self.titleTV.text.length>0&&self.content.length>=300&&self.dataArray.count>0) {
        self.submitBtn.userInteractionEnabled = YES;
//        [self.submitBtn setTitleColor:JCWhiteColor forState:0];
    }else{
        self.submitBtn.userInteractionEnabled = NO;
//        [self.submitBtn setTitleColor:[JCWhiteColor colorWithAlphaComponent:0.7] forState:0];
    }
}
/*
 发布规则
 单场单选赔率在1.40-1.49之间,只能发布免费方案
 单场双选  双选的两个赔率如果小于2,只能发布免费方案
 2串1的回报率小于1,只能发布免费方案
 3串1的回报率小于3,只能发布免费方案
 */
- (BOOL)configPostRule {
//    if ([self.type intValue]>1) {
//        return YES;
//    }
//    JCPostPlanItemModel *model = self.itemArray.firstObject;
//    if (model.is_sf&&[model.price isEqualToString:@"免费"]) {
//        return YES;
//    }
    //单场
    if (self.dataArray.count==1) {
        JCPostPlanMathInfoModel *mathModel = self.dataArray.firstObject;
        //单场单选
        if (mathModel.btnArray.count==1) {
            //
            JCPostButton *btn = mathModel.btnArray.firstObject;
            if ([btn.value floatValue]>=1.5) {
                return YES;
            }else{
                JCBaseTitleAlertView *alertView = [JCBaseTitleAlertView new];
                [alertView alertTitle:@"" TitleColor:COLOR_666666 Mesasge:@"您选择赔率值在1.40~1.49之间，不允许选择付费阅读，将自动改为免费达人方案是否同意继续发布？" MessageColor:COLOR_2F2F2F SureTitle:@"继续发布" SureColor:JCWhiteColor SureHandler:^{
                    JCPostPlanItemModel *model = self.itemArray.firstObject;
                    JCPostPlanItemModel *bztkModel = self.itemArray[2];
                    if (model.is_sf) {
                        model.price = @"免费";
                        bztkModel.bztk = NO;
                        [alertView removeFromSuperview];
                        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
                        [self observeSensitiveWord];
                        
                    }
//
                    
                } CancleTitle:@"我要修改" CancleColor:JCBaseColor CancelHandler:^{
                   [alertView removeFromSuperview];
                }];

                alertView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
                [[UIApplication sharedApplication].keyWindow addSubview:alertView];
                return NO;
            }
            
        }
        //单场双选
        if (mathModel.btnArray.count==2) {
            JCPostButton *btn = mathModel.btnArray.firstObject;
            JCPostButton *btn1 = mathModel.btnArray.lastObject;
            if ([btn.value floatValue]<=2||[btn1.value floatValue]<=2) {
                JCBaseTitleAlertView *alertView = [JCBaseTitleAlertView new];
                [alertView alertTitle:@"" TitleColor:COLOR_666666 Mesasge:@"单场双选的赔率，两个选项赔率值必须均超过2.00以上" MessageColor:COLOR_666666 ComfirmTitle:@"确定" ComfirmColor:COLOR_5194E3 confirmHandler:^{
                    [alertView removeFromSuperview];
                }];

                alertView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
                [[UIApplication sharedApplication].keyWindow addSubview:alertView];
                return NO;
            }
            
            //self.postID.length==0 表示新发布的才限制,编辑的不限制
            JCWUserBall *user = [JCWUserBall currentUser];
            JCPostPlanItemModel *itemModel = self.itemArray[0];
            BOOL isfree = [itemModel.price isEqualToString:@"免费"];
            
        
            if (!isfree&&[[JCWUserBall currentUser].remaining_double integerValue]<=0&&self.postID.length==0) {
                JCBaseTitleAlertView *alertView = [JCBaseTitleAlertView new];
                [alertView alertTitle:@"" TitleColor:COLOR_666666 Mesasge:@"您的单场双选付费达人方案发布已达本月上限请下个月再来吧！" MessageColor:COLOR_666666 SureTitle:@"放弃发布" SureColor:JCWhiteColor SureHandler:^{
                    [alertView removeFromSuperview];
                    [self.navigationController popToRootViewControllerAnimated:YES];
//                    JCPostPlanItemModel *model = self.itemArray.firstObject;
//                    JCPostPlanItemModel *bztkModel = self.itemArray[2];
//                    bztkModel.bztk = NO;
//                    if (model.is_sf) {
//                        model.price = @"免费";
//                        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
//                        [alertView removeFromSuperview];
//                        [self observeSensitiveWord];
//                    }
                    
                } CancleTitle:@"我要修改" CancleColor:JCBaseColor CancelHandler:^{
                   [alertView removeFromSuperview];
                }];

                alertView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
                [[UIApplication sharedApplication].keyWindow addSubview:alertView];
                return NO;
            }
            

            if ([btn.value floatValue]>2&&[btn1.value floatValue]>2&&([btn.value floatValue] + [btn1.value floatValue])>6) {
                return YES;
            }else {
                JCBaseTitleAlertView *alertView = [JCBaseTitleAlertView new];
                [alertView alertTitle:@"" TitleColor:COLOR_666666 Mesasge:@"您当前的选择不允许选择付费阅读，将自动改为免费方案,是否同意继续发布？单场双选的赔率，两个选项赔率值必须均超过2.00以上，且总赔率之和需大于6.0。" MessageColor:COLOR_2F2F2F SureTitle:@"继续发布" SureColor:JCWhiteColor SureHandler:^{
                    JCPostPlanItemModel *model = self.itemArray.firstObject;
                     JCPostPlanItemModel *bztkModel = self.itemArray[2];
                    if (model.is_sf) {
                        model.price = @"免费";
                        bztkModel.bztk = NO;
                        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
                        [alertView removeFromSuperview];
                        [self observeSensitiveWord];
                    }
                    
                } CancleTitle:@"我要修改" CancleColor:JCBaseColor CancelHandler:^{
                   [alertView removeFromSuperview];
                }];

                alertView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
                [[UIApplication sharedApplication].keyWindow addSubview:alertView];
                return NO;
            }
        }

    }
    if (self.dataArray.count==2) {
        float value1 = 0;
        float value2 = 0;
        BOOL haveTow = NO;
        JCPostPlanMathInfoModel *mathModel1 = self.dataArray.firstObject;
        if (mathModel1.btnArray.count==1) {
            JCPostButton *btn = mathModel1.btnArray.firstObject;
            value1 = [btn.value floatValue];
        }
        if (mathModel1.btnArray.count==2) {
            haveTow = YES;
            JCPostButton *btn1 = mathModel1.btnArray.firstObject;
            JCPostButton *btn2 = mathModel1.btnArray.lastObject;
            value1 = [btn1.value floatValue]*[btn2.value floatValue]/([btn1.value floatValue]+[btn2.value floatValue]);
//            if ([btn1.value floatValue]>[btn2.value floatValue]) {
//                 value1 = [btn2.value floatValue];
//            }else{
//                 value1 = [btn1.value floatValue];
//            }

        }
        JCPostPlanMathInfoModel *mathModel2 = self.dataArray.lastObject;
            if (mathModel2.btnArray.count==1) {
                JCPostButton *btn = mathModel2.btnArray.firstObject;
                value2 = [btn.value floatValue];
            }
            if (mathModel2.btnArray.count==2) {
                haveTow = YES;
                JCPostButton *btn1 = mathModel2.btnArray.firstObject;
                JCPostButton *btn2 = mathModel2.btnArray.lastObject;
                value2 = [btn1.value floatValue]*[btn2.value floatValue]/([btn1.value floatValue]+[btn2.value floatValue]);
//                if ([btn1.value floatValue]>[btn2.value floatValue]) {
//                     value2 = [btn2.value floatValue];
//                }else{
//                     value2 = [btn1.value floatValue];
//                }

            }
        
        //回报率
        //单选-1
        float huibao = value1*value2-1;
//        if (haveTow) {
//            //双选-2
//            huibao = value1*value2-2;
//        }
        JCPostPlanItemModel *priceItem = self.itemArray.firstObject;
        if (huibao<1&&![priceItem.price isEqualToString:@"免费"]) {
            JCBaseTitleAlertView *alertView = [JCBaseTitleAlertView new];
            [alertView alertTitle:@"" TitleColor:COLOR_666666 Mesasge:@"您的达人方案不满足付费条件\n2串1赔率大于2.00倍(回报率>1.00)\n3串1赔率大于3.00倍(回报率>2.00)\n将自动改为免费达人方案，是否同意继续发布?" MessageColor:COLOR_666666 SureTitle:@"继续发布" SureColor:JCWhiteColor SureHandler:^{
                JCPostPlanItemModel *model = self.itemArray.firstObject;
                JCPostPlanItemModel *bztkModel = self.itemArray[2];
                
                if (model.is_sf) {
                    model.price = @"免费";
                    bztkModel.bztk = NO;
                    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
                    [alertView removeFromSuperview];
                    [self observeSensitiveWord];
                }
                
            } CancleTitle:@"我要修改" CancleColor:JCBaseColor CancelHandler:^{
               [alertView removeFromSuperview];
            }];

            alertView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
            [[UIApplication sharedApplication].keyWindow addSubview:alertView];
            return NO;
        }

    }
    if (self.dataArray.count==3) {
        float value1 = 0;
        float value2 = 0;
        float value3 = 0;
        BOOL haveTow = NO;
        JCPostPlanMathInfoModel *mathModel1 = self.dataArray.firstObject;
        if (mathModel1.btnArray.count==1) {
            JCPostButton *btn = mathModel1.btnArray.firstObject;
            value1 = [btn.value floatValue];
        }
        if (mathModel1.btnArray.count==2) {
            haveTow = YES;
            JCPostButton *btn1 = mathModel1.btnArray.firstObject;
            JCPostButton *btn2 = mathModel1.btnArray.lastObject;
            value1 = [btn1.value floatValue]*[btn2.value floatValue]/([btn1.value floatValue]+[btn2.value floatValue]);
//            if ([btn1.value floatValue]>[btn2.value floatValue]) {
//                 value1 = [btn2.value floatValue];
//            }else{
//                 value1 = [btn1.value floatValue];
//            }

        }
        JCPostPlanMathInfoModel *mathModel2 = self.dataArray[1];
            if (mathModel2.btnArray.count==1) {
                JCPostButton *btn = mathModel2.btnArray.firstObject;
                value2 = [btn.value floatValue];
            }
            if (mathModel2.btnArray.count==2) {
                haveTow = YES;
                JCPostButton *btn1 = mathModel2.btnArray.firstObject;
                JCPostButton *btn2 = mathModel2.btnArray.lastObject;
                value2 = [btn1.value floatValue]*[btn2.value floatValue]/([btn1.value floatValue]+[btn2.value floatValue]);
//                if ([btn1.value floatValue]>[btn2.value floatValue]) {
//                     value2 = [btn2.value floatValue];
//                }else{
//                     value2 = [btn1.value floatValue];
//                }

            }
        
        JCPostPlanMathInfoModel *mathModel3 = self.dataArray.lastObject;
            if (mathModel3.btnArray.count==1) {
                JCPostButton *btn = mathModel3.btnArray.firstObject;
                value3 = [btn.value floatValue];
            }
            if (mathModel3.btnArray.count==2) {
                haveTow = YES;
                JCPostButton *btn1 = mathModel3.btnArray.firstObject;
                JCPostButton *btn2 = mathModel3.btnArray.lastObject;
                value3 = [btn1.value floatValue]*[btn2.value floatValue]/([btn1.value floatValue]+[btn2.value floatValue]);
//                if ([btn1.value floatValue]>[btn2.value floatValue]) {
//                     value3 = [btn2.value floatValue];
//                }else{
//                     value3 = [btn1.value floatValue];
//                }

            }
        float huibao = value1*value2*value3-1;//回报率
//        if (haveTow) {
//            huibao = value1*value2*value3-2;
//        }
        JCPostPlanItemModel *priceItem = self.itemArray.firstObject;
        if (huibao<2&&![priceItem.price isEqualToString:@"免费"]) {
            JCBaseTitleAlertView *alertView = [JCBaseTitleAlertView new];
            [alertView alertTitle:@"" TitleColor:COLOR_666666 Mesasge:@"您的达人方案不满足付费条件\n2串1赔率大于2.00倍(回报率>1.00)\n3串1赔率大于3.00倍(回报率>2.00)\n将自动改为免费达人方案，是否同意继续发布?" MessageColor:COLOR_666666 SureTitle:@"继续发布" SureColor:JCWhiteColor SureHandler:^{
                JCPostPlanItemModel *model = self.itemArray.firstObject;
                JCPostPlanItemModel *bztkModel = self.itemArray[2];
                if (model.is_sf) {
                    model.price = @"免费";
                    bztkModel.bztk = NO;
                    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
                    [alertView removeFromSuperview];
                    [self observeSensitiveWord];
                }
                
            } CancleTitle:@"我要修改" CancleColor:JCBaseColor CancelHandler:^{
               [alertView removeFromSuperview];
            }];

            alertView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
            [[UIApplication sharedApplication].keyWindow addSubview:alertView];
            return NO;
        }

    }
    return YES;
}



- (void)showMatchSelView {
    if (self.matchArray>0) {
        if (self.matchSearchStr.length>0) {
            NSMutableArray *array = [NSMutableArray array];
            [self.matchArray enumerateObjectsUsingBlock:^(JCPostPlanMatchModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if ([obj.leagueName containsString:self.matchSearchStr]||[obj.homeName containsString:self.matchSearchStr]||[obj.awayName containsString:self.matchSearchStr]) {
                    [array addObject:obj];
                }
            }];
            if (array.count ==0) {
                [JCWToastTool showHint:@"当前筛选暂无比赛"];
                return;
            }
            self.raceSelectView.dataArray = array;
            [[UIApplication sharedApplication].keyWindow addSubview:self.raceSelectView];
            [self.raceSelectView show];

        }else{
            self.raceSelectView.dataArray = self.matchArray;
            [[UIApplication sharedApplication].keyWindow addSubview:self.raceSelectView];
            [self.raceSelectView show];
        }
    }else{
        [self getMatchListWithShow:YES];
    }

}

- (JCPostPlanHeadView *)headView {
    if (!_headView) {
        _headView = [JCPostPlanHeadView new];
    }
    return _headView;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [UIView new];
        _bottomView.backgroundColor = JCWhiteColor;
    }
    return _bottomView;
}

- (UIButton *)submitBtn {
    if (!_submitBtn) {
        _submitBtn = [UIButton initWithText:@"发布" FontSize:14 BackGroundColor:JCClearColor TextColors:COLOR_1B1B1B];
        [_submitBtn addTarget:self action:@selector(submitBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _submitBtn;
}
- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"" andFont:AUTO(13) andWeight:0 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];;
    }
    return _infoLab;
}
- (JCPostPlanSelectView *)raceSelectView {
    if (!_raceSelectView) {
        _raceSelectView = [JCPostPlanSelectView new];
        _raceSelectView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        WeakSelf;
        _raceSelectView.JCTitleBlock = ^(NSString * _Nonnull title, NSString * _Nonnull titleInfo, NSString * _Nonnull match_num) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                if (weakSelf.dataArray.count>=3) {
                    [JCWToastTool showHint:@"最多选择3场"];
                    return;
                }
                
            for (JCPostPlanMathInfoModel *lastModel  in weakSelf.dataArray) {
                if ([lastModel.match_id isEqualToString:match_num]) {
                    [JCWToastTool showHint:@"您选择的比赛重复了"];
                    return;
                };
            }
                [weakSelf getMatchDetailWithMatch_num:match_num];

            });

        };
    }
    return _raceSelectView;
}

- (NSMutableArray *)itemArray {
    if (!_itemArray) {
        NSMutableArray *array  = [NSMutableArray array];
        for (int i=0; i<3; i++) {
            JCPostPlanItemModel *model = [JCPostPlanItemModel new];

            if (i==0) {
                model.price = @"免费";
                model.is_sf = YES;
            }
            if (i==1) {
                model.time = @"否";
                model.is_push = YES;
            }
            if (i==2) {
                model.bztk_string = @"不中返还";
                model.is_bztk = YES;
                model.bztk = NO;
                
            }
 
            [array addObject:model];
        }
        _itemArray = [NSMutableArray arrayWithArray:array];
        
    }
    return _itemArray;
}


- (void)resetData {
//    [self.itemArray removeAllObjects];
        for (int i=0; i<self.itemArray.count; i++) {
            JCPostPlanItemModel *model = self.itemArray[i];
            if (i==0) {
                model.price = @"免费";
                model.is_sf = YES;
            }
            if (i==1) {
                model.time = @"否";
                model.push = NO;
                model.is_push = YES;
            }
            if (i==2) {
                model.bztk_string = @"不中返还";
                model.is_bztk = YES;
                model.bztk = NO;
                
            }
            if (i==3) {
                model.is_hongbao = YES;
                model.hongbao = NO;
            }

        }

    self.titleInfo = @"";
    self.content = @"";
    self.citation = @"";
    self.headView.numLab.text = @"0/40";
    self.footView.yinwenCountLab.text = @"0/300";
    self.footView.zhengweCountLab.text = @"0/1000";
    self.selectedPhotos = @[];
    
    [self.dataArray removeAllObjects];
    [self.tableView reloadData];
}

- (NSArray *)getSensitiveWordRangeWithContent:(NSString *)content word:(NSString *)word {
    NSString *string1= content;
    NSString *string2 = word;
     
    NSArray *array=[string1 componentsSeparatedByString:string2];
    NSMutableArray *arrayOfLocation=[NSMutableArray new];
    int d=0;
    for (int i=0; i<array.count-1; i++) {
            NSString *string=array[i];
            NSNumber *number=[NSNumber numberWithInt:d+=string.length];
            d+=string2.length;
            [arrayOfLocation addObject:number];
     
    }
    return arrayOfLocation;
    NSLog(@"%@",arrayOfLocation);
}

- (void)clearData {
    for (JCPostPlanMathInfoModel *model in self.dataArray) {
        [model.btnArray removeAllObjects];
    }

    [self.tableView reloadData];

}

- (void)configMatchCount {

    JCPostPlanItemModel *model = self.itemArray[0];
    JCPostPlanItemModel *bztkModel = self.itemArray[2];

        NSArray *array = [model.price componentsSeparatedByString:@"元"];
        if (array.count>1) {
            NSString *price = array[0];
            NSInteger prize = [price integerValue];
            if (self.dataArray.count<=1&&prize<[self.dcRefundModel.sf intValue]/100.0f&&bztkModel.bztk) {
                bztkModel.bztk = NO;
//                return YES;
            }
            if (self.dataArray.count>1&&prize<[self.scRefundModel.sf intValue]/100.0f&&bztkModel.bztk) {
//                return YES;
                bztkModel.bztk = NO;
            }
            if (self.dataArray.count==1) {
                if (![model.price isEqual:@"免费"]) {
                    if (bztkModel.bztk) {
                        JCPostPriceModel *largeModel = self.dcPriceArray.lastObject;
                        if (prize*100>[self.dcRefundModel.sf integerValue]&&prize*100>[largeModel.sf integerValue]) {
                            model.price = self.dcRefundModel.total;
                        }
                        
                    }else{
                        if (self.dcPriceArray.count>0) {
                            JCPostPriceModel *largeModel = self.dcPriceArray.lastObject;
                            if (prize>[largeModel.sf integerValue]/100.0f) {
                                JCPostPriceModel *smallModel = self.dcPriceArray.firstObject;
                                if ([smallModel.sf intValue]==0) {
                                    JCPostPriceModel *priceModel = self.dcPriceArray[1];
                                    model.price = priceModel.total;
                                }else{
                                    model.price = smallModel.total;
                                }
                                
                            }
                            
                        }

                    }

                }
            }
            

            
        }else{
            bztkModel.bztk = NO;
        }
    [self.tableView reloadData];
//    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];

}

//不中退款,当场小于38,多串小于48不可以开启不中退款
- (BOOL)configRefundStatusWithCell:(JCPostPlanCommonCell *)cell {
//                commonCell.dataArray = self.dataArray;
    JCPostPlanItemModel *model = self.itemArray[0];
    if (model.is_sf) {
        NSArray *array = [model.price componentsSeparatedByString:@"元"];
        if (array.count>1) {
            NSString *price = array[0];
            NSInteger prize = [price integerValue];
            
            if (self.dataArray.count<=1) {
                NSInteger rufundPrice = [self.dcRefundModel.sf intValue]/100.0f;
                if (prize>=rufundPrice) {
                    return YES;
                }
                
            }
            if (self.dataArray.count>1) {
                NSInteger rufundPrice = [self.scRefundModel.sf intValue]/100.0f;
                if (prize>=rufundPrice) {
                    return YES;
                }
//                return YES;
            }
            
        }
    }
    return NO;
}


- (NSDate *)getDate:(NSDate *)currentDate day:(NSInteger)day {
    NSInteger days = day;    // n天后的天数
    days = (days == 0 ? 2.f : days);//未指定天数则默认为两天
    NSDate *appointDate;    // 指定日期声明
    NSTimeInterval oneDay = 24 * 60 * 60;  // 一天一共有多少秒
    appointDate = [currentDate initWithTimeIntervalSinceNow: +(oneDay * days)];
    return appointDate;
}

- (void)showdDataPickView {
    // 1.创建日期选择器
    BRDatePickerView *datePickerView = [[BRDatePickerView alloc]init];
    // 2.设置属性
    datePickerView.pickerMode = BRDatePickerModeYMDHM;
    datePickerView.title = @"推送日期";
    // datePickerView.selectValue = @"2019-10-30";
    NSTimeInterval time = [NSDate date].timeIntervalSince1970 + 60;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
    datePickerView.selectDate = date;
    
    datePickerView.minDate = [NSDate date];
    datePickerView.maxDate = [self getDate:[NSDate date] day:2];
    datePickerView.isAutoSelect = NO;
    WeakSelf;
    datePickerView.resultBlock = ^(NSDate *selectDate, NSString *selectValue) {
        NSLog(@"选择的值：%@", selectValue);
        NSTimeInterval stamp = [selectDate timeIntervalSince1970];
        NSString *time = [NSString stringWithFormat:@"%.0f",stamp];
        NSLog(@"%@",time);

        //赛选出来的时间
        
        
        JCPostPlanItemModel *model = weakSelf.itemArray[1];
        model.time = selectValue;
        [weakSelf.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationAutomatic];
        

    };

    // 设置自定义样式
    BRPickerStyle *customStyle = [[BRPickerStyle alloc]init];
    customStyle.titleTextColor = COLOR_333333;
    customStyle.pickerColor = JCWhiteColor;
    customStyle.pickerTextColor = COLOR_333333;
    customStyle.separatorColor = JCClearColor;
    customStyle.pickerTextFont = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(24)];
    customStyle.pickerTextColor = COLOR_333333;
    customStyle.doneTextFont = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(16)];
    customStyle.doneTextColor = JCBaseColor;
    customStyle.cancelTextFont = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(16)];
    customStyle.cancelTextColor = COLOR_333333;
    datePickerView.pickerStyle = customStyle;
    // 3.显示
    [datePickerView show];
}

- (JCPostPlanFootView *)footView {
    if (!_footView) {
        _footView = [JCPostPlanFootView new];
    }
    return _footView;
}
@end
