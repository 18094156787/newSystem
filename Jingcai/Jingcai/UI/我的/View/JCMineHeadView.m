//
//  JCMineHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2019/8/11.
//  Copyright © 2019年 blockstar. All rights reserved.
//

#import "JCMineHeadView.h"
#import "JCChargeVC.h"
#import "JCMyBuyPlanWMViewController.h"
#import "JCBookeViewController.h"
#import "JCCoinRecordsViewController.h"
#import "JCMessageCenterVC.h"
#import "JCTopRankListWMVC.h"
#import "JCHongbangWMstckyVC.h"
#import "JCMyConcernExpertWMVC.h"
#import "JCYCHongBaoWMVC.h"
#import "JCYCMyFriendViewController.h"
#import "JCSettingVC.h"
@implementation JCMineHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initViews];
    }
    return self;
}

- (void)initViews {
    self.backgroundColor = COLOR_F4F6F9;
    UIImageView *backImgView = [UIImageView new];
    backImgView.userInteractionEnabled = YES;
    backImgView.image = JCIMAGE(@"mine_topView");
    [self addSubview:backImgView];
    [backImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.bottom.offset(AUTO(-35));
    }];
    


    
    [backImgView addSubview:self.topBgView];
    [self.topBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    
    [backImgView addSubview:self.userInfoView];
    [self.userInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.top.offset(kNavigationBarHeight);
        make.height.mas_equalTo(AUTO(70));
        make.right.offset(0);
    }];
    
    [self.userInfoView addSubview:self.headImgView];
    [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(0);
        make.width.height.mas_equalTo(AUTO(48));
    }];
    
    [self.userInfoView addSubview:self.qyImgView];
    [self.qyImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.headImgView);
        make.bottom.equalTo(self.headImgView).offset(AUTO(5));
        make.size.mas_equalTo(CGSizeMake(AUTO(35), AUTO(14)));
    }];
    

    
    [self.userInfoView addSubview:self.nameLab];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImgView.mas_right).offset(AUTO(10));
        make.bottom.equalTo(self.headImgView.mas_centerY);
        make.right.offset(AUTO(-100));
    }];
    
    [self.userInfoView addSubview:self.fensiLab];
    [self.fensiLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLab);
        make.top.equalTo(self.nameLab.mas_bottom).offset(AUTO(8));
    }];
    
    [self.userInfoView addSubview:self.indicateImgView];
    [self.indicateImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.headImgView);
        make.right.offset(AUTO(-15));
        make.size.mas_equalTo(CGSizeMake(AUTO(7), AUTO(12)));
    }];
    
    [backImgView addSubview:self.itemBgView];
    [self.itemBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.top.equalTo(self.headImgView.mas_bottom).offset(AUTO(20));
        make.right.offset(0);
        make.height.mas_equalTo(AUTO(50));
    }];
    
    [self.itemBgView addSubview:self.yhqView];
    [self.yhqView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.offset(0);
        make.width.mas_equalTo(SCREEN_WIDTH/3.0f);
    }];
    
    [self.itemBgView addSubview:self.gzView];
    [self.gzView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(self.yhqView.mas_right);
        make.width.mas_equalTo(SCREEN_WIDTH/3.0f);
    }];
    
    [self.itemBgView addSubview:self.msgView];
    [self.msgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.offset(0);
        make.width.mas_equalTo(SCREEN_WIDTH/3.0f);
    }];
    
    
    [self addSubview:self.userBackView];
    [self.userBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.bottom.offset(0);
        make.right.offset(-15);
        make.height.mas_equalTo(AUTO(70));
    }];
    
    [self.userBackView addSubview:self.moneyInfoLab];
    [self.moneyInfoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(AUTO(8));
        make.height.mas_equalTo(AUTO(20));
    }];
    
    
    [self.userBackView addSubview:self.moneyLab];
    [self.moneyLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.moneyInfoLab);
        make.right.offset(AUTO(-150));
        make.top.equalTo(self.moneyInfoLab.mas_bottom);
        
    }];
    

    [self.userBackView addSubview:self.rechargeBtn];
    [self.rechargeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.userBackView);
        make.right.offset(AUTO(-15));
        make.size.mas_equalTo(CGSizeMake(AUTO(80), AUTO(30)));
    }];

    [backImgView addSubview:self.loginLab];
    [self.loginLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImgView.mas_right).offset(AUTO(10));
        make.centerY.equalTo(self.headImgView);
        make.size.mas_equalTo(CGSizeMake(AUTO(60), AUTO(30)));
    }];
    
    [backImgView addSubview:self.qyLab];
    [self.qyLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self.headImgView);
        make.size.mas_equalTo(CGSizeMake(AUTO(90), AUTO(30)));
    }];
    
    
    
 

    [self initData];
    [self refreshUserData];
    
    
    
}

