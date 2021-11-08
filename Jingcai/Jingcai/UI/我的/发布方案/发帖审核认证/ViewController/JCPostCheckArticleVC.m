//
//  JCPostCheckArticleVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/23.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCPostCheckArticleVC.h"
#import "JCPostCheckArticleHeadImgCell.h"
#import "JCPostCheckUserInfoCell.h"
#import "JCPostCheckArticleIntroduceCell.h"
#import "JCPostCheckArticleInfoCell.h"
#import "JCPostCheckArticleTitleView.h"
#import "JCPostCheckArticleaAddFootView.h"
#import "JCPostCheckPlanVC.h"
#import "JCWPhotoTool.h"
#import "JCPostCheckArticleFootView.h"
#import "JCPostCheckUserInfo_Horizontal_Cell.h"
#import "JCPostPlanMatchTypeSelecView.h"
#import "JCPostPlanVC.h"
#import "JCPostCheckCountInfoCell.h"
#import "JCCommomSelectView.h"
#import "TZImagePickerController.h"
#import "JCMyPostCheckTuiJianModel.h"
@interface JCPostCheckArticleVC ()<TZImagePickerControllerDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic, strong) UIImagePickerController *imagePickerVc;

@property (nonatomic,strong) NSArray *titleArray;

@property (nonatomic,strong) UIButton *submitBtn;

@property (nonatomic,strong) UIImageView *headImgView;

@property (nonatomic,strong) JCPostCheckPlanVC *articleVC1;

@property (nonatomic,strong) JCPostCheckPlanVC *articleVC2;

@property (nonatomic,strong) NSString *nickName;

@property (nonatomic,strong) UIImage *headImg;// 头像

@property (nonatomic,strong) NSString *introduce;

//@property (nonatomic,strong) NSString *idcard;//身份证
//
//@property (nonatomic,strong) NSString *account;//申请理由

@property (nonatomic,assign) BOOL nickName_isRight;

@property (nonatomic,assign) BOOL headImg_isRight;// 头像

@property (nonatomic,assign) BOOL introduce_isRight;//简介

@property (nonatomic,assign) BOOL postInfo1_isRight;

@property (nonatomic,assign) BOOL postInfo2_isRight;

@property (nonatomic,strong) NSMutableDictionary *postData1;

@property (nonatomic,strong) NSMutableDictionary *postData2;

@property (nonatomic,strong) NSString *headUrl;

@property (nonatomic,strong) NSString *idCardUrl;

@property (nonatomic,assign) BOOL uploadHeadImg;

@property (nonatomic,assign) BOOL uploadIdCardImg;

@property (nonatomic,strong) NSMutableArray *postImgArray1;

@property (nonatomic,strong) NSMutableArray *postImgArray2;

@property (nonatomic,assign) NSInteger fang_an_1;

@property (nonatomic,assign) NSInteger fang_an_2;

@property (nonatomic,strong) JCMyPostCheckTuiJianModel *fang_an_1_model;

@property (nonatomic,strong) JCMyPostCheckTuiJianModel *fang_an_2_model;

@end

@implementation JCPostCheckArticleVC

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
    self.title = @"填写个人信息";
    self.view.backgroundColor = COLOR_F0F0F0;
    [self initView];
    [self myCheckDetail];//重新编辑

}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self configUserHeadImgView];
}



- (void)myCheckDetail {
    if (!self.checkDetailModel) {
        return;
    }
    [self.headImgView sd_setImageWithURL:[NSURL URLWithString:self.checkDetailModel.user_avater_url] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        self.headImg = image;
        [self.tableView reloadData];
    }];
    self.headUrl = self.checkDetailModel.user_avater;
    self.nickName = self.checkDetailModel.user_name;
    self.nickName_isRight =(self.nickName.length>1&&self.nickName.length<=8);
    self.introduce = self.checkDetailModel.user_desc;
    self.introduce_isRight = self.introduce.length>=15;
    self.fang_an_1_model = self.checkDetailModel.fang_an_1;
    self.fang_an_1_model.tuijian_id = self.fang_an_1_model.id;
    self.fang_an_2_model = self.checkDetailModel.fang_an_2;
    self.fang_an_2_model.tuijian_id = self.fang_an_2_model.id;

    if (!self.checkDetailModel.fang_an_1&&!self.checkDetailModel.fang_an_2) {
        self.isJingcai = YES;
    }
    

    [self configData];
    [self.tableView reloadData];
}

