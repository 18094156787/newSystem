//
//  JCPostCheckPlanVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/25.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCPostCheckPlanVC.h"
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
#import "JCPostPlanCell.h"
#import "JCPostPlanMathInfoModel_New.h"
#import "JCPostPlanMathInfoSPFModel.h"
#import "JCPostPlanRequest_integerModel.h"
#import "JCBaseTitleAlertView.h"
#import "JCWSensitiveWordsModel.h"
@interface JCPostCheckPlanVC ()

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

@property (nonatomic,strong) UIButton *addImgBtn;

@property (nonatomic,strong) NSDictionary *sensitiveData;

@end

@implementation JCPostCheckPlanVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
    [self setNavBackImg];
    
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
}
- (void)back:(UIButton *)sender {

    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

- (void)setType:(NSString *)type {
    _type = type;
    if (self.lastType&&![self.lastType isEqualToString:type]) {
        [self getMatchListWithShow:NO];
        [self resetData];
    }
    self.lastType = type;
    
    if ([self.type integerValue]==1) {
        self.title = @"发布方案(竞足)";
    }
    if ([self.type integerValue]==2) {
        self.title = @"发布方案(让球)";
    }
    if ([self.type integerValue]==3) {
        self.title = @"发布方案(进球数)";
    }
}
- (void)viewDidLoad {
    self.style = 1;
    [super viewDidLoad];
    self.view.backgroundColor = COLOR_F0F0F0;
    self.title = @"发布达人方案";
    [self initViews];
    [self getMatchListWithShow:NO];//获取比赛列表
    [self getMyPostPlanDetail];//(ps:重新编辑时调用)
    [self canPostEanble];
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self getMatchDetailWithMatch_num:@"3431237"];
//    });
}

