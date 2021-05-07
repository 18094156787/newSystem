//
//  JCBindingBankCard.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/2.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCApplyBindingBankCardVC.h"
#import "JCApplyBindingFootView.h"
#import "JCApplyBindBankCardCell.h"
#import "JCDakaBuyPayWayTopView.h"
@interface JCApplyBindingBankCardVC ()

@property (nonatomic,strong) NSArray *titleArray;

@property (nonatomic,strong) NSArray *tipArray;

@property (nonatomic,strong) NSArray *placeArray;

@property (nonatomic,strong) UIButton *nextBtn;

@property (nonatomic,strong) UIImageView *headImgView;

@property (nonatomic,strong) NSString *bankName;//开户行

@property (nonatomic,strong) NSString *userName;//用户名

@property (nonatomic,strong) NSString *bankCard;//银行卡号

@end

@implementation JCApplyBindingBankCardVC

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
    // Do any additional setup after loading the view.
    self.view.backgroundColor = COLOR_F4F6F9;
    self.title = @"绑定银行卡";
    [self initView];
}

- (void)initView {
    JCDakaBuyPayWayTopView *headView = [JCDakaBuyPayWayTopView new];
    headView.backgroundColor = JCWhiteColor;
    headView.lineView.hidden = YES;
     headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(44));
    headView.titleLab.text = @"银行卡信息（仅支持工行储蓄卡）";
    headView.titleLab.font = [UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(16)];
    self.tableView.tableHeaderView = headView;
    
    JCApplyBindingFootView *footView = [JCApplyBindingFootView new];
    footView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(120));
    self.tableView.tableFooterView = footView;
    
    [self.view addSubview:self.nextBtn];
    [self.nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(390));
        make.left.offset(AUTO(50));
        make.right.offset(AUTO(-50));
        make.height.mas_equalTo(AUTO(44));
    }];
    
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(8));
    }];

//    self.tableView.separatorStyle = 0;
    self.tableView.separatorColor = COLOR_DDDDDD;
//    self.tableView.sepe
    self.tableView.estimatedRowHeight = 100;
    [self.tableView registerClass:[JCApplyBindBankCardCell class] forCellReuseIdentifier:@"JCApplyBindBankCardCell"];

}

#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JCApplyBindBankCardCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCApplyBindBankCardCell"];
    cell.selectionStyle = 0;
    cell.titleLab.text = self.titleArray[indexPath.row];
    cell.errorInfoLab.text  = self.tipArray[indexPath.row];
    cell.contentTF.placeholder = self.placeArray[indexPath.row];
    cell.errorInfoView.hidden = YES;

    WeakSelf;
    if (indexPath.row==0) {
        cell.contentTF.keyboardType = 0;
        [cell.contentTF.rac_textSignal subscribeNext:^(id x) {
            
        }];
        [[cell.contentTF rac_signalForControlEvents:UIControlEventEditingDidEnd] subscribeNext:^(id x) {
            cell.contentTF.text =  [cell.contentTF.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
            weakSelf.bankName = cell.contentTF.text;
            BOOL bankName = ([weakSelf isChineseCharacter:cell.contentTF.text]&&cell.contentTF.text.length>5);
            cell.errorInfoView.hidden = bankName;
            [weakSelf configData];
            
        }];
        };
    if (indexPath.row==1) {
        cell.contentTF.keyboardType = 0;
            [cell.contentTF.rac_textSignal subscribeNext:^(id x) {

                
            }];
            [[cell.contentTF rac_signalForControlEvents:UIControlEventEditingDidEnd] subscribeNext:^(id x) {
                BOOL userName_isRight =([weakSelf isChineseCharacter:cell.contentTF.text]&&cell.contentTF.text.length>=1);
                cell.errorInfoView.hidden = userName_isRight;
                weakSelf.userName = cell.contentTF.text;
                [weakSelf configData];
            }];
        };
    if (indexPath.row==2) {
        WeakSelf;
        cell.contentTF.keyboardType = UIKeyboardTypeNumberPad;
            [cell.contentTF.rac_textSignal subscribeNext:^(id x) {
                if (cell.contentTF.text.length > 19) {
                    cell.contentTF.text = [ cell.contentTF.text substringToIndex:19];
                }
                weakSelf.bankCard = cell.contentTF.text;
            }];
            [[cell.contentTF rac_signalForControlEvents:UIControlEventEditingDidEnd] subscribeNext:^(id x) {
                BOOL bankCard_isRight = ([weakSelf isDigitWithStr:weakSelf.bankCard]&&weakSelf.bankCard.length>=16&&weakSelf.bankCard.length<=19);
                cell.errorInfoView.hidden = bankCard_isRight;
                [weakSelf configData];
            }];
        };
            
            

    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        return AUTO(60);
    }
    if (indexPath.section==1) {
        return AUTO(AUTO(245));
    }
    return AUTO(AUTO(210));
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.0001f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [UIView new];
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

}