- (void)initView {
    self.tableView.estimatedRowHeight = 100;
    self.tableView.separatorStyle = 0 ;
    self.tableView.separatorColor = COLOR_DDDDDD;
    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(8));
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-AUTO(70)-kBottomTabSafeAreaHeight);
//        if (@available(iOS 11.0, *)) {
//            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom).offset(-AUTO(70)-kBottomTabSafeAreaHeight);
//        } else {
//            make.bottom.equalTo(self.view).offset(-AUTO(70)-kBottomTabSafeAreaHeight);
//            // Fallback on earlier versions
//        }
    }];
    JCPostCheckArticleFootView *footView = [JCPostCheckArticleFootView new];
    footView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(110));
    self.tableView.tableFooterView = footView;
    
    UIView *bgView = [UIView new];
    bgView.backgroundColor = JCWhiteColor;
    [self.view addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(0);
        make.left.right.offset(0);
        make.height.mas_equalTo(AUTO(70)+kBottomTabSafeAreaHeight);
    }];
    
    [self.view addSubview:self.submitBtn];
    [self.submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(-kBottomTabSafeAreaHeight-AUTO(10));
        make.left.offset(AUTO(50));
        make.right.offset(AUTO(-50));
        make.height.mas_equalTo(AUTO(44));
    }];

//    self.tableView.separatorStyle = 0;
    self.tableView.estimatedRowHeight = 100;
    
    [self.tableView registerClass:[JCPostCheckArticleHeadImgCell class] forCellReuseIdentifier:@"JCPostCheckArticleHeadImgCell"];
    [self.tableView registerClass:[JCPostCheckUserInfoCell class] forCellReuseIdentifier:@"JCPostCheckUserInfoCell"];
    [self.tableView registerClass:[JCPostCheckArticleIntroduceCell class] forCellReuseIdentifier:@"JCPostCheckArticleIntroduceCell"];
    [self.tableView registerClass:[JCPostCheckArticleInfoCell class] forCellReuseIdentifier:@"JCPostCheckArticleInfoCell"];
    [self.tableView registerClass:[JCPostCheckUserInfo_Horizontal_Cell class] forCellReuseIdentifier:@"JCPostCheckUserInfo_Horizontal_Cell"];
    [self.tableView registerClass:[JCPostCheckCountInfoCell class] forCellReuseIdentifier:@"JCPostCheckCountInfoCell"];
    
    
    
    WeakSelf;
    self.articleVC1.JCDataBlock = ^(JCMyPostCheckTuiJianModel * _Nonnull model) {
        weakSelf.fang_an_1_model = model;
        [weakSelf.tableView reloadData];
    };
    
    self.articleVC2.JCDataBlock = ^(JCMyPostCheckTuiJianModel * _Nonnull model) {
        weakSelf.fang_an_2_model = model;
        [weakSelf.tableView reloadData];
    };
    


}