- (void)getMyPostPlanDetail {
//    self.tuijian_id = @"180";

    if (self.tuijian_id.length==0) {
        return;
    }
    [self.view showLoading];
    JCUserService_New *serviece = [JCUserService_New new];
    [serviece getPostPlan_planDetailWithTuijian_id:self.tuijian_id Success:^(id  _Nullable object) {
        [self.view endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            self.model = (JCMyPostCheckTuiJianModel *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCMyPostCheckTuiJianModel class]];
            self.type = self.model.classfly;
            self.titleInfo = self.model.title;
            self.titleTV.text = self.model.title;
            self.citation = self.model.citation;
            self.footView.yinwenContentTV.text = self.citation;
            self.content = self.model.content;
            self.footView.zhengweContentTV.text = self.content;
            
            self.headView.numLab.text =  [NSString stringWithFormat:@"%ld/40",self.titleTV.text.length];
            self.footView.yinwenCountLab.text = [NSString stringWithFormat:@"%ld/300",self.footView.yinwenContentTV.text.length];
            self.footView.zhengweCountLab.text = [NSString stringWithFormat:@"%ld/1000",self.footView.zhengweContentTV.text.length];
            
            NSArray *array = [NSArray arrayWithArray:self.model.match_data];
            [array enumerateObjectsUsingBlock:^(JCPostPlanMathInfoModel *model, NSUInteger idx, BOOL * _Nonnull stop) {
                model.home_team_name = model.home_team_name;
                model.away_team_name = model.away_team_name;
                model.competition_name = model.competition_name;
                model.issue_num = model.round_num;
                model.match_long_time = [NSDate timeStringWithIntervalWithFormat:@"yyyy-MM-dd HH:mm" time:[model.get_match_time doubleValue]];
                if ([self.type integerValue]==1) {
                    if (model.odds_spf.length>0) {
                        
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
                        model.odds_spf_model = odds_spf_model;
                        
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
                        model.odds_rq_model = odds_rq_model;
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
            

            
           //图片相关
            self.selectedPhotos = [NSMutableArray arrayWithArray:self.model.img_info];
            self.footView.selectedPhotos = [NSMutableArray arrayWithArray:self.selectedPhotos];
            [self.footView refresgImageData];
            
            //
            self.addImgBtn = self.footView.addImgBtn;
            self.citationTV = self.footView.yinwenContentTV;
            self.contentTV = self.footView.zhengweContentTV;
            self.footView.yinwenContentTV.text = self.citation;
            self.footView.zhengweContentTV.text = self.content;
            self.titleTV.text = self.titleInfo;
            
            
            [self.tableView reloadData];
            
            
            
            
            
        }else {
            [JCWToastTool showHint:object[@"msg"]];
        }
        
    } failure:^(NSError * _Nonnull error) {
        [self.view endLoading];
    }];
    


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
    
    self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(90));
    [self.headView updateBgView];
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
    };


    self.headView.JCContentBlock = ^(NSString * _Nonnull str) {
        weakSelf.titleInfo = str;
        [weakSelf canPostEanble];
    };
    
}

#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section==0) {
        return self.dataArray.count;
    }
    return 0;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

        if ([self.type integerValue]>1) {
            JCPostPlanCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCPostPlanCell"];
            JCPostPlanMathInfoModel *model = self.dataArray[indexPath.row];
            cell.type = self.type;
            cell.model = model;
            
            WeakSelf;
            cell.JCTitleSelectBlock = ^{
                [weakSelf.view endEditing:YES];
                self.isAdd = NO;
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
                        weakSelf.raceSelectView.dataArray = array;
                        [[UIApplication sharedApplication].keyWindow addSubview:weakSelf.raceSelectView];
                        [weakSelf.raceSelectView show];

                    }else{
                        weakSelf.raceSelectView.dataArray = self.matchArray;
                        [[UIApplication sharedApplication].keyWindow addSubview:weakSelf.raceSelectView];
                        [weakSelf.raceSelectView show];
                    }
                }else{
                    [self getMatchListWithShow:YES];
                }

                
                
            };
            
            
            cell.JCMatchSelectBlock = ^{
                [weakSelf showSelectMatchCount];
            };
            
            [cell.deleteBtn bk_whenTapped:^{
                [weakSelf.dataArray removeObjectAtIndex:indexPath.row];
                [weakSelf.tableView reloadData];
                if (weakSelf.dataArray.count==1) {
                    weakSelf.currentIndex = 0;
                }
                 [weakSelf showSelectMatchCount];
        //        NSLog(@"%")
            }];

            return cell;
        }
        
        JCPostPlanOPCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCPostPlanOPCell"];
        JCPostPlanMathInfoModel *model = self.dataArray[indexPath.row];
        cell.index = indexPath.row;
        cell.model = model;
        cell.dataArray = self.dataArray;
        WeakSelf;
        cell.JCTitleSelectBlock = ^{
            weakSelf.currentIndex = indexPath.row;
            [weakSelf.view endEditing:YES];
            self.isAdd = NO;
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
                    weakSelf.raceSelectView.dataArray = array;
                    [[UIApplication sharedApplication].keyWindow addSubview:weakSelf.raceSelectView];
                    [weakSelf.raceSelectView show];

                }else{
                    weakSelf.raceSelectView.dataArray = self.matchArray;
                    [[UIApplication sharedApplication].keyWindow addSubview:weakSelf.raceSelectView];
                    [weakSelf.raceSelectView show];
                }
            }else{
                [self getMatchListWithShow:YES];
            }

            
            
        };
        
        
        cell.JCMatchSelectBlock = ^{
            [weakSelf showSelectMatchCount];
        };
        
        [cell.deleteBtn bk_whenTapped:^{
            [weakSelf.dataArray removeObjectAtIndex:indexPath.row];
            [weakSelf.tableView reloadData];
            if (weakSelf.dataArray.count==1) {
                JCPostPlanMathInfoModel *infoModel = weakSelf.dataArray.firstObject;
                if (infoModel.btnArray.count==1) {
                    JCPostButton *btn = infoModel.btnArray.firstObject;
                    if ([btn.value intValue]<1.4) {
                        [infoModel.btnArray removeObject:btn];
                    }
                }
            }
             [weakSelf showSelectMatchCount];
    //        NSLog(@"%")
        }];
    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section==0) {
         if ([self.type integerValue]==1) {
             return AUTO(220);
         }
          return AUTO(160);
    }

    return AUTO(44);
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section==0) {
//        JCPostPlanSearchMatchHeadView *headView= [JCPostPlanSearchMatchHeadView new];
//        WeakSelf;
//        headView.JCContentBlock = ^(NSString * _Nonnull content) {
//            weakSelf.matchSearchStr = content;
//        };
//        return headView;
        return [UIView new];
    }
    UIView *headView = [UIView new];
    headView.backgroundColor = COLOR_F4F6F9;
    return headView;

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section==0) {
//        return AUTO(50);
        return 0.001f;
    }
    if (section==1) {
        return AUTO(10);
    }
    return 0.001f;
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section==0) {
        if ([self.type integerValue]==1) {
            if (self.dataArray.count>=3) {
                return 0.01;
            }
        }else{
            if (self.dataArray.count>=1) {
                return 0.01;
            }
        }

        return AUTO(70);
    }
    if (section==1) {
         return AUTO(1120);
    }
    
    return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (section==0) {
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

                }else{
                    weakSelf.raceSelectView.dataArray = weakSelf.matchArray;
                    [[UIApplication sharedApplication].keyWindow addSubview:weakSelf.raceSelectView];
                    [weakSelf.raceSelectView show];
                }
            }else{
                [weakSelf getMatchListWithShow:YES];
            }

        }];
        return footView;;
    }
    
    
    if (section==1) {
        self.addImgBtn = self.footView.addImgBtn;
        self.citationTV = self.footView.yinwenContentTV;
        self.contentTV = self.footView.zhengweContentTV;

        WeakSelf;
        self.footView.JCYinWenBlock = ^(NSString * _Nonnull str) {
            weakSelf.citation= str;
            [weakSelf canPostEanble];
        };
        self.footView.JCZhengWenBlock = ^(NSString * _Nonnull str) {
            weakSelf.content= str;
            [weakSelf canPostEanble];
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

}


#pragma mark 网络请求

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
            [self.tableView reloadData];
        }
        
    } failure:^(NSError * _Nonnull error) {
        [self.view endLoading];
    }];
    
}