- (void)refreshUserData {
    if (![JCWUserBall currentUser]) {
        self.qyImgView.hidden = YES;
        self.indicateImgView.hidden = YES;
        self.qyLab.hidden = YES;
        self.loginLab.hidden = NO;
        self.indicateImgView.hidden = YES;
        self.moneyLab.text = @"0";
         self.headImgView.image = JCIMAGE(@"userImg_default");
        self.nameLab.text = @"";
        self.fensiLab.text = @"";
        
        self.yhqView.number = @"0";
        self.gzView.number = @"0";
        self.msgView.number = @"0";
    }else {
        self.qyLab.hidden = [[JCWUserBall currentUser].fabu integerValue]==1?YES:NO;
        self.indicateImgView.hidden = [[JCWUserBall currentUser].fabu integerValue]==1?NO:YES;
        self.loginLab.hidden = YES;
  

    }
}
- (void)setUserBall:(JCWUserBall *)userBall {
    _userBall = userBall;

    [self refreshUserData];

    [self.headImgView sd_setImageWithURL:[NSURL URLWithString:userBall.user_img] placeholderImage:JCIMAGE(@"userImg_default")];
    
    self.nameLab.text = NonNil(userBall.user_name);
    self.qyImgView.hidden = [userBall.fabu intValue]==1?NO:YES;
    
    if ([userBall.prize integerValue]>0) {
       
    }
    self.moneyLab.text = [JCCommomTool formatePointZero1:userBall.prize];
    if ([userBall.fensi intValue]>0&&[userBall.fabu intValue]==1) {
        self.fensiLab.text = [NSString stringWithFormat:@"粉丝数: %@",userBall.fensi];
         [self.nameLab mas_remakeConstraints:^(MASConstraintMaker *make) {
             make.left.equalTo(self.headImgView.mas_right).offset(AUTO(10));
             make.bottom.equalTo(self.headImgView.mas_centerY);
             make.right.offset(AUTO(-100));
         }];
    }else{
        self.fensiLab.text = @"";
        [self.nameLab mas_remakeConstraints:^(MASConstraintMaker *make) {
             make.left.equalTo(self.headImgView.mas_right).offset(AUTO(10));
             make.centerY.equalTo(self.headImgView);
             make.right.offset(AUTO(-100));
         }];
        
        self.fensiLab.text = @"";
    }
    NSLog(@"彩云%@",userBall.caiyun);

    self.headUrl = userBall.user_img;
    

    self.yhqView.number = userBall.hongbao_count.length>0?userBall.hongbao_count:@"0";
    self.gzView.number = userBall.focus_on_count.length>0?userBall.focus_on_count:@"0";
    self.msgView.number = userBall.unread_messages.length>0?userBall.unread_messages:@"0";
}

- (void)setMoney:(NSString *)money {
    _money = money;
    self.moneyLab.text = money;
}

