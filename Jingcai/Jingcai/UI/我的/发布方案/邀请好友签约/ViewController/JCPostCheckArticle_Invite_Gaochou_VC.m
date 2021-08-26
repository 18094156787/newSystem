//
//  JCPostCheckArticle_Invite_Gaochou_VC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/7/1.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCPostCheckArticle_Invite_Gaochou_VC.h"
#import "JCWithDrawRecordItemCell.h"
#import "JCPostCheckRuleHeadView.h"
#import "JCPostCheckRuleTitleView.h"
#import "JCPostCheckArticle_Invite_Gaochou_HeadView.h"
#import "JCBaseTitleAlertView.h"
#import "JCInviteConfigGaoChouModel.h"
#import "JCPostCheckArticle_Invite_Gaochou_FootView.h"
@interface JCPostCheckArticle_Invite_Gaochou_VC ()

@property (nonatomic,strong) JCPostCheckArticle_Invite_Gaochou_HeadView *headView;

@property (nonatomic,strong) JCPostCheckArticle_Invite_Gaochou_FootView *footView;

@property (nonatomic,strong) NSArray *titleArray;

@property (nonatomic,strong) UIView *bottomView;

@property (nonatomic,strong) UIButton *cancelBtn;

@property (nonatomic,strong) UIButton *surelBtn;

@property (nonatomic,strong) UIButton *agreeBtn;

@property (nonatomic,strong) JCInviteConfigGaoChouModel *model;

@property (nonatomic,strong) NSString *headUrl;

@property (nonatomic,strong) NSString *idCardUrl;

@property (nonatomic,assign) BOOL uploadHeadImg;

@property (nonatomic,assign) BOOL uploadIdCardImg;

@end

@implementation JCPostCheckArticle_Invite_Gaochou_VC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
    [self setNavBackImg];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"确认稿酬信息";
    [self initView];
    [self refreshData];
}

- (void)refreshData {
    [self.view showLoading];
    JCUserService_New *service = [JCUserService_New service];
    [service getInviteExpertWithGaoChouDetaillWithInviter_id:[JCWUserBall currentUser].inviter_id Config_id:[JCWUserBall currentUser].config_id success:^(id  _Nullable object) {
        [self.view endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            JCInviteConfigGaoChouModel *model = (JCInviteConfigGaoChouModel *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCInviteConfigGaoChouModel class]];
            self.model = model;
            [self.tableView reloadData];
        }
    } failure:^(NSError * _Nonnull error) {
        [self.view endLoading];
    }];


}

- (void)initView {
    self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(105));
    self.tableView.tableHeaderView = self.headView;
    
    self.footView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(120));
    self.tableView.tableFooterView = self.footView;
    self.agreeBtn = self.footView.agreeBtn;
    
    self.tableView.backgroundColor = COLOR_F0F0F0;
//    self.tableView.separatorStyle = 0;
    self.tableView.estimatedRowHeight = 100;
    [self.tableView registerClass:[JCWithDrawRecordItemCell class] forCellReuseIdentifier:@"JCWithDrawRecordItemCell"];

    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.left.right.equalTo(self.view);
        make.bottom.offset(-kBottomTabSafeAreaHeight-AUTO(80));
    }];
    
    [self.view addSubview:self.bottomView];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.tableView.mas_bottom);
        make.height.mas_equalTo(AUTO(80));
    }];
    
//    [self.bottomView addSubview:self.cancelBtn];
//    [self.cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(self.bottomView.mas_centerX).offset(AUTO(-15));
//        make.centerY.equalTo(self.bottomView);
//        make.size.mas_equalTo(CGSizeMake(AUTO(128), AUTO(44)));
//    }];
    
    [self.bottomView addSubview:self.surelBtn];
    [self.surelBtn mas_makeConstraints:^(MASConstraintMaker *make) {

        
        make.bottom.offset(-kBottomTabSafeAreaHeight-AUTO(10));
        make.left.offset(AUTO(50));
        make.right.offset(AUTO(-50));
        make.height.mas_equalTo(AUTO(44));
    }];

}