#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (self.isJingcai) {
        return 2;
    }
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
        return self.titleArray.count;
    }
    if (section==1) {
        return 1;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            JCPostCheckArticleHeadImgCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCPostCheckArticleHeadImgCell"];
            cell.titleLab.text = self.titleArray[indexPath.row];
            cell.lineView.hidden = NO;
            self.headImgView =  cell.imgView;
            [self configUserHeadImgView];
            return cell;
        }
        WeakSelf;
        JCPostCheckUserInfo_Horizontal_Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCPostCheckUserInfo_Horizontal_Cell"];
        cell.selectionStyle = 0;
        cell.errorInfoView.hidden = YES;
        cell.errorInfoLab.text = @"请输入正确的名称";
        cell.titleLab.text = self.titleArray[indexPath.row];
        cell.contentTF.placeholder = @"请输入名称";
        cell.contentTF.text = self.nickName;
        cell.errorInfoView.hidden = self.nickName_isRight;

        [cell.contentTF.rac_textSignal subscribeNext:^(id x) {
            if (cell.contentTF.text.length > 8&&![weakSelf.nickName isEqualToString:[JCWUserBall currentUser].user_name]) {
                cell.contentTF.text = [ cell.contentTF.text substringToIndex:8];
            }
            
        }];
        [[cell.contentTF rac_signalForControlEvents:UIControlEventEditingDidEnd] subscribeNext:^(id x) {
            cell.contentTF.text =  [cell.contentTF.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
            weakSelf.nickName_isRight =(cell.contentTF.text.length>1&&cell.contentTF.text.length<=8);
            cell.errorInfoView.hidden = weakSelf.nickName_isRight;
            weakSelf.nickName = cell.contentTF.text;
            [weakSelf configData];
        }];
        
        
        return cell;
    }
    if (indexPath.section==1) {
        JCPostCheckArticleIntroduceCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCPostCheckArticleIntroduceCell"];
        cell.selectionStyle = 0;
        cell.errorInfoView.hidden = YES;
        cell.contentTV.text = self.introduce;
        WeakSelf;
        [cell.contentTV.rac_textSignal subscribeNext:^(id x) {
            
            if (cell.contentTV.text.length > 100) {
                cell.contentTV.text = [ cell.contentTV.text substringToIndex:100];
            }
            weakSelf.introduce_isRight = cell.contentTV.text.length>=20;
            cell.errorInfoView.hidden = weakSelf.introduce_isRight;
            cell.countLab.text = [NSString stringWithFormat:@"%ld/100",cell.contentTV.text.length];
            weakSelf.introduce = cell.contentTV.text;
            [weakSelf configData];
        }];
        return cell;
    }
    if (indexPath.section==4) {
        JCPostCheckCountInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCPostCheckCountInfoCell"];
        return cell;
    }
    
    JCPostCheckArticleInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCPostCheckArticleInfoCell"];
    if (indexPath.section==2) {
        cell.model = self.fang_an_1_model;
    }
    if (indexPath.section==3) {
        cell.model = self.fang_an_2_model;
    }
    cell.selectionStyle = 0;

    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            return AUTO(80);
        }
        return AUTO(60);
    }
    if (indexPath.section==1) {
        return AUTO(170);
    }
    if (indexPath.section==4) {
        return AUTO(25);
    }
    return UITableViewAutomaticDimension;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section>1&&section<4) {
        JCPostCheckArticleTitleView *headView = [JCPostCheckArticleTitleView new];

        WeakSelf;
        if (section==2) {
            headView.titleLab.text = @"原创达人方案帖1";
            headView.editView.hidden = self.fang_an_1_model?NO:YES;
            
            [headView.editView bk_whenTapped:^{
                if (weakSelf.fang_an_1_model) {
                    weakSelf.articleVC1.checkVC = weakSelf;
                    weakSelf.articleVC1.type = weakSelf.fang_an_1_model.classfly;
                    weakSelf.articleVC1.model = weakSelf.fang_an_1_model;
                    weakSelf.articleVC1.tuijian_id = weakSelf.fang_an_1_model.tuijian_id;
 
                }
                [weakSelf.navigationController pushViewController:weakSelf.articleVC1 animated:YES];
            }];
        }
        if (section==3) {
            headView.titleLab.text = @"原创达人方案帖2";
            headView.editView.hidden = self.fang_an_2_model?NO:YES;

            [headView.editView bk_whenTapped:^{
                if (weakSelf.fang_an_2_model) {
                    weakSelf.articleVC2.checkVC = weakSelf;
                    weakSelf.articleVC2.type = weakSelf.fang_an_2_model.classfly;
                    weakSelf.articleVC2.model = weakSelf.fang_an_2_model;
                    weakSelf.articleVC2.tuijian_id = weakSelf.fang_an_2_model.tuijian_id;

                }
                [weakSelf.navigationController pushViewController:weakSelf.articleVC2 animated:YES];
            }];
        }
        return headView;
    }
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section>1&&section<4) {
        return AUTO(50);
    }
    return 0.001f;
}



- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {

    if (section<2) {
        if (self.isJingcai&&section==1) {
            return 0.001f;
        }
        return AUTO(8);

    }
    if (section==2) {
        if (self.fang_an_1_model) {
            return 0.001f;;
        }
        return AUTO(60);
    }
    if (section==3) {
        if (self.fang_an_2_model) {
            return 0.001f;;
        }
        return AUTO(60);
    }
    
    return 0.001f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (section>1&&section<4) {
        if (section==2&&self.fang_an_1_model) {
            return [UIView new];
        }
        if (section==3&&self.fang_an_2_model) {
            return [UIView new];
        }
        
        
        JCPostCheckArticleaAddFootView *footView = [JCPostCheckArticleaAddFootView new];
        [footView.postBtn setTitle:@"+添加原创达人方案" forState:0];
        if (section==2) {
            footView.backgroundColor = COLOR_F4F6F9;
        }
        if (section==3) {
            footView.backgroundColor = JCWhiteColor;
        }
        WeakSelf;
        [footView.postBtn bk_whenTapped:^{

            
            JCPostPlanMatchTypeSelecView *view = [JCPostPlanMatchTypeSelecView new];
            view.isAddArticle = YES;
            view.fbCountLab.hidden = YES;
            view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
            
            view.JCPushVCBlick = ^(NSString * _Nonnull type) {
                if (section==2) {
                    weakSelf.articleVC1.checkVC = weakSelf;
                    weakSelf.articleVC1.type= type;
                    [weakSelf.navigationController pushViewController:weakSelf.articleVC1 animated:YES];
                }
                if (section==3) {
    //                    @strongify(self);
                    weakSelf.articleVC2.checkVC = weakSelf;
                    weakSelf.articleVC2.type= type;
                    [weakSelf.navigationController pushViewController:weakSelf.articleVC2 animated:YES];
                }
            };
            [[UIApplication sharedApplication].keyWindow addSubview:view];
        }];
        return footView;
    }
    UIView *backView= [UIView new];
    backView.backgroundColor = COLOR_F4F6F9;
    return backView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0&&indexPath.row==0) {
        [self iconImageViewClick];
    }
}

#pragma mark 逻辑判断相关代码

- (void)iconImageViewClick {
    WeakSelf;

    JCCommomSelectView *selectView = [[JCCommomSelectView alloc] initWithTitle:@"选择图片"];
    selectView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    selectView.dataArray = @[@"拍照",@"从相册选择"];
    selectView.JCTitleBlock = ^(NSString * _Nonnull title, NSInteger index) {
        if (index == 0) { // take photo / 去拍照
            [self takePhoto];
//            dispatch_async(dispatch_get_main_queue(), ^{
//                  [TakePhotoUtilShare takePicture:UIImagePickerControllerSourceTypeCamera];
//            });
        }
        else if (index == 1) {
            dispatch_async(dispatch_get_main_queue(), ^{
                 [self pushTZImagePickerController];
            });
           
        }

    };
    [[UIApplication sharedApplication].keyWindow addSubview:selectView];
    [selectView show];
}