- (void)nextBtnClick {
    if (self.bankCard.length==0) {
        [JCWToastTool showHint:@"请输入银行卡号"];
        return;
    }
    if (self.bankName.length==0) {
        [JCWToastTool showHint:@"请输入开户行"];
        return;
    }
    if (self.userName.length==0) {
        [JCWToastTool showHint:@"请输入真实姓名"];
        return;
    }
    NSString *bankCard = [JCWAppTool getRSA_String:self.bankCard];

    [self.view showLoading];
    JCUserService_New *service = [JCUserService_New service];
    [service getUserBindBankCardWithBankcard_number:bankCard Bank_name:self.bankName Nickname:self.userName success:^(id  _Nullable object) {
        [self.view endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            JCWUserBall *user = [JCWUserBall currentUser];
            user.bankcard_number = self.bankCard;
            [JCWUserBall save:user];
            [JCWToastTool showHint:@"绑定成功"];
            [self.navigationController popViewControllerAnimated:YES];
            if (self.JCRefreshBlock) {
                self.JCRefreshBlock();
                
            }

        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self.view endLoading];
    }];
;


}


//判断是否纯中文
- (BOOL)isChineseCharacter:(NSString*)source {

    NSString *regex = @"^[\\u4E00-\\u9FEA]+$";

    return ([source rangeOfString:regex options:NSRegularExpressionSearch].length>0);

}
//判断纯数字
- (BOOL)isDigitWithStr:(NSString *)str {
    NSCharacterSet *alphaNums = [NSCharacterSet decimalDigitCharacterSet];
    NSCharacterSet *inStringSet = [NSCharacterSet characterSetWithCharactersInString:str];
    return [alphaNums isSupersetOfSet:inStringSet];
}

    
#pragma mark


- (void)configData {
    BOOL bankName_isRight =([self isChineseCharacter:self.bankName]&&self.bankName.length>5);
    BOOL userName_isRight =([self isChineseCharacter:self.userName]&&self.userName.length>=2);
    BOOL bankCard_isRight =([self isDigitWithStr:self.bankCard]&&self.bankCard.length==19);


    if (bankName_isRight&&userName_isRight&&bankCard_isRight) {
        self.nextBtn.backgroundColor = JCBaseColor;
        self.nextBtn.userInteractionEnabled = YES;
    }else{
        self.nextBtn.backgroundColor = COLOR_DDDDDD;
        self.nextBtn.userInteractionEnabled = NO;
    }
}


- (UIButton *)nextBtn {
    if (!_nextBtn) {
        _nextBtn = [UIButton initWithText:@"提交绑定" FontSize:AUTO(13) Weight:1 BackGroundColor:COLOR_DDDDDD TextColors:JCWhiteColor];
        [_nextBtn hg_setAllCornerWithCornerRadius:AUTO(22)];
        [_nextBtn addTarget:self action:@selector(nextBtnClick) forControlEvents:UIControlEventTouchUpInside];
        _nextBtn.userInteractionEnabled =  NO;
    }
    return _nextBtn;
}

- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@"开户行",@"开户名",@"银行卡号"];
    }
    return _titleArray;
}
- (NSArray *)tipArray {
    if (!_tipArray) {
        _tipArray = @[@"请输入正确的开户行名称",@"请输入正确的开户名",@"请输入正确的银行卡号"];
    }
    return _tipArray;
}

- (NSArray *)placeArray {
    if (!_placeArray) {
        _placeArray = @[@"例如，XX省XX市XX区(县)XX支行",@"未填写",@"未填写"];
    }
    return _placeArray;
}


@end
