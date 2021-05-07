//
//  JCPostCheckFailVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/3.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCPostCheckFailVC.h"

@interface JCPostCheckFailVC ()

@end

@implementation JCPostCheckFailVC

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

    self.title = @"申请发帖";
    [self initView];
    [self refreshData];
}
- (void)refreshData {
//    changeMyCheckStatusWithsuccess
    if ([[JCWUserBall currentUser].fabu intValue]!=4) {
        return;
    }
    JCUserService_New *service = [JCUserService_New new];
    [service changeMyCheckStatusWithsuccess:^(id  _Nullable object) {
         if ([JCWJsonTool isSuccessResponse:object]) {
             JCWUserBall *user =  [JCWUserBall currentUser];
             user.fabu = @"0";
             [JCWUserBall save:user];
         }
    } failure:^(NSError * _Nonnull error) {
        
    }];
}

- (void)initView {
    UIView *colorView = [UIView new];
    [self.view addSubview:colorView];
    colorView.backgroundColor  = COLOR_F0F0F0;
    [colorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.mas_equalTo(AUTO(10));
    }];
    
    
    UIImageView *imgView = [UIImageView new];
    imgView.alpha = 0.5;
    imgView.image = JCIMAGE(@"post_img_sqmg");
    [self.view addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(80));
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(AUTO(276), AUTO(225)));
    }];
    
    UILabel *titleLab = [UILabel initWithTitle:@"很遗憾您的申请没有通过！" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.view addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imgView.mas_bottom).offset(AUTO(30));
        make.centerX.equalTo(self.view);
    }];
    
    UILabel *infLab = [UILabel initWithTitle:[NSString stringWithFormat:@"请联系官方客服微信处理，微信号%@",[JCConfigModel currentConfigModel].customer] andFont:AUTO(14) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.view addSubview:infLab];
    [infLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLab.mas_bottom).offset(AUTO(10));
        make.centerX.equalTo(self.view);
    }];
    
    UIButton *backBtn = [UIButton initWithText:@"复制客服微信，去解决" FontSize:AUTO(16) Weight:2 BackGroundColor:JCBaseColor TextColors:JCWhiteColor];
    [backBtn hg_setAllCornerWithCornerRadius:AUTO(22)];
    [self.view addSubview:backBtn];
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(infLab.mas_bottom).offset(AUTO(44));
        make.size.mas_equalTo(CGSizeMake(AUTO(275), AUTO(50)));
    }];

    [backBtn bk_whenTapped:^{
        UIPasteboard * pasteBoard = [UIPasteboard generalPasteboard];
        pasteBoard.string = @"jingcaigood2";
        [JCWToastTool showHint:@"已复制到黏贴版"];
    }];
    

}

@end