- (void)submitBtnClick {
    NSString *introduce = [self.introduce stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (introduce.length<20) {
        [JCWToastTool showHint:@"您输入的申请专家纯文本内容不足20字，请重新输入！"];
        return;
    }
    
    
    if (!self.headImg&&!self.idcard_image) {
        [self postFinal];
        return;
    }
    [self uploadHeadImage];
    [self uploadIdcardImage];
}


- (void)configData {
    
    
        BOOL nickName_isRight = (self.nickName.length>1);
        BOOL introduce_isRight = (self.introduce.length>=20);
    
//    self.submitBtn.backgroundColor = JCBaseColor;
//    self.submitBtn.userInteractionEnabled = YES;
//    return;
    
    if (self.isJingcai) {
        if (nickName_isRight&&introduce_isRight) {
            self.submitBtn.backgroundColor = JCBaseColor;
            self.submitBtn.userInteractionEnabled = YES;
        }else{
            self.submitBtn.backgroundColor = COLOR_9F9F9F;
            self.submitBtn.userInteractionEnabled = NO;
        }

    }else {
        if (nickName_isRight&&introduce_isRight&&self.fang_an_1_model&&self.fang_an_2_model) {
            self.submitBtn.backgroundColor = JCBaseColor;
            self.submitBtn.userInteractionEnabled = YES;
        }else{
            self.submitBtn.backgroundColor = COLOR_9F9F9F;
            self.submitBtn.userInteractionEnabled = NO;
        }
    }
    

}

- (void)uploadHeadImage {
    if (!self.headImg) {
         self.uploadHeadImg = YES;
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
//    [SVProgressHUD show];
    
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
    [SVProgressHUD show];
 
    if (!self.headImg&&self.checkDetailModel.user_avater.length==0) {
        //没有修改头像
        self.headUrl = @"0";
    }
    if (!self.headImg&&[self.checkDetailModel.user_avater integerValue]==0) {
        //没有修改头像
        self.headUrl = @"0";
    }



//    self.fang_an_1 = 179;
    if (self.fang_an_1_model) {
        self.fang_an_1 = [self.fang_an_1_model.tuijian_id integerValue];
    }
    if (self.fang_an_2_model) {
        self.fang_an_2 = [self.fang_an_2_model.tuijian_id integerValue];
        
    }
    NSString *idcard = [JCWAppTool getRSA_String:NonNil(self.idcard)];
    NSString *phone = [JCWAppTool getRSA_String:NonNil(self.phone)];
    NSDictionary *dataDic = @{@"name":NonNil(self.name),@"phone":NonNil(phone),@"idcard":NonNil(idcard),@"idcard_image":NonNil(self.idCardUrl),@"account":NonNil(self.account),@"user_name":NonNil(self.nickName),@"user_avater":NonNil(self.headUrl),@"user_desc":NonNil(self.introduce),@"tuijian_one":@(self.fang_an_1),@"tuijian_two":@(self.fang_an_2)};
    NSLog(@"签约参数%@",dataDic);
    [SVProgressHUD show];
    JCUserService_New * service = [JCUserService_New service];
    [service getApplyQy_PostFinalWithParamDic:dataDic success:^(id  _Nullable object) {
        [SVProgressHUD dismiss];
        if ([JCWJsonTool isSuccessResponse:object]) {
          JCWUserBall *user =  [JCWUserBall currentUser];
            user.top = @"3";
            [JCWUserBall save:user];
            [[NSNotificationCenter defaultCenter] postNotificationName:NotificationApplyExpertSuccess object:nil];
            [JCWToastTool showHint:@"提交成功"];
            [self.navigationController popToRootViewControllerAnimated:YES];
        }else{
            [self resetStatus];
            
             [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [SVProgressHUD dismiss];
        [self resetStatus];
        [self endRefresh];
         [JCWToastTool showHint:@"网络异常"];
    }];

    
}
 

- (void)configUploadImageStatus{
    if (self.isJingcai) {
        //如果是全民竞猜签约资格的,则不需要帖子,只要头像和身份证
        if (self.uploadHeadImg&&self.uploadIdCardImg) {
            [self postFinal];
        }
    }else{
        if (self.uploadHeadImg&&self.uploadIdCardImg) {
            [self postFinal];
        }
    }
    

}

- (void)resetStatus {
    self.uploadHeadImg = NO;
    self.uploadIdCardImg = NO;
}

- (void)configUserHeadImgView {
    if (self.checkDetailModel.user_avater_url.length>0&&self.headImg) {
        self.headImgView.image = self.headImg;
    }

    if (self.checkDetailModel.user_avater_url.length>0&&!self.headImg) {
        [self.headImgView sd_setImageWithURL:[NSURL URLWithString:self.checkDetailModel.user_avater_url] placeholderImage:JCIMAGE(@"userImg_default")];
    }else {
        if (self.headImg) {
            self.headImgView.image = self.headImg;

        }else{
            [self.headImgView sd_setImageWithURL:[NSURL URLWithString:[JCWUserBall currentUser].user_img] placeholderImage:JCIMAGE(@"userImg_default")];
        }
    }

}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    if ([picker isKindOfClass:[UIImagePickerController class]]) {
        [picker dismissViewControllerAnimated:YES completion:nil];
    }
}

#pragma mark  TZImagePickerController相关

- (void)pushTZImagePickerController {

    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 columnNumber:4 delegate:self pushPhotoPickerVc:YES];
    // imagePickerVc.barItemTextColor = [UIColor blackColor];
    // [imagePickerVc.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]}];
    // imagePickerVc.navigationBar.tintColor = [UIColor blackColor];
    // imagePickerVc.naviBgColor = [UIColor whiteColor];
    // imagePickerVc.navigationBar.translucent = NO;
    
#pragma mark - 五类个性化设置，这些参数都可以不传，此时会走默认设置
    imagePickerVc.isSelectOriginalPhoto = NO;
    
//    if (self.maxCountTF.text.integerValue > 1) {
//        // 1.设置目前已经选中的图片数组
//        imagePickerVc.selectedAssets = _selectedAssets; // 目前已经选中的图片数组
//    }
    imagePickerVc.allowTakePicture = NO; // 在内部显示拍照按钮
    imagePickerVc.allowTakeVideo = NO;   // 在内部显示拍视频按
    imagePickerVc.videoMaximumDuration = 10; // 视频最大拍摄时间
    [imagePickerVc setUiImagePickerControllerSettingBlock:^(UIImagePickerController *imagePickerController) {
        imagePickerController.videoQuality = UIImagePickerControllerQualityTypeHigh;
    }];
    // imagePickerVc.autoSelectCurrentWhenDone = NO;
    
    // imagePickerVc.photoWidth = 1600;
    // imagePickerVc.photoPreviewMaxWidth = 1600;
    
    // 2. Set the appearance
    // 2. 在这里设置imagePickerVc的外观
    // imagePickerVc.navigationBar.barTintColor = [UIColor greenColor];
    // imagePickerVc.oKButtonTitleColorDisabled = [UIColor lightGrayColor];
    // imagePickerVc.oKButtonTitleColorNormal = [UIColor greenColor];
    // imagePickerVc.navigationBar.translucent = NO;
    imagePickerVc.iconThemeColor = [UIColor colorWithRed:31 / 255.0 green:185 / 255.0 blue:34 / 255.0 alpha:1.0];
    imagePickerVc.showPhotoCannotSelectLayer = YES;
    imagePickerVc.cannotSelectLayerColor = [[UIColor whiteColor] colorWithAlphaComponent:0.8];
    /*
    [imagePickerVc setPhotoPickerPageUIConfigBlock:^(UICollectionView *collectionView, UIView *bottomToolBar, UIButton *previewButton, UIButton *originalPhotoButton, UILabel *originalPhotoLabel, UIButton *doneButton, UIImageView *numberImageView, UILabel *numberLabel, UIView *divideLine) {
        [doneButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    }];
     */
    /*
    [imagePickerVc setAssetCellDidSetModelBlock:^(TZAssetCell *cell, UIImageView *imageView, UIImageView *selectImageView, UILabel *indexLabel, UIView *bottomView, UILabel *timeLength, UIImageView *videoImgView) {
        cell.contentView.clipsToBounds = YES;
        cell.contentView.layer.cornerRadius = cell.contentView.tz_width * 0.5;
    }];
     */
    
    // 3. Set allow picking video & photo & originalPhoto or not
    // 3. 设置是否可以选择视频/图片/原图
    imagePickerVc.allowPickingVideo = NO;
    imagePickerVc.allowPickingImage = YES;
    imagePickerVc.allowPickingOriginalPhoto = NO;
    imagePickerVc.allowPickingGif = NO;

    // imagePickerVc.minImagesCount = 3;
    // imagePickerVc.alwaysEnableDoneBtn = YES;
    
    // imagePickerVc.minPhotoWidthSelectable = 3000;
    // imagePickerVc.minPhotoHeightSelectable = 2000;
    
    /// 5. Single selection mode, valid when maxImagesCount = 1
    /// 5. 单选模式,maxImagesCount为1时才生效
    imagePickerVc.showSelectBtn = NO;
    imagePickerVc.allowCrop = YES;
    imagePickerVc.needCircleCrop = YES;
    // 设置竖屏下的裁剪尺寸
    NSInteger left = 30;
    NSInteger widthHeight = SCREEN_WIDTH - 2 * left;
    NSInteger top = (SCREEN_HEIGHT - widthHeight) / 2;
    imagePickerVc.cropRect = CGRectMake(left, top, widthHeight, widthHeight);
    imagePickerVc.scaleAspectFillCrop = YES;
    // 设置横屏下的裁剪尺寸
    // imagePickerVc.cropRectLandscape = CGRectMake((self.view.tz_height - widthHeight) / 2, left, widthHeight, widthHeight);
    /*
     [imagePickerVc setCropViewSettingBlock:^(UIView *cropView) {
     cropView.layer.borderColor = [UIColor redColor].CGColor;
     cropView.layer.borderWidth = 2.0;
     }];*/
    
    // imagePickerVc.allowPreview = NO;
    // 自定义导航栏上的返回按钮
    /*
    [imagePickerVc setNavLeftBarButtonSettingBlock:^(UIButton *leftButton){
        [leftButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [leftButton setImageEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 20)];
    }];
    imagePickerVc.delegate = self;
    */
    
    // Deprecated, Use statusBarStyle
    // imagePickerVc.isStatusBarDefault = NO;
    imagePickerVc.statusBarStyle = UIStatusBarStyleLightContent;
    [self presentViewController:imagePickerVc animated:YES completion:nil];

}
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto {
    if (photos.count>0) {
//        self.isSelImage = YES;
//        self.iconImageView.image = photos.firstObject;
        UIImage *image = photos.firstObject;
        self.headImg = image;
        self.headImgView.image = image;
        self.headImg_isRight = self.headImg?YES:NO;
        if (self.checkDetailModel) {
            self.checkDetailModel.isNewHeadImg = YES;
        }
        [self configData];
    }
    
}


/// 拍照按钮点击事件
- (void)takePhoto {
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if ((authStatus == AVAuthorizationStatusRestricted || authStatus ==AVAuthorizationStatusDenied)) {
        
        NSDictionary *infoDict = [TZCommonTools tz_getInfoDictionary];
        // 无权限 做一个友好的提示
        NSString *appName = [infoDict valueForKey:@"CFBundleDisplayName"];
        if (!appName) appName = [infoDict valueForKey:@"CFBundleName"];
        if (!appName) appName = [infoDict valueForKey:@"CFBundleExecutable"];

        NSString *title = [NSBundle tz_localizedStringForKey:@"Can not use camera"];
        NSString *message = [NSString stringWithFormat:[NSBundle tz_localizedStringForKey:@"Please allow %@ to access your camera in \"Settings -> Privacy -> Camera\""],appName];
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAct = [UIAlertAction actionWithTitle:[NSBundle tz_localizedStringForKey:@"Cancel"] style:UIAlertActionStyleCancel handler:nil];
        [alertController addAction:cancelAct];
        UIAlertAction *settingAct = [UIAlertAction actionWithTitle:[NSBundle tz_localizedStringForKey:@"Setting"] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
        }];
        [alertController addAction:settingAct];
        [self.navigationController presentViewController:alertController animated:YES completion:nil];
    } else if (authStatus == AVAuthorizationStatusNotDetermined) {
        // fix issue 466, 防止用户首次拍照拒绝授权时相机页黑屏
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
            if (granted) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self pushImagePickerController];
                });
            }
        }];
    } else {
        [self pushImagePickerController];
    }
}

