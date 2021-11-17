//
//  JCPlaneDetailNewVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/12/18.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCPlaneDetailNewVC.h"
#import "JCPlaneDetailNewSubTitleCell.h"
#import "JCPlaneDetailNewContentCell.h"
#import "JCPlaneDetailNewAnalysisCell.h"
#import "JCPlaneDetailResultCell.h"
#import "JCFootBallAuthorDetailWMViewController.h"
#import "JCPlaneDetailImageCell.h"
#import "YBImageBrowser.h"
#import "JCFootBallBuyPlaneFootView.h"
#import "JCPlaneDetailMatchCell.h"
#import "JCMatchDetailWMStickVC.h"
#import "JCPlaneDetailInfo_MFCell.h"
#import "JCHongBangOrderDetailVC.h"
#import "JCPlaneDetailNewMatchCell.h"
#import "JCPlaneDetailQRcodeCell.h"
#import "JCColumnDetailWMViewController.h"
@interface JCPlaneDetailNewVC ()

@property (nonatomic,strong) JCFootBallBuyPlaneFootView *footView;


@property (nonatomic, assign) float cellHeight;

@property (nonatomic, assign) NSInteger index;


@end

@implementation JCPlaneDetailNewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = JCWhiteColor;

    [self initViews];
//    [self refreshData];
    [self getPeoPleList];
}




- (void)initViews {

    [self.view bringSubviewToFront:self.tableView];

    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.estimatedRowHeight = 80;
    self.tableView.backgroundColor = JCClearColor;
    // 表格注册cell
    [self.tableView registerClass:[JCPlaneDetailNewSubTitleCell class] forCellReuseIdentifier:@"JCPlaneDetailNewSubTitleCell"];
    [self.tableView registerClass:[JCPlaneDetailNewContentCell class] forCellReuseIdentifier:@"JCPlaneDetailNewContentCell"];
    [self.tableView registerClass:[JCPlaneDetailNewAnalysisCell class] forCellReuseIdentifier:@"JCPlaneDetailNewAnalysisCell"];
    [self.tableView registerClass:[JCPlaneDetailResultCell class] forCellReuseIdentifier:@"JCPlaneDetailResultCell"];
    [self.tableView registerClass:[JCPlaneDetailNewMatchCell class] forCellReuseIdentifier:@"JCPlaneDetailNewMatchCell"];

    [self.tableView registerClass:[JCPlaneDetailImageCell class] forCellReuseIdentifier:@"JCPlaneDetailImageCell"];
    [self.tableView registerClass:[JCPlaneDetailQRcodeCell class] forCellReuseIdentifier:@"JCPlaneDetailQRcodeCell"];

    
    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.left.bottom.right.equalTo(self.view);
    }];
    
    WeakSelf;
    self.footView.JCMoreBlock = ^{
        [weakSelf getPeoPleList];
    };
}

- (void)getPeoPleList {

    if (!self.planDetailModel) {
        return;
    }
//    @weakify(self);
    [self.jcWindow showLoading];
    JCHomeService_New *service = [JCHomeService_New service];
    [service getPlanLookWithTuijian_id:self.planDetailModel.id Page:self.pageNo success:^(id  _Nullable object) {
//        @strongify(self);
        [self endRefresh];
        if ([JCWJsonTool isSuccessResponse:object]) {
            NSArray *array = [JCWJsonTool arrayWithJson:object[@"data"][@"brown_info"] class:[JCPlanBuyPersonModel class]];
            NSString *number = [NSString stringWithFormat:@"%@",object[@"data"][@"brown_num"]];
            [self.dataArray addObjectsFromArray:array];
            
            if (array.count>0) {
                float width = (SCREEN_WIDTH-AUTO(10))/8.0f;
                float height = ceil(self.dataArray.count/8.0)*width+AUTO(120);
                self.footView.frame = CGRectMake(0, 0, SCREEN_WIDTH, height);
                self.footView.dataArray = self.dataArray;
                self.tableView.tableFooterView = self.footView;



            }

            
            [self.tableView reloadData];
            self.pageNo++;
            if (array.count==24) {
                self.footView.moreBtn.hidden = NO;
            }else {
                self.footView.moreBtn.hidden = YES;
            }
            
            NSString *count = [NSString stringWithFormat:@"该文章已有%@人查看",number];
            
            NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:count];
            if (number.length>0) {
                NSRange range = [count rangeOfString:number];
                [attrString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(18)] range:range];
                [attrString addAttribute:NSForegroundColorAttributeName value:JCBaseColor range:range];
                self.footView.countLab.attributedText = attrString;
            }

            
        }
    } failure:^(NSError * _Nonnull error) {
        [self endRefresh];
    }];


}

