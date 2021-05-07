//
//  JCMyBankCardVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/2.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCMyBankCardVC.h"
#import "JCDakaBuyPayWayTopView.h"
#import "JCApplyBindingFootView.h"
#import "JCMyBindBankCardCell.h"
#import "JCBaseTitleAlertView.h"
#import "JCBankCardInfoModel.h"
@interface JCMyBankCardVC ()

@property (nonatomic,strong) NSArray *titleArray;

@property (nonatomic,strong) NSArray *tipArray;

@property (nonatomic,strong) UIButton *nextBtn;

@property (nonatomic,strong) UIImageView *headImgView;

@property (nonatomic,strong) NSString *bankName;

@property (nonatomic,strong) NSString *userName;

@property (nonatomic,strong) NSString *bankCard;//银行卡号

@property (nonatomic,strong) JCBankCardInfoModel *bankCardModel;


@end

@implementation JCMyBankCardVC

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
    [self refreshData];

}

- (void)refreshData {
    [self.view showLoading];
    JCUserService_New *service = [JCUserService_New service];
    [service getMyBindCardInfoWithsuccess:^(id  _Nullable object) {
        [self.view endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            self.bankCardModel = (JCBankCardInfoModel *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCBankCardInfoModel class]];
            [self.tableView reloadData];
        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self.view endLoading];
    }];

}

- (void)initView {


    JCDakaBuyPayWayTopView *headView = [JCDakaBuyPayWayTopView new];
    headView.backgroundColor = JCWhiteColor;
    headView.lineView.hidden = YES;
     headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(44));
    headView.titleLab.text = @"银行卡信息";
    headView.titleLab.font = [UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(16)];
    self.tableView.tableHeaderView = headView;
    
    
    [self.view addSubview:self.nextBtn];
    [self.nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(280));
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
    [self.tableView registerClass:[JCMyBindBankCardCell class] forCellReuseIdentifier:@"JCMyBindBankCardCell"];

}

#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JCMyBindBankCardCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCMyBindBankCardCell"];
    cell.selectionStyle = 0;
    cell.titleLab.text = self.titleArray[indexPath.row];
    cell.contentTF.userInteractionEnabled = NO;
    cell.contentTF.placeholder = @"";
    if (indexPath.row==0) {
        cell.contentTF.text = self.bankCardModel.bank_name;
        };
    if (indexPath.row==1) {
        cell.contentTF.text = self.bankCardModel.nickname;
        };
    if (indexPath.row==2) {
        cell.contentTF.text = self.bankCardModel.bankcard_number;
        };
            
            

    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

     return AUTO(60);
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
    JCBaseTitleAlertView *alertView = [JCBaseTitleAlertView new];
    [alertView alertTitle:@"提示" TitleColor:COLOR_2F2F2F Mesasge:@"确定解除银行卡绑定吗？" MessageColor:COLOR_2F2F2F SureTitle:@"确定" SureColor:JCWhiteColor SureHandler:^{
        [self unBindBankCard];
        [alertView removeFromSuperview];
    } CancleTitle:@"取消" CancleColor:JCBaseColor CancelHandler:^{
        [alertView removeFromSuperview];
    }];

    alertView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [[UIApplication sharedApplication].keyWindow addSubview:alertView];
}

- (void)unBindBankCard {
    if (self.bankCardModel.id.length==0) {
        return;
    }
    [self.view showLoading];
    JCUserService_New *service = [JCUserService_New service];
    [service getUserUnbundlingBankCardWithBankcard_id:self.bankCardModel.id success:^(id  _Nullable object) {
        [self.view endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
             JCWUserBall *user =[JCWUserBall currentUser];
            user.bankcard_number = @"";
            [JCWUserBall save:user];
            if (self.JCRefreshBlock) {
                self.JCRefreshBlock();
            }
            [self.navigationController popViewControllerAnimated:YES];

        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }
    } failure:^(NSError * _Nonnull error) {
        [self.view endLoading];
        
    }];

}



    
#pragma mark



- (UIButton *)nextBtn {
    if (!_nextBtn) {
        _nextBtn = [UIButton initWithText:@"解除绑定" FontSize:AUTO(16) Weight:2 BackGroundColor:JCBaseColor TextColors:JCWhiteColor];
        [_nextBtn hg_setAllCornerWithCornerRadius:AUTO(22)];
        [_nextBtn addTarget:self action:@selector(nextBtnClick) forControlEvents:UIControlEventTouchUpInside];
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


@end