- (void)initData {
     WeakSelf;
    
    [self.loginLab bk_whenTapped:^{
         if (![JCWUserBall currentUser]) {
             [weakSelf presentLogin];
         }
    }];

    
   
    [self.rechargeBtn bk_whenTapped:^{
        if (![JCWUserBall currentUser]) {
            [weakSelf presentLogin];
            return ;
        }
        [[weakSelf getViewController].navigationController pushViewController:[JCChargeVC new] animated:YES ];
    }];

    
    //红币记录
    [self.moneyLab bk_whenTapped:^{
       
        if (![JCWUserBall currentUser]) {
            [weakSelf presentLogin];
            return ;
        }
        JCCoinRecordsViewController *vc= [JCCoinRecordsViewController new];
        [[weakSelf getViewController].navigationController pushViewController:vc animated:YES ];
    }];
    
    [self.moneyInfoLab bk_whenTapped:^{
       
        if (![JCWUserBall currentUser]) {
            [weakSelf presentLogin];
            return ;
        }
        JCCoinRecordsViewController *vc= [JCCoinRecordsViewController new];
        [[weakSelf getViewController].navigationController pushViewController:vc animated:YES ];
    }];
    
    
 
    
    [self.userInfoView bk_whenTapped:^{
        if (![JCWUserBall currentUser]) {
            [weakSelf presentLogin];
            return ;
        }
        if ([[JCWUserBall currentUser].fabu integerValue]==1) {
            JCHongbangWMstckyVC *vc= [JCHongbangWMstckyVC new];
            vc.isMine = YES;
            vc.autherID = [JCWUserBall currentUser].id;
            [[weakSelf getViewController].navigationController pushViewController:vc animated:YES ];
        }else{
            [[weakSelf getViewController].navigationController pushViewController:[JCSettingVC new] animated:YES];
        }

    }];
    

    [self.yhqView bk_whenTapped:^{
        if (![JCWUserBall currentUser]) {
            [weakSelf presentLogin];
            return ;
        }
        JCYCHongBaoWMVC *vc= [JCYCHongBaoWMVC new];
        [[weakSelf getViewController].navigationController pushViewController:vc animated:YES];
    }];
    
    

    [self.gzView bk_whenTapped:^{
        if (![JCWUserBall currentUser]) {
            [weakSelf presentLogin];
            return ;
        }
        JCMyConcernExpertWMVC *vc= [JCMyConcernExpertWMVC new];
        [[weakSelf getViewController].navigationController pushViewController:vc animated:YES];
    }];
    

    [self.msgView bk_whenTapped:^{
        if (![JCWUserBall currentUser]) {
            [weakSelf presentLogin];
            return ;
        }
        JCMessageCenterVC *vc= [JCMessageCenterVC new];
        [[weakSelf getViewController].navigationController pushViewController:vc animated:YES];
    }];
    
    
    [self.qyLab bk_whenTapped:^{
        if (weakSelf.JCQianYueBlock) {
            weakSelf.JCQianYueBlock();
        }
    }];
    
}

- (void)clearUser {
   
    [self refreshUserData];
}

- (UIImageView *)headImgView {
    if (!_headImgView) {
        _headImgView = [UIImageView new];
        _headImgView.image = JCIMAGE(@"userImg_default");
        [_headImgView hg_setAllCornerWithCornerRadius:AUTO(24)];
        _headImgView.userInteractionEnabled = YES;
    }
    return _headImgView;
}

- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab = [UILabel labelTitle:@"" andFont:AUTO(18) andWeight:2 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _nameLab;
}