#pragma mark - Protocol
#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    if (self.matchArray.count>0) {
        
        if (self.planDetailModel.qr_code_info.url.count>0||self.planDetailModel.qr_code_info.desc>0) {
            return 5+self.matchArray.count;
        }
        return 4+self.matchArray.count;
    }
    if (self.planDetailModel.qr_code_info.url.count>0||self.planDetailModel.qr_code_info.desc>0) {
        return 5;
    }
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
        return 1;
    }
    if (self.matchArray.count>0) {

        if (section==self.matchArray.count+1) {
            return self.planDetailModel.image.count;
        }
        if (section>0&&section<self.matchArray.count+1) {
            if (self.planDetailModel.type==2) {
                //三场的时候,只有最后一个是3行,第三方是方案内容
                if (section<self.matchArray.count) {
                    return 2;
                }
            }
            return 3;
        }



        return 1;
    }else {
        if (section==1) {
            return 2;
        }
        if (section==2) {
            return self.planDetailModel.image.count;
        }
        return 1;
        
    }
    return 0;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.section==0) {
        if (self.planDetailModel.subtitle.length==0) {
            return 0.001f;
        }
        return UITableViewAutomaticDimension;
     }
    if (self.matchArray.count>0) {
        if (indexPath.section==self.matchArray.count+3) {
            if (self.planDetailModel.qr_code_info.url.count==0&&self.planDetailModel.qr_code_info.desc.length==0) {
                return 0.01f;
            }
            return UITableViewAutomaticDimension;
        }

        
        
        if (indexPath.section>0&&indexPath.section<self.matchArray.count+1) {
            //                //单场 ,模块,内容,解析
            //                // 3场, 模块 解析,内容
                            //多场     内容,解析
            JCGZHTuiJianModel *tjModel = self.matchArray[indexPath.section-1];
            if (indexPath.row==0) {
                if (self.matchArray.count>0) {
                    
                    if (self.planDetailModel.type==1||self.planDetailModel.type==2) {
                        if (tjModel.match_info.count==0) {
                            return 0.001f;
                        }
                        return tjModel.height+AUTO(20);
                    }
                    return 0.001f;
                }
                return 0.001f;


            }
            if (indexPath.row==1) {
                if (self.planDetailModel.type==1||self.planDetailModel.type==3){
                    if (self.planDetailModel.content.length==0) {
                        return 0.01f;
                    }
                    return UITableViewAutomaticDimension;
                }
                if (self.planDetailModel.type==2){
                    if (tjModel.analysis.length==0) {
                        return 0.01f;
                    }
                    return UITableViewAutomaticDimension;
                }

                return UITableViewAutomaticDimension;
            }
            if (indexPath.row==2) {
                if (self.planDetailModel.type==2){
                    if (self.planDetailModel.content.length==0) {
                        return 0.01f;
                    }

                    return UITableViewAutomaticDimension;
                }
                return UITableViewAutomaticDimension;
            }
//            JCGZHTuiJianModel *tjModel = self.matchArray[indexPath.section-1];
//            if (tjModel.analysis.length==0) {
//                return 0.01f;
//            }
//            return UITableViewAutomaticDimension;
        }
    }else {
        if (indexPath.section==1) {
            if (indexPath.row==1&&self.planDetailModel.analyse.length==0) {
                return 0.01f;
            }
        }
        return UITableViewAutomaticDimension;
    }


    return UITableViewAutomaticDimension;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        //引文
        JCPlaneDetailNewSubTitleCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCPlaneDetailNewSubTitleCell"];
        cell.planDetailModel= self.planDetailModel;
        return cell;
    }
    if (self.matchArray.count>0) {
        if (indexPath.section==self.matchArray.count+1) {
            JCPlaneDetailImageCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCPlaneDetailImageCell"];
            JCPostImageModel *imgModel =  self.planDetailModel.image[indexPath.row];
            NSString *img = imgModel.url;
            cell.img = img;
            return cell;
        }

        

        if (indexPath.section==self.matchArray.count+2) {
            JCPlaneDetailResultCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCPlaneDetailResultCell"];
            cell.planDetailModel= self.planDetailModel;
            WeakSelf;
            cell.JCBlock = ^{
                JCColumnDetailWMViewController *vc = [JCColumnDetailWMViewController new];
                vc.column_id = weakSelf.planDetailModel.column_info.id;
                [weakSelf.navigationController pushViewController:vc animated:YES];
                
            };
            return cell;
        }
        if (indexPath.section==self.matchArray.count+3) {
            JCPlaneDetailQRcodeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCPlaneDetailQRcodeCell"];
            cell.model= self.planDetailModel.qr_code_info;
            return cell;
        }


        if (self.matchArray.count>0) {
//            NSLog(@"区:%ld",indexPath.section);
            JCGZHTuiJianModel *tjModel = self.matchArray[indexPath.section-1];
            if (indexPath.section>0&&indexPath.section<self.matchArray.count+1) {
                //                //单场 ,模块,内容,解析
                //                // 3场, 模块 解析,内容
                                //多场     内容,解析
                if(self.planDetailModel.type==1||self.planDetailModel.type==3){
                    //  单场和多场相比,多场无模块
                    if (indexPath.row==0) {
                        if (self.planDetailModel.type==1) {
                            JCPlaneDetailNewMatchCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCPlaneDetailNewMatchCell"];
                            cell.tjModel= tjModel;
                            return cell;
                        }

                    }
                    if (indexPath.row==1) {
                        if (self.planDetailModel.content.length>0) {
                            JCPlaneDetailNewAnalysisCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCPlaneDetailNewAnalysisCell"];
                            cell.planDetailModel= self.planDetailModel;
                            return cell;
                        }
                    }
                    if (indexPath.row==2) {
                        JCPlaneDetailNewAnalysisCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCPlaneDetailNewAnalysisCell"];
                        cell.tjModel= tjModel;
                        return cell;
                    }
                    
                    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
                    return cell;
                    
                }
                if(self.planDetailModel.type==2){
                    // 3场, 模块 解析,内容
                    if (indexPath.row==0) {
                        JCPlaneDetailNewMatchCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCPlaneDetailNewMatchCell"];
                        cell.tjModel= tjModel;
                        return cell;
                    }


                    if (indexPath.row==1) {
                        JCPlaneDetailNewAnalysisCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCPlaneDetailNewAnalysisCell"];
                        cell.tjModel= tjModel;
                        return cell;
//                        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
//                        return cell;
                    }
                    
                    if (indexPath.row==2) {
                        if (self.planDetailModel.content.length>0) {
                            JCPlaneDetailNewAnalysisCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCPlaneDetailNewAnalysisCell"];
                            cell.planDetailModel= self.planDetailModel;
                            return cell;
                        }
                    }
                    
                    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
                    return cell;
                    
                }
//                if (indexPath.row==0) {
//                    JCGZHTuiJianModel *tjModel = self.matchArray[indexPath.section-1];
//                    if (indexPath.section==self.index+1&&tjModel.match_info.count==0) {
//                        JCPlaneDetailNewAnalysisCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCPlaneDetailNewAnalysisCell"];
//                        cell.planDetailModel= self.planDetailModel;
//                        return cell;
//                    }
//                    JCPlaneDetailNewMatchCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCPlaneDetailNewMatchCell"];
//                    cell.tjModel= tjModel;
//                    return cell;
//                }
//
//
//                JCGZHTuiJianModel *tjModel = self.matchArray[indexPath.section-1];
//                if (tjModel.analysis.length>0) {
//                    JCPlaneDetailNewAnalysisCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCPlaneDetailNewAnalysisCell"];
//                    cell.tjModel= tjModel;
//                    return cell;
//                }
            }
        }
    }else{
        if (indexPath.section==1) {
            if (indexPath.row==0) {
                if (self.planDetailModel.content.length>0) {
                    JCPlaneDetailNewAnalysisCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCPlaneDetailNewAnalysisCell"];
                    cell.planDetailModel= self.planDetailModel;
                    return cell;
                }
            }
            if (self.planDetailModel.analyse.length>0) {
                JCPlaneDetailNewAnalysisCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCPlaneDetailNewAnalysisCell"];
                cell.freeDetailModel= self.planDetailModel;
                return cell;
            }

        }
        
        if (indexPath.section==2) {
            JCPlaneDetailImageCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCPlaneDetailImageCell"];
            JCPostImageModel *imgModel =  self.planDetailModel.image[indexPath.row];
            NSString *img = imgModel.url;
            cell.img = img;
            return cell;
        }
        if (indexPath.section==3) {
            JCPlaneDetailResultCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCPlaneDetailResultCell"];
            cell.planDetailModel= self.planDetailModel;
            WeakSelf;
            cell.JCBlock = ^{
                JCColumnDetailWMViewController *vc = [JCColumnDetailWMViewController new];
                vc.column_id = weakSelf.planDetailModel.column_info.id;
                [weakSelf.navigationController pushViewController:vc animated:YES];
                
            };
            return cell;
        }
        if (indexPath.section==4) {
            JCPlaneDetailQRcodeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCPlaneDetailQRcodeCell"];
            cell.model= self.planDetailModel.qr_code_info;
            return cell;
        }
    }
    



    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    return cell;
    
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [UIView new];
    view.backgroundColor = COLOR_F4F6F9;
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section==0) {
        return AUTO(4);
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
    if (self.matchArray.count>0) {
        if (self.planDetailModel.qr_code_info.url.count>0||self.planDetailModel.qr_code_info.desc.length>0) {
            if (section==3+self.matchArray.count) {
                return 4;
            }
        }else{
            if (section==2+self.matchArray.count) {
                return 4;
            }
        }

    }else {
        if (self.planDetailModel.qr_code_info.url.count>0||self.planDetailModel.qr_code_info.desc.length>0){
            if (section==4) {
                return 4;
            }
        }else{
            if (section==3) {
                return 4;
            }
        }

    }


    return 0.001f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.section==1+self.matchArray.count) {
            NSMutableArray *datas = [NSMutableArray array];
            [self.planDetailModel.image enumerateObjectsUsingBlock:^(JCPostImageModel *object, NSUInteger idx, BOOL * _Nonnull stop) {
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
            browser.currentPage = indexPath.row;
            [browser show];
    }
//    if (self.matchArray.count>0) {
//        if(self.planDetailModel.qr_code_info.url.count>0) {
//            if (indexPath.section==3+self.matchArray.count) {
//                NSMutableArray *datas = [NSMutableArray array];
//                [self.planDetailModel.qr_code_info.url enumerateObjectsUsingBlock:^(NSString *url, NSUInteger idx, BOOL * _Nonnull stop) {
//    //                    JCImgCollectionViewCell *cell = (JCImgCollectionViewCell *)[collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:idx inSection:0]];
//            //        // 网络图片
//                    YBIBImageData *data = [YBIBImageData new];
//                    data.imageURL = [NSURL URLWithString:url];
//            //        data.projectiveView = cell.imgView;
//                    [datas addObject:data];
//                }];
//
//
//                YBImageBrowser *browser = [YBImageBrowser new];
//                browser.shouldHideStatusBar = NO;
//                browser.dataSourceArray = datas;
////                browser.currentPage = indexPath.row;
//                [browser show];
//
//            }
//    }
//        
//    }

}

- (void)showBigImage:(NSArray *)imgArray {
    NSMutableArray *datas = [NSMutableArray array];
    [imgArray enumerateObjectsUsingBlock:^(UIImage *_Nonnull img, NSUInteger idx, BOOL * _Nonnull stop) {

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


- (JCFootBallBuyPlaneFootView *)footView {
    if (!_footView) {
        _footView = [JCFootBallBuyPlaneFootView new];
    }
    return _footView;
}

- (NSInteger)index {
    if (!_index) {
        JCGZHTuiJianModel *lastModel;
        for (int i=0; i<self.matchArray.count; i++) {
            JCGZHTuiJianModel *model = self.matchArray[i];
            if ([model.show integerValue]==0) {
                model.match_info = @[];
                if (self.matchArray.count>1) {
                    if (i==0) {
                        if (model.analysis.length==0) {
                            model.analysis = self.planDetailModel.analyse;
                        }
                       
                    }
                }
               

            }
            if (lastModel&&lastModel.match_info.count>0&&model.match_info.count==0) {
                _index = i;
                break;
            }
            lastModel = model;
        }
    }
    return _index;
}
@end