// 调用相机
- (void)pushImagePickerController {
    // 提前定位
//    TZImagePickerController *tzImagePickerVc = (TZImagePickerController *)self.navigationController;
//    if (tzImagePickerVc.allowCameraLocation) {
//        __weak typeof(self) weakSelf = self;
//        [[TZLocationManager manager] startLocationWithSuccessBlock:^(NSArray<CLLocation *> *locations) {
//            __strong typeof(weakSelf) strongSelf = weakSelf;
////            strongSelf.location = [locations firstObject];
//        } failureBlock:^(NSError *error) {
//            __strong typeof(weakSelf) strongSelf = weakSelf;
////            strongSelf.location = nil;
//        }];
//    }
    
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    if ([UIImagePickerController isSourceTypeAvailable: sourceType]) {
        self.imagePickerVc.sourceType = sourceType;
        NSMutableArray *mediaTypes = [NSMutableArray array];
//        if (tzImagePickerVc.allowTakePicture) {
//            [mediaTypes addObject:@"kUTTypeImage"];
//        }
//        if (tzImagePickerVc.allowTakeVideo) {
//            [mediaTypes addObject:(NSString *)kUTTypeMovie];
//            self.imagePickerVc.videoMaximumDuration = tzImagePickerVc.videoMaximumDuration;
//        }
//        self.imagePickerVc.mediaTypes= mediaTypes;
//        if (tzImagePickerVc.uiImagePickerControllerSettingBlock) {
//            tzImagePickerVc.uiImagePickerControllerSettingBlock(_imagePickerVc);
//        }
        [self presentViewController:self.imagePickerVc animated:YES completion:nil];
//    } else {
//        NSLog(@"模拟器中无法打开照相机,请在真机中使用");
//    }
    }
}


