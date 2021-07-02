//
//  JCPostCheckUserInfo_Invite_VC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/7/1.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCPostCheckUserInfo_Invite_VC.h"
#import "JCPostCheckUserInfoCell.h"
#import "JCPostCheckUserIDCardCell.h"
#import "JCPostCheckUserReasonCell.h"
#import "JCPostCheckArticleVC.h"
#import "JCWPhotoTool.h"
#import "JCMyPostCheckDetailModel.h"
#import "JCWAppTool.h"
@interface JCPostCheckUserInfo_Invite_VC ()<UITextFieldDelegate>

@property (nonatomic,strong) NSArray *titleArray;

@property (nonatomic,strong) NSArray *tipArray;

@property (nonatomic,strong) NSArray *placeholderArray;

@property (nonatomic,strong) UIButton *nextBtn;

@property (nonatomic,strong) UIImage *headImg;

@property (nonatomic,strong) UIImageView *headImgView;

@property (nonatomic,strong) NSString *name;

@property (nonatomic,strong) NSString *phone;

@property (nonatomic,strong) NSString *idcard;//身份证

@property (nonatomic,strong) UIImage *idcard_image;// 身份证照片

@property (nonatomic,strong) UITextField *nameTF;

@property (nonatomic,strong) UITextField *phoneTF;

@property (nonatomic,strong) UITextField *cardTF;

@property (nonatomic,assign) BOOL name_isRight;

@property (nonatomic,assign) BOOL phone_isRight;

@property (nonatomic,assign) BOOL idcard_isRight;//身份证

@property (nonatomic,assign) BOOL idcard_image_isRight;// 身份证照片

@property (nonatomic,assign) BOOL account_isRight;//申请理由

@property (nonatomic,strong) UIButton *deleteBtn;

@property (nonatomic,strong) JCPostCheckUserIDCardCell *iDCarCell;

@property (nonatomic,strong) JCMyPostCheckDetailModel *checkDetailModel;

@property (nonatomic,assign) BOOL firstIputName;

@property (nonatomic,assign) BOOL firstIputPhone;

@property (nonatomic,assign) BOOL firstIputCard;

@end

@implementation JCPostCheckUserInfo_Invite_VC

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
    // Do any additional setup after loading the view.
    self.title = @"填写个人信息";
    self.firstIputName = YES;
    self.firstIputPhone = YES;
    self.firstIputCard = YES;
    [self initView];
    [self getMyApplyDetail];

}

- (void)getMyApplyDetail {
    
    if ([[JCWUserBall currentUser].fabu integerValue]!=5) {
        return;
    }
    [SVProgressHUD show];
    JCUserService_New * service = [JCUserService_New new];
    [service getPostPlan_postInfoDetailWithSuccess:^(id  _Nullable object) {
        [SVProgressHUD dismiss];
        if ([JCWJsonTool isSuccessResponse:object]) {
            self.checkDetailModel = (JCMyPostCheckDetailModel *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCMyPostCheckDetailModel class]];
            self.name = self.checkDetailModel.name;
            self.name_isRight =([self isChineseCharacter:self.name]&&self.name.length>1&&self.name.length<=8);
            self.phone = self.checkDetailModel.phone;
            self.phone_isRight = ([self isDigitWithStr:self.phone]&&self.phone.length==11);
            self.idcard = self.checkDetailModel.idcard;
            self.idcard_isRight =([self judgeIdentityStringValid:self.idcard]&&self.idcard.length==18);
            [self.headImgView sd_setImageWithURL:[NSURL URLWithString:self.checkDetailModel.idcard_image_url] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
                self.iDCarCell.errorInfoView.hidden = YES;
                self.headImg = image;
                self.deleteBtn.hidden = NO;
                [self.tableView reloadData];
                [self configData];
            }];
            
            
            [self configData];
            [self.tableView reloadData];

        }else{
             [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [SVProgressHUD dismiss];
    }];

}

- (void)initView {
    self.tableView.separatorColor = COLOR_DDDDDD;
    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(8));
        make.left.right.equalTo(self.view);
        //        make.bottom.equalTo(self.view).offset(-kTabBarHeight);
        if (@available(iOS 11.0, *)) {
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom).offset(-kBottomTabSafeAreaHeight-AUTO(60));
        } else {
            make.bottom.equalTo(self.view).offset(-kBottomTabSafeAreaHeight-AUTO(60));
            // Fallback on earlier versions
        }
    }];
    
    [self.view addSubview:self.nextBtn];
    [self.nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(-kBottomTabSafeAreaHeight-AUTO(10));
        make.left.offset(AUTO(50));
        make.right.offset(AUTO(-50));
        make.height.mas_equalTo(AUTO(44));
    }];

//    self.tableView.separatorStyle = 0;
    self.tableView.estimatedRowHeight = 100;
    [self.tableView registerClass:[JCPostCheckUserInfoCell class] forCellReuseIdentifier:@"JCPostCheckUserInfoCell"];
    [self.tableView registerClass:[JCPostCheckUserIDCardCell class] forCellReuseIdentifier:@"JCPostCheckUserIDCardCell"];
    [self.tableView registerClass:[JCPostCheckUserReasonCell class] forCellReuseIdentifier:@"JCPostCheckUserReasonCell"];

}

