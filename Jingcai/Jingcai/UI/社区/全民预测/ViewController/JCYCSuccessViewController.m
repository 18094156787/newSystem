//
//  JCYCSuccessViewController.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/15.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCYCSuccessViewController.h"
#import "JCYCMyYcWMStickyVC.h"
#import "JCYCMyFriendViewController.h"
@interface JCYCSuccessViewController ()

@property (nonatomic,strong) UILabel *infoLab;

@end

@implementation JCYCSuccessViewController


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
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"发布成功";
    self.view.backgroundColor = JCWhiteColor;
    [self initViews];
}

- (void)initViews {
    
    UIView *postView = [UIView new];
    postView.frame = CGRectMake(0, 0, 40, 40);
    UILabel *fbLab = [UILabel initWithTitle:@"完成" andFont:14 andWeight:1 andTextColor:COLOR_1B1B1B andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    fbLab.frame = CGRectMake(0, 0, 40, 40);
    [postView addSubview:fbLab];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:postView];
    WeakSelf;
    [postView bk_whenTapped:^{
        [weakSelf.navigationController popViewControllerAnimated:YES];
    }];
    
    
    
    
    
    UIImageView *successImgView = [UIImageView new];
    successImgView.image = JCIMAGE(@"jc_dagou");
    [self.view addSubview:successImgView];
    [successImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(27));
        make.centerX.equalTo(self.view);
        make.width.height.mas_equalTo(AUTO(66));
    }];
    
    UILabel *successLab = [UILabel initWithTitle:@"发布成功" andFont:AUTO(16) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.view addSubview:successLab];
    [successLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(successImgView.mas_bottom).offset(AUTO(20));
        make.centerX.equalTo(self.view);
    }];
    
    self.infoLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.view addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(successLab.mas_bottom).offset(AUTO(30));
        make.centerX.equalTo(self.view);
    }];
    
    YYLabel* predicateLab =[[YYLabel alloc]init];
//    codeLoginLab.textColor = COLOR_969BA3;
    [self.view addSubview:predicateLab];
    predicateLab.numberOfLines=0;
    [predicateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.infoLab.mas_bottom).offset(AUTO(20));
        make.centerX.equalTo(self.view);
        
    }];

    NSString *codeLoginString = @"前往 我的 - 我发布的预测  中查看";
    NSMutableAttributedString* atext = [[NSMutableAttributedString alloc] initWithString:codeLoginString attributes:@{NSForegroundColorAttributeName:COLOR_A9A9A9,NSFontAttributeName:[UIFont systemFontOfSize:AUTO(12)]}];
    NSRange loginRange = [codeLoginString rangeOfString:@"我的 - 我发布的预测"];
//    [atext yy_setFont:[UIFont systemFontOfSize:AUTO(12)] range:atext.yy_rangeOfAll];
    [atext addAttributes:@{NSForegroundColorAttributeName:COLOR_EF2F2F,NSUnderlineStyleAttributeName : [NSNumber numberWithInteger:NSUnderlineStyleSingle],NSBaselineOffsetAttributeName:@(NSUnderlineStyleSingle), NSUnderlineColorAttributeName : COLOR_EF2F2F} range:loginRange];
    YYTextHighlight *hi = [YYTextHighlight new];
    [atext setTextHighlight:hi range:codeLoginString.rangeOfAll];
    
    hi.tapAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
        //点击展开
        JCYCMyYcWMStickyVC *vc = [JCYCMyYcWMStickyVC new];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };

    predicateLab.attributedText=atext;
    
    
    UIImageView *inviteImgView = [UIImageView new];
    inviteImgView.image = JCIMAGE(@"jc_invite_friend");
    [self.view addSubview:inviteImgView];
    [inviteImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(12));
        make.right.offset(AUTO(-12));
        make.top.equalTo(predicateLab.mas_bottom).offset(AUTO(100));
        make.height.mas_equalTo(AUTO(100));
    }];
    
    UILabel *label = [UILabel initWithTitle:@"邀请好友，无上限赢现金红包大奖" andFont:AUTO(16) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(28));
        make.top.equalTo(inviteImgView.mas_bottom).offset(AUTO(10));
    }];
    
    UILabel *label1 = [UILabel initWithTitle:@"邀请好友登录注册 全民鲸猜" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.view addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.mas_bottom).offset(AUTO(5));
        make.left.equalTo(label);
    }];
    
    UILabel *label2 = [UILabel initWithTitle:@"立即抢现金红包、免单券、红包优惠券等" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.view addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label1.mas_bottom).offset(AUTO(5));
        make.left.equalTo(label);
    }];
    
    UIButton *joinBtn = [UIButton initWithText:@"去参加" FontSize:AUTO(14) Weight:1 BackGroundColor:COLOR_EF2F2F TextColors:JCWhiteColor];
    [joinBtn hg_setAllCornerWithCornerRadius:AUTO(15)];
    [self.view addSubview:joinBtn];
    [joinBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(label2);
        make.right.offset(AUTO(-28));
        make.size.mas_equalTo(CGSizeMake(AUTO(80), AUTO(30)));
    }];
    
    UIView *bgView = [UIView new];
    [self.view insertSubview:bgView atIndex:0];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(inviteImgView);
        make.bottom.equalTo(label2.mas_bottom).offset(AUTO(10));
    }];
    bgView.layer.borderColor = COLOR_F0F0F0.CGColor;
    bgView.layer.borderWidth = 1;
    bgView.layer.cornerRadius = AUTO(12);
    bgView.layer.masksToBounds = YES;
    
    self.infoLab.text = self.msg;
    

    [joinBtn bk_whenTapped:^{
//        [weakSelf.navigationController popViewControllerAnimated:YES];
        JCYCMyFriendViewController *vc = [JCYCMyFriendViewController new];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    }];
    

    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