#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {


    if (indexPath.section==0) {
        JCWithDrawRecordItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCWithDrawRecordItemCell"];
        cell.selectionStyle = 0;
        cell.showAttr = NO;
        cell.contentLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(14)];
        cell.titleLabel.text = self.titleArray[indexPath.row];
        if (indexPath.row==0&&[self.model.base_pay floatValue]>0) {
            cell.contentLabel.text = [NSString stringWithFormat:@"%@元",self.model.base_pay];
            return cell;
        }
        if (indexPath.row==1&&[self.model.basic_remuneration floatValue]>0) {
            cell.contentLabel.text = [NSString stringWithFormat:@"%@元/篇 (每日前%@篇)",self.model.basic_remuneration,self.model.basic_remuneration_page];
            return cell;
        }
        if (indexPath.row==2&&[self.model.ios_commission floatValue]>0) {
            cell.contentLabel.text = [NSString stringWithFormat:@"%@%%",self.model.ios_commission];
            return cell;
        }
        if (indexPath.row==3&&[self.model.android_commission floatValue]>0) {
            cell.contentLabel.text = [NSString stringWithFormat:@"%@%%",self.model.android_commission];
            return cell;
        }
        if (indexPath.row==4&&[self.model.h_commission floatValue]>0) {

            cell.contentLabel.text = [NSString stringWithFormat:@"%@%%",self.model.h_commission];
            return cell;
        }
        if (indexPath.row==5&&[self.model.pc_commission floatValue]>0) {

            cell.contentLabel.text = [NSString stringWithFormat:@"%@%%",self.model.pc_commission];
            return cell;
        }
        if (indexPath.row==6&&[self.model.full_work_attendance floatValue]>0) {
            cell.contentLabel.text = [NSString stringWithFormat:@"%@元",self.model.full_work_attendance];
            return cell;
        }
        

    }

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    return cell;

}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        if (indexPath.row==0&&[self.model.base_pay floatValue]==0) {
            return 0;
        }
        if (indexPath.row==1&&[self.model.basic_remuneration floatValue]==0) {
            return 0;
        }
        if (indexPath.row==2&&[self.model.ios_commission floatValue]==0) {
            return 0;
        }
        if (indexPath.row==3&&[self.model.android_commission floatValue]==0) {
            return 0;
        }
        if (indexPath.row==4&&[self.model.h_commission floatValue]==0) {

            return 0;
        }
        if (indexPath.row==5&&[self.model.pc_commission floatValue]==0) {

            return 0;
        }
        if (indexPath.row==6&&[self.model.full_work_attendance floatValue]==0) {
            return 0;
        }
    }
    return UITableViewAutomaticDimension;
}



- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.0001;
}


- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {

    UIView *backView= [UIView new];
    backView.backgroundColor = COLOR_F0F0F0;
    return backView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
}



- (void)cancelBtnClick {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)submitBtnClick {
    if (!self.agreeBtn.selected) {
        [JCWToastTool showHint:@"请勾选同意稿酬配置信息"];
        return;
    }

    
    if (!self.headImg&&!self.idcard_image) {
        [self postFinal];
        return;
    }
    [self uploadHeadImage];
    [self uploadIdcardImage];
}

- (void)uploadHeadImage {
    if (!self.headImg) {
         self.uploadHeadImg = YES;
        self.headUrl = self.checkDetailModel.user_avater;
//        self.headUrl = self.checkDetailModel.user_avater;
//        [self configUploadImageStatus];
        return;
    }
    
    if (self.checkDetailModel&&!self.checkDetailModel.isNewHeadImg) {
        self.uploadHeadImg = YES;
        self.headUrl = self.checkDetailModel.user_avater;
        [self configUploadImageStatus];
        return;
    }
//     [self.view showLoading];
    [SVProgressHUD show];
    
    JCUserService_New * service = [JCUserService_New service];
    [service uploadAvatarWithImage:self.headImg type:@"2" success:^(id  _Nullable object) {
        [self endRefresh];
        [SVProgressHUD dismiss];
       if ([JCWJsonTool isSuccessResponse:object]) {
           if (object[@"data"]) {
//               NSString *file_path = object[@"data"][@"file_path"];
               NSString *image_id = [NSString stringWithFormat:@"%@",object[@"data"][@"image_id"]];
               
               self.headUrl = image_id;
               NSLog(@"用户头像:%@",self.headUrl);
               self.uploadHeadImg = YES;
               [self configUploadImageStatus];
               
           }
       }else{
 
            [JCWToastTool showHint:@"图片上传失败"];
       }

    } failure:^(NSError * _Nonnull error) {
        [SVProgressHUD dismiss];
        [self endRefresh];
    }];
    



}