#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
        return self.titleArray.count;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        JCPostCheckUserInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCPostCheckUserInfoCell"];
        cell.selectionStyle = 0;
        cell.titleLab.text = self.titleArray[indexPath.row];
        cell.contentTF.placeholder = self.placeholderArray[indexPath.row];
        cell.errorInfoLab.text  = self.tipArray[indexPath.row];
        cell.errorInfoView.hidden = YES;
//        cell.errorInfoView.hidde
        WeakSelf;
        if (indexPath.row==0) {
            cell.contentTF.keyboardType = 0;
            cell.errorInfoView.hidden = self.name_isRight;
            cell.contentTF.text = self.name;
            cell.contentTF.delegate = self;
            self.nameTF = cell.contentTF;
            [cell.contentTF.rac_textSignal subscribeNext:^(id x) {
                if (cell.contentTF.text.length > 8) {
                    cell.contentTF.text = [ cell.contentTF.text substringToIndex:8];
                }
            }];
            
            [[cell.contentTF rac_signalForControlEvents:UIControlEventEditingDidEnd] subscribeNext:^(id x) {
                cell.contentTF.text =  [cell.contentTF.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
                weakSelf.name = cell.contentTF.text;
                weakSelf.name_isRight =([weakSelf isChineseCharacter:cell.contentTF.text]&&cell.contentTF.text.length>1&&cell.contentTF.text.length<=8);
                cell.errorInfoView.hidden = weakSelf.name_isRight;
                [weakSelf configData];
                
            }];

            };
        if (indexPath.row==1) {
            cell.contentTF.keyboardType = UIKeyboardTypeNumberPad;
            cell.errorInfoView.hidden = self.phone_isRight;
            cell.contentTF.text = self.phone;
            cell.contentTF.delegate = self;
            self.phoneTF = cell.contentTF;
            WeakSelf;
                [cell.contentTF.rac_textSignal subscribeNext:^(id x) {
                    if (cell.contentTF.text.length > 11) {
                        cell.contentTF.text = [ cell.contentTF.text substringToIndex:11];
                    }
                    weakSelf.phone = cell.contentTF.text;
                }];
                [[cell.contentTF rac_signalForControlEvents:UIControlEventEditingDidEnd] subscribeNext:^(id x) {
                    weakSelf.phone_isRight =([weakSelf isDigitWithStr:cell.contentTF.text]&&cell.contentTF.text.length==11);
                    cell.errorInfoView.hidden = weakSelf.phone_isRight;
                    [weakSelf configData];
                }];
            };
        if (indexPath.row==2) {
            cell.contentTF.keyboardType = 0;
            cell.errorInfoView.hidden = self.idcard_isRight;
            cell.contentTF.text = self.idcard;
            cell.contentTF.delegate = self;
            self.cardTF = cell.contentTF;
            WeakSelf;
                [cell.contentTF.rac_textSignal subscribeNext:^(id x) {
                    if (cell.contentTF.text.length > 18) {
                        cell.contentTF.text = [ cell.contentTF.text substringToIndex:18];
                    }
                    weakSelf.idcard = cell.contentTF.text;
                }];
                [[cell.contentTF rac_signalForControlEvents:UIControlEventEditingDidEnd] subscribeNext:^(id x) {
                    weakSelf.idcard_isRight =([weakSelf judgeIdentityStringValid:cell.contentTF.text]&&cell.contentTF.text.length==18);
                    cell.errorInfoView.hidden = weakSelf.idcard_isRight;
                    [weakSelf configData];
                }];
            };
        
        
        return cell;
    }
    if (indexPath.section==1) {
        JCPostCheckUserIDCardCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCPostCheckUserIDCardCell"];
        cell.selectionStyle = 0;
//        cell.errorInfoView.hidden = YES;
        self.iDCarCell = cell;
         self.headImgView= cell.photoImgView;
        self.deleteBtn = cell.deleteBtn;
        [self.deleteBtn addTarget:self action:@selector(deleteBtnClick) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }
    
//    JCPostCheckUserReasonCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCPostCheckUserReasonCell"];
//    cell.selectionStyle = 0;
//    cell.contentTV.text = self.account;
//    cell.errorInfoView.hidden = self.account_isRight;
//
//    WeakSelf;
//    [cell.contentTV.rac_textSignal subscribeNext:^(id x) {
//
//        if (cell.contentTV.text.length > 300) {
//            cell.contentTV.text = [ cell.contentTV.text substringToIndex:300];
//        }
//        weakSelf.account_isRight = cell.contentTV.text.length>=30;
//        cell.errorInfoView.hidden = weakSelf.account_isRight;
//        cell.countLab.text = [NSString stringWithFormat:@"%ld/300",cell.contentTV.text.length];
//        weakSelf.account = cell.contentTV.text;
//        [weakSelf configData];
//    }];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];


    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        return AUTO(85);
    }
    if (indexPath.section==1) {
        return AUTO(270);
    }
    return AUTO(230);
}



- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section<2) {
        return AUTO(8);
    }
    return 0.0001;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *backView= [UIView new];
    backView.backgroundColor = COLOR_F4F6F9;
    return backView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==1) {
        [self.view endEditing:YES];
        [self iconImageViewClick];
    }
}


- (void)nextBtnClick {

//    JCPostCheckArticleVC *vc = [JCPostCheckArticleVC new];
    self.checkVC.name = self.name;
    self.checkVC.phone = self.phone;
    self.checkVC.idcard = self.idcard;
    self.checkVC.idcard_image = self.headImg;
    self.checkVC.isJingcai = self.isJingcai;
    self.checkVC.checkDetailModel =  self.checkDetailModel;
    [self.navigationController pushViewController:self.checkVC animated:YES];

}

- (void)iconImageViewClick {
    WeakSelf;
    [JCWPhotoTool sharePicture:^(UIImage *image) {
        weakSelf.headImg = image;
        weakSelf.headImgView.image = image;
        weakSelf.deleteBtn.hidden = NO;
        weakSelf.iDCarCell.errorInfoView.hidden = YES;
        weakSelf.idcard_image_isRight = weakSelf.headImg?YES:NO;
        if (weakSelf.checkDetailModel) {
            weakSelf.checkDetailModel.isNewIDCard = YES;
        }
        [weakSelf configData];

    }];
}

- (void)deleteBtnClick {
    self.headImg = nil;
    self.headImgView.image = JCIMAGE(@"post_img_scsfz");
    self.deleteBtn.hidden = self.headImg?NO:YES;
    self.iDCarCell.errorInfoView.hidden = self.headImg?YES:NO;
    [self configData];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (textField==self.nameTF&&string.length>0) {
        if ([string isEqual:@" "]) {
            return NO;
        }
//        return [JCWAppTool isChineseCharacter:string];
    }
    if (textField==self.cardTF&&string.length>0) {
        return [JCWAppTool isEnglishOrNumberWithStr:string];
    }
    if (textField==self.phoneTF&&string.length>0) {
        return [JCWAppTool isDigitWithStr:string];
    }
    
    return YES;
}

//判断是否纯中文
- (BOOL)isChineseCharacter:(NSString*)source {
    NSString *regex = @"^[\\u4E00-\\u9FEA]+$";
    return ([source rangeOfString:regex options:NSRegularExpressionSearch].length>0);
}
//判断纯数字
- (BOOL)isDigitWithStr:(NSString *)str {
    if (str.length==0) {
        return NO;
    }
    NSCharacterSet *alphaNums = [NSCharacterSet decimalDigitCharacterSet];
    NSCharacterSet *inStringSet = [NSCharacterSet characterSetWithCharactersInString:str];
    return [alphaNums isSupersetOfSet:inStringSet];
}
//判断身份证
- (BOOL)judgeIdentityStringValid:(NSString *)identityString {
    if (identityString.length==18) {
        return YES;
    }else{
        return NO;
    }
    
}

- (void)configData {
    BOOL name_isRight =([self isChineseCharacter:self.name]&&self.name.length>1);
    BOOL phone_isRight =([self isDigitWithStr:self.phone]&&self.phone.length==11);
    BOOL idcard_isRight =([self judgeIdentityStringValid:self.idcard]&&self.idcard.length==18);

    if (name_isRight&&phone_isRight&&idcard_isRight&&self.headImg) {
        self.nextBtn.backgroundColor = JCBaseColor;
        self.nextBtn.userInteractionEnabled = YES;
    }else{
        self.nextBtn.backgroundColor = COLOR_DDDDDD;
        self.nextBtn.userInteractionEnabled = NO;
    }
}


- (UIButton *)nextBtn {
    if (!_nextBtn) {
        _nextBtn = [UIButton initWithText:@"下一步(2/4)" FontSize:AUTO(16) Weight:2 BackGroundColor:JCBaseColor TextColors:JCWhiteColor];
        [_nextBtn hg_setAllCornerWithCornerRadius:AUTO(22)];
        [_nextBtn addTarget:self action:@selector(nextBtnClick) forControlEvents:UIControlEventTouchUpInside];
        _nextBtn.userInteractionEnabled =  NO;
    }
    return _nextBtn;
}

- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@"姓名",@"电话号码",@"身份证号"];
    }
    return _titleArray;
}
- (NSArray *)tipArray {
    if (!_tipArray) {
        _tipArray = @[@"请输入正确的姓名",@"请输入正确的号码",@"请输入正确的身份证号"];
    }
    return _tipArray;
}

- (NSArray *)placeholderArray {
    if (!_placeholderArray) {
        _placeholderArray = @[@"请输入姓名",@"请输入手机号码",@"请输入身份证号码"];
    }
    return _placeholderArray;
}

- (JCPostCheckArticle_Invite_VC *)checkVC {
    if (!_checkVC) {
        _checkVC = [JCPostCheckArticle_Invite_VC new];
    }
    return _checkVC;
}
@end