- (UILabel *)fensiLab {
    if (!_fensiLab) {
        _fensiLab = [UILabel labelTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _fensiLab;
}

- (UIImageView *)moneyImageView {
    if (!_moneyImageView) {
        _moneyImageView = [UIImageView new];
        _moneyImageView.image = JCIMAGE(@"jinrongxianxingge-");
    }
    return _moneyImageView;
}

- (UILabel *)moneyLab {
    if (!_moneyLab) {
        _moneyLab = [UILabel initWithTitle:@"0" andFont:AUTO(28) andWeight:2 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
        _moneyLab.userInteractionEnabled = YES;
    }
    return _moneyLab;
}

- (UILabel *)moneyInfoLab {
    if (!_moneyInfoLab) {
        _moneyInfoLab = [UILabel initWithTitle:@"全部红币" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _moneyInfoLab.userInteractionEnabled = YES;
    }
    return _moneyInfoLab;
}

- (UIButton *)rechargeBtn {
    if (!_rechargeBtn) {
        _rechargeBtn = [UIButton initWithText:@"充值" FontSize:AUTO(14) Weight:2 BackGroundColor:JCBaseColor TextColors:JCWhiteColor];
        _rechargeBtn.userInteractionEnabled = YES;
        _rechargeBtn.layer.cornerRadius = AUTO(15);
        _rechargeBtn.layer.masksToBounds = YES;
    }
    return _rechargeBtn;
}

- (UIView *)userBackView {
    if (!_userBackView) {
        _userBackView = [UIView new];
        _userBackView.userInteractionEnabled = YES;
        _userBackView.backgroundColor = JCWhiteColor;
        [_userBackView hg_setAllCornerWithCornerRadius:AUTO(5)];
    }
    return _userBackView;
}

- (UILabel *)loginLab {
    if (!_loginLab) {
        _loginLab = [UILabel labelTitle:@"登录" andFont:AUTO(14) andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _loginLab.userInteractionEnabled = YES;
        _loginLab.layer.borderColor = JCWhiteColor.CGColor;
        _loginLab.layer.borderWidth = 1;
        _loginLab.layer.cornerRadius = AUTO(15);
        _loginLab.layer.masksToBounds = YES;
    }
    return _loginLab;
}

- (UILabel *)qyLab {
    if (!_qyLab) {
        _qyLab = [UILabel labelTitle:@"申请签约" andFont:AUTO(14) andWeight:2 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _qyLab.userInteractionEnabled = YES;
        _qyLab.layer.borderColor = JCWhiteColor.CGColor;
        _qyLab.layer.borderWidth = 1;
        _qyLab.layer.cornerRadius = AUTO(15);
        _qyLab.layer.masksToBounds = YES;
        
    }
    return _qyLab;
}



- (void)addCornerWithView:(UIView *)aView type:(UIRectCorner)aCorners size:(CGSize)aSize
{
    // 根据矩形画带圆角的曲线
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:aView.bounds byRoundingCorners:aCorners cornerRadii:aSize];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = aView.bounds;
    maskLayer.path = maskPath.CGPath;
    maskLayer.backgroundColor = (__bridge CGColorRef _Nullable)([UIColor whiteColor]);
    aView.layer.mask = maskLayer;
}

- (UIView *)topBgView {
    if (!_topBgView) {
        _topBgView = [UIView new];

    }
    return _topBgView;
}

- (UIView *)userInfoView {
    if (!_userInfoView) {
        _userInfoView = [UIView new];
        _userInfoView.userInteractionEnabled = YES;
    }
    return _userInfoView;
}

- (UIImageView *)indicateImgView {
    if (!_indicateImgView) {
        _indicateImgView = [UIImageView new];
        _indicateImgView.image = JCIMAGE(@"minie_whiteback");
    }
    return _indicateImgView;
}
-(UIImageView *)qyImgView {
    if (!_qyImgView) {
        _qyImgView = [UIImageView new];
        _qyImgView.image = JCIMAGE(@"ic_qy");
        _qyImgView.hidden  = YES;
    }
    return _qyImgView;
}
- (UIView *)itemBgView {
    if (!_itemBgView) {
        _itemBgView = [UIView new];
    }
    return _itemBgView;
}

- (JCMineHeadItemView *)yhqView {
    if (!_yhqView) {
        _yhqView = [JCMineHeadItemView new];
        _yhqView.title = @"优惠券";
        _yhqView.redView.hidden = YES;
    }
    return _yhqView;
}

- (JCMineHeadItemView *)gzView {
    if (!_gzView) {
        _gzView = [JCMineHeadItemView new];
        _gzView.title = @"关注";
        _gzView.redView.hidden = YES;
    }
    return _gzView;
}

- (JCMineHeadItemView *)msgView {
    if (!_msgView) {
        _msgView = [JCMineHeadItemView new];
        _msgView.title = @"消息";
        _msgView.isMsg = YES;
    }
    return _msgView;
}

@end