- (void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    
    TZImagePickerController *tzImagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 delegate:self];
    tzImagePickerVc.allowTakeVideo = NO;
    tzImagePickerVc.sortAscendingByModificationDate = YES;
    [tzImagePickerVc showProgressHUD];
    if ([type isEqualToString:@"public.image"]) {
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        NSDictionary *meta = [info objectForKey:UIImagePickerControllerMediaMetadata];
        // save photo and get asset / 保存图片，获取到asset
        [[TZImageManager manager] savePhotoWithImage:image meta:meta location:nil completion:^(PHAsset *asset, NSError *error){
            [tzImagePickerVc hideProgressHUD];
            if (error) {
                NSLog(@"图片保存失败 %@",error);
            } else {
                TZAssetModel *assetModel = [[TZImageManager manager] createModelWithAsset:asset];
                TZImagePickerController *imagePicker = [[TZImagePickerController alloc] initCropTypeWithAsset:assetModel.asset photo:image completion:^(UIImage *cropImage, id asset) {

                    self.headImg = cropImage;
                    self.headImgView.image = cropImage;
                    self.headImg_isRight = self.headImg?YES:NO;
                    if (self.checkDetailModel) {
                        self.checkDetailModel.isNewHeadImg = YES;
                    }
                    [self configData];
                    
                    
//                    [self refreshCollectionViewWithAddedAsset:asset image:cropImage];
                }];
                imagePicker.allowPickingImage = YES;
                imagePicker.needCircleCrop = YES;
//                imagePicker.circleCropRadius = 100;
                // 设置竖屏下的裁剪尺寸
                NSInteger left = 30;
                NSInteger widthHeight = SCREEN_WIDTH - 2 * left;
                NSInteger top = (SCREEN_HEIGHT - widthHeight) / 2;
                imagePicker.cropRect = CGRectMake(left, top, widthHeight, widthHeight);
                imagePicker.scaleAspectFillCrop = YES;
                [self presentViewController:imagePicker animated:YES completion:nil];
            }
        }];
    }
}