- (void)uploadIdcardImage {
    if (!self.idcard_image) {
        self.uploadIdCardImg = YES;
//        [self configUploadImageStatus];
        return;
    }
    if (self.checkDetailModel&&!self.checkDetailModel.isNewIDCard) {
        self.uploadIdCardImg = YES;
        self.idCardUrl = self.checkDetailModel.idcard_image;
        [self configUploadImageStatus];
        return;
    }

    
//     [self.view showLoading];
//    [SVProgressHUD show];
    JCUserService_New * service = [JCUserService_New service];
    [service uploadAvatarWithImage:self.idcard_image type:@"2" success:^(id  _Nullable object) {
        [self endRefresh];
//        [SVProgressHUD dismiss];
       if ([JCWJsonTool isSuccessResponse:object]) {
           if (object[@"data"]) {
               NSString *image_id = [NSString stringWithFormat:@"%@",object[@"data"][@"image_id"]];
               
               self.idCardUrl = image_id;
               NSLog(@"用户头像:%@",self.headUrl);
               self.uploadIdCardImg = YES;
               [self configUploadImageStatus];

               
           }
       }else{
 
            [JCWToastTool showHint:@"图片上传失败"];
       }

    } failure:^(NSError * _Nonnull error) {
        [SVProgressHUD dismiss];
        [self endRefresh];
    }];



}



- (void)postFinal {
//    [self.view showLoading];
  
 
    if (!self.headImg&&self.checkDetailModel.user_avater.length==0) {
        //没有修改头像
        self.headUrl = @"0";
    }
    if (!self.headImg&&[self.checkDetailModel.user_avater integerValue]==0) {
        //没有修改头像
        self.headUrl = @"0";
    }


    [SVProgressHUD show];

    NSString *idcard = [JCWAppTool getRSA_String:NonNil(self.idcard)];
    NSString *phone = [JCWAppTool getRSA_String:NonNil(self.phone)];
    NSDictionary *dataDic = @{@"name":NonNil(self.name),@"phone":NonNil(phone),@"idcard":NonNil(idcard),@"idcard_image":NonNil(self.idCardUrl),@"user_name":NonNil(self.nickName),@"user_avater":NonNil(self.headUrl),@"user_desc":NonNil(self.introduce),@"inviter_id":NonNil([JCWUserBall currentUser].inviter_id),@"config_id":NonNil([JCWUserBall currentUser].config_id)};
    NSLog(@"签约参数%@",dataDic);
    [SVProgressHUD show];
    JCUserService_New * service = [JCUserService_New service];
    [service getApplyQy_PostFinalWithParamDic:dataDic success:^(id  _Nullable object) {
        [SVProgressHUD dismiss];
        if ([JCWJsonTool isSuccessResponse:object]) {
          JCWUserBall *user =  [JCWUserBall currentUser];
//            user.top = @"3";
            [JCWUserBall save:user];
            [[NSNotificationCenter defaultCenter] postNotificationName:NotificationApplyExpertSuccess object:nil];
            [JCWToastTool showHint:@"提交成功"];
            [self.navigationController popToRootViewControllerAnimated:YES];
        }else{

             [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [SVProgressHUD dismiss];

        [self endRefresh];
         [JCWToastTool showHint:@"网络异常"];
    }];

    
}
 

- (void)configUploadImageStatus{
    //如果是全民竞猜签约资格的,则不需要帖子,只要头像和身份证
    if (self.uploadHeadImg&&self.uploadIdCardImg) {
        [self postFinal];
    }
    

}


- (JCPostCheckArticle_Invite_Gaochou_HeadView *)headView {
    if (!_headView) {
        _headView = [JCPostCheckArticle_Invite_Gaochou_HeadView new];
    }
    return _headView;
}



- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@"基本工资",@"基础稿酬",@"iOS端提成",@"安卓端提成",@"H5端提成",@"网页端提成",@"满勤奖"];
    }
    return _titleArray;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [UIView new];
        _bottomView.backgroundColor = COLOR_F0F0F0;
    }
    return _bottomView;
}
- (UIButton *)cancelBtn {
    if (!_cancelBtn) {
        _cancelBtn = [UIButton initWithText:@"上一步" FontSize:AUTO(16) Weight:1 BackGroundColor:JCWhiteColor TextColors:JCBaseColor];
        _cancelBtn.layer.borderColor = JCBaseColor.CGColor;
        _cancelBtn.layer.borderWidth = 1;
        _cancelBtn.layer.cornerRadius = AUTO(22);
        _cancelBtn.layer.masksToBounds = YES;
        [_cancelBtn addTarget:self action:@selector(cancelBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelBtn;
}

- (UIButton *)surelBtn {
    if (!_surelBtn) {
        _surelBtn = [UIButton initWithText:@"提交审核(4/4)" FontSize:AUTO(16) Weight:1 BackGroundColor:JCBaseColor TextColors:JCWhiteColor];
        [_surelBtn hg_setAllCornerWithCornerRadius:AUTO(22)];
        [_surelBtn addTarget:self action:@selector(submitBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _surelBtn;
}
- (JCPostCheckArticle_Invite_Gaochou_FootView *)footView {
    if (!_footView) {
        _footView = [JCPostCheckArticle_Invite_Gaochou_FootView new];
    }
    return _footView;
}
@end