- (void)submitBtnClick {
    NSString *content = [self.contentTV.text stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (content.length<300) {
         [JCWToastTool showHint:@"您输入的文章纯文本内容不足300字,请重新输入"];
           return;
    }

    [self.view endEditing:YES];
    [self observeSensitiveWord];

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
        NSString *code = object[@"code"];
        [self endRefresh];
        if ([JCWJsonTool isSuccessResponse:object]) {
             NSMutableAttributedString *titleAttr = [[NSMutableAttributedString alloc] initWithString:NonNil(self.titleInfo) attributes:@{NSForegroundColorAttributeName:COLOR_333333,NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(14)]}];
            NSMutableAttributedString *ciAttr = [[NSMutableAttributedString alloc] initWithString:NonNil(self.citation) attributes:@{NSForegroundColorAttributeName:COLOR_333333,NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(14)]}];
            NSMutableAttributedString *contentAttr = [[NSMutableAttributedString alloc] initWithString:NonNil(self.content) attributes:@{NSForegroundColorAttributeName:COLOR_333333,NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(14)]}];
            self.titleTV.attributedText = titleAttr;
            self.citationTV.attributedText = ciAttr;
            self.contentTV.attributedText = contentAttr;
            
            
            [self uploadPostImageGroup1WithImages:self.selectedPhotos];

            
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
              NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:self.titleInfo attributes:@{NSForegroundColorAttributeName:COLOR_333333,NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(16)]}];
                for (JCWSensitiveWordsModel *model in titleArray) {
                    NSString *word = model.word;
                    NSArray *rangeArray = [self getSensitiveWordRangeWithContent:self.titleInfo word:word];

                    for (int i=0; i<rangeArray.count; i++) {

                        NSNumber *location = rangeArray[i];
                        NSInteger locValue = [location integerValue];
//                                locValue = locValue;
                        NSRange range = NSMakeRange(locValue, word.length);

                        if (range.location!=NSNotFound) {
                            [attr addAttributes:@{NSForegroundColorAttributeName:JCBaseColor,NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(16)]} range:range];
                           
                        }else {
                            [attr addAttributes:@{NSForegroundColorAttributeName:COLOR_333333,NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(16)]} range:range];
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


//帖子图片
- (void)uploadPostImageGroup1WithImages:(NSArray *)imgArray {
    if (imgArray.count>0) {
        //图片上传
        NSMutableArray *imageArray = [NSMutableArray array];
        [imgArray enumerateObjectsUsingBlock:^(JCPostImageModel * _Nonnull data, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([data.url isKindOfClass:[UIImage class]]) {
//                 [self.view showLoading];
        
                JCUserService_New * service = [JCUserService_New service];
                [service uploadAvatarWithImage:data.url type:@"1" width:[NSString stringWithFormat:@"%ld",data.width] height:[NSString stringWithFormat:@"%ld",data.height] success:^(id  _Nullable object) {
                    [self endRefresh];
                    if ([JCWJsonTool isSuccessResponse:object]) {
                        if (object[@"data"][@"image_id"]) {
                            [imageArray addObject:object[@"data"][@"image_id"]];
                        }
                        if (imageArray.count==imgArray.count) {

                            [self submitSuggestionUploadWithImages:imageArray];
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
                 JCPostPlanRequest_integerModel *model = [JCPostPlanRequest_integerModel new];
//                 model.titleInfo = mathModel.titleInfo;
                 NSString *value = @"";
                 for (int i=0; i<mathModel.btnArray.count; i++) {
                     JCPostButton *btn = mathModel.btnArray[i];
                     
                     if (i==0) {
                         value = btn.spf;
                     }else{
                         value = [NSString stringWithFormat:@"%@,%@",value,btn.spf];
                     }
                 }
                 model.spf = value;
                 model.match_num = [mathModel.match_id intValue];
                 model.match_id = [mathModel.match_id intValue];

                 [matchArray addObject:model];
             }else{
                 //
                 [JCWToastTool showHint:@"请选择概率"];
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
                 [matchArray addObject:model];
             }else{
                 //
                 [JCWToastTool showHint:@"请选择概率"];
                 return;
             }
         }
         
     }
     if (self.dataArray.count==2){
         JCPostPlanMathInfoModel *obj1 = self.dataArray.firstObject;
         JCPostPlanMathInfoModel *obj2 = self.dataArray.lastObject;
         if ([obj1.match_num isEqualToString:obj2.match_num]) {
             [JCWToastTool showHint:@"您选择的比赛重复了"];
             return;
         }

     }
     if (matchArray.count==0) {
         [JCWToastTool showHint:@"请选择概率"];
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
    

//     //type 1是单场 2是二串一 单场还是二串一
//     NSString *type = @"1";
//     if (matchArray.count>1) {
//         type = @"2";
//     }

//    NSDictionary *dic = @{@"match_data":matchArray,@"title":self.titleTV.text,@"content":self.contentTV.text,@"citation":NonNil(self.citationTV.text),@"classfly":self.type,@"imageObject":imageArray,@"image":@""};
    NSString *image = @"";
    if (imageArray.count>0) {
        for (int i=0; i<imageArray.count; i++) {
            NSString *imgID = imageArray[i];
            if (i==0) {
                image = imgID;
            }else{
                image = [NSString stringWithFormat:@"%@,%@",image,imgID];
            }
        }
    }
    
    
    NSMutableArray *matchJsonArray = [matchArray yy_modelToJSONObject];

    
    NSDictionary *dic = @{@"match_data":matchJsonArray,@"title":self.titleTV.text,@"content":self.contentTV.text,@"citation":NonNil(self.citationTV.text),@"classfly":@([self.type intValue]),@"image":image};
    if (self.tuijian_id.length>0) {
        dic = @{@"id":self.tuijian_id,@"match_data":matchJsonArray,@"title":self.titleTV.text,@"content":self.contentTV.text,@"citation":NonNil(self.citationTV.text),@"classfly":@([self.type intValue]),@"image":image};
    }
    NSLog(@"参数%@",dic);
    [self.view showLoading];
    JCUserService_New *service = [JCUserService_New new];
    [service getApplyQy_PostMatchInfoWithParamDic:dic success:^(id  _Nullable object) {
        NSLog(@"对象%@",object);
        [self.view endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            JCMyPostCheckTuiJianModel *model = (JCMyPostCheckTuiJianModel *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCMyPostCheckTuiJianModel class]];
//            NSString *tuijian_id = [NSString stringWithFormat:@"%@",object[@"data"][@"tujian_id"]];
//            model.tuijian_id = tuijian_id;
//            NSLog(@"推荐id:%@",tuijian_id);//
        if (self.JCDataBlock) {
            self.JCDataBlock(model);
            [self.navigationController popToViewController:self.checkVC animated:YES];
        }

        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }
    } failure:^(NSError * _Nonnull error) {
        [self.view endLoading];
    }];

}
//符合条件,发布按钮才能高亮点击
- (void)canPostEanble {
    if (self.titleTV.text.length>0&&self.content.length>300&&self.matchArray.count>0) {
        self.submitBtn.userInteractionEnabled = YES;
        [self.submitBtn setTitleColor:COLOR_2F2F2F forState:0];
    }else{
        self.submitBtn.userInteractionEnabled = NO;
        [self.submitBtn setTitleColor:[COLOR_2F2F2F colorWithAlphaComponent:0.7] forState:0];
    }
}




//显示选择了多少场
- (void)showSelectMatchCount {
    NSInteger count = 0;
    for (JCPostPlanMathInfoModel *model in self.dataArray) {
        if (model.btnArray>0) {
            count++;
        }
    }
    if (count>0) {
        self.infoLab.text = [NSString stringWithFormat:@"已选择%ld场",count];
    }else{
        self.infoLab.text = @"";
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
        _submitBtn = [UIButton initWithText:@"发布" FontSize:14 BackGroundColor:JCClearColor TextColors:[COLOR_2F2F2F colorWithAlphaComponent:0.6]];
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

//- (JCPostPlanSelectView *)raceSelectView {
//    if (!_raceSelectView) {
//        _raceSelectView = [JCPostPlanSelectView new];
//        _raceSelectView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
//        WeakSelf;
//        _raceSelectView.JCTitleBlock = ^(NSString * _Nonnull title, NSString * _Nonnull titleInfo, NSString * _Nonnull match_num) {
//            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                if (weakSelf.isAdd) {
//                    for (JCPostPlanMathInfoModel *lastModel  in weakSelf.dataArray) {
//                        if ([lastModel.match_num isEqualToString:match_num]) {
//                            [JCWToastTool showHint:@"您选择的比赛重复了"];
//                            return;
//                        };
//                    }
//
//
//                    JCPostPlanMathInfoModel *model = [JCPostPlanMathInfoModel new];
//                    model.title = title;
//                    model.titleInfo = titleInfo;
//                    model.match_num = match_num;
//                    [weakSelf.dataArray addObject:model];
//                    [weakSelf getMatchDetailWithMatch_num:model];
//                }else{
//                    for (JCPostPlanMathInfoModel *lastModel  in weakSelf.dataArray) {
//                        if ([lastModel.match_num isEqualToString:match_num]) {
//                            [JCWToastTool showHint:@"您选择的比赛重复了"];
//                            return;
//                        };
//                    }
//                    JCPostPlanMathInfoModel *model = weakSelf.dataArray[weakSelf.currentIndex];
//                    model.title = title;
//                    model.match_num = match_num;
//                    model.titleInfo = titleInfo;
//                    [weakSelf getMatchDetailWithMatch_num:model];
//                }
//            });
//
//        };
//    }
//    return _raceSelectView;
//}
- (NSMutableArray *)itemArray {
    if (!_itemArray) {
        NSMutableArray *array  = [NSMutableArray array];
        for (int i=0; i<4; i++) {
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
                model.bztk_string = @"";
                model.is_bztk = YES;
                model.bztk = NO;
                
            }
            if (i==3) {
                model.is_hongbao = YES;
                model.hongbao = YES;
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
                model.bztk_string = @"";
                model.is_bztk = YES;
                model.bztk = NO;
                
            }
            if (i==3) {
                model.is_hongbao = YES;
                model.hongbao = YES;
            }

        }
//    self.titleTV.text = @"";
//    self.citationTV.text = @"";
//    self.contentTV.text = @"";
    self.titleInfo = @"";
    self.content = @"";
    self.citation = @"";
    self.selectedPhotos = @[];
    
    [self.dataArray removeAllObjects];
    [self.tableView reloadData];
}

- (void)clearData {
    for (JCPostPlanMathInfoModel *model in self.dataArray) {
        [model.btnArray removeAllObjects];
    }

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
    
    datePickerView.minDate = [NSDate br_setYear:1949 month:3 day:12];
    datePickerView.maxDate = [NSDate br_setYear:2099 month:12 day:30];
    datePickerView.isAutoSelect = NO;
    datePickerView.resultBlock = ^(NSDate *selectDate, NSString *selectValue) {
        NSLog(@"选择的值：%@", selectValue);
        NSTimeInterval stamp = [selectDate timeIntervalSince1970];
        NSString *time = [NSString stringWithFormat:@"%.0f",stamp];
        NSLog(@"%@",time);

        //赛选出来的时间
        
        
        JCPostPlanItemModel *model = self.itemArray[1];
        model.time = selectValue;
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationAutomatic];
        

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