- (UIImagePickerController *)imagePickerVc {
    if (_imagePickerVc == nil) {
        _imagePickerVc = [[UIImagePickerController alloc] init];
        _imagePickerVc.delegate = self;
        // set appearance / 改变相册选择页的导航栏外观
        _imagePickerVc.navigationBar.barTintColor = self.navigationController.navigationBar.barTintColor;
        _imagePickerVc.navigationBar.tintColor = self.navigationController.navigationBar.tintColor;
        UIBarButtonItem *tzBarItem, *BarItem;
        if (@available(iOS 9, *)) {
            tzBarItem = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[TZImagePickerController class]]];
            BarItem = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UIImagePickerController class]]];
        } else {
            tzBarItem = [UIBarButtonItem appearanceWhenContainedIn:[TZImagePickerController class], nil];
            BarItem = [UIBarButtonItem appearanceWhenContainedIn:[UIImagePickerController class], nil];
        }
        NSDictionary *titleTextAttributes = [tzBarItem titleTextAttributesForState:UIControlStateNormal];
        [BarItem setTitleTextAttributes:titleTextAttributes forState:UIControlStateNormal];
    }
    return _imagePickerVc;
}

- (NSString *)nickName {
    if (!_nickName) {
       JCWUserBall *user =  [JCWUserBall currentUser];
        _nickName = user.user_name;
    }
    return _nickName;
}


- (UIButton *)submitBtn {
    if (!_submitBtn) {
        _submitBtn = [UIButton initWithText:@"提交审核" FontSize:AUTO(16) Weight:2 BackGroundColor:JCBaseColor TextColors:JCWhiteColor];
        [_submitBtn hg_setAllCornerWithCornerRadius:AUTO(22)];
        [_submitBtn addTarget:self action:@selector(submitBtnClick) forControlEvents:UIControlEventTouchUpInside];
        _submitBtn.userInteractionEnabled = NO;
    }
    return _submitBtn;
}

- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@"头像",@"专家名称"];
    }
    return _titleArray;
}

- (JCPostCheckPlanVC *)articleVC1 {
    if (!_articleVC1) {
        _articleVC1 = [JCPostCheckPlanVC new];
        _articleVC1.isAddArticle = YES;
    }
    return _articleVC1;
}

- (JCPostCheckPlanVC *)articleVC2 {
    if (!_articleVC2) {
        _articleVC2 = [JCPostCheckPlanVC new];
        _articleVC1.isAddArticle = YES;
    }
    return _articleVC2;
}

//dispatch_group_leave(thegroup);
@end
