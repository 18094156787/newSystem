//
//  JCDaShangSuccessVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/8.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCDaShangSuccessVC.h"

@interface JCDaShangSuccessVC ()

@end

@implementation JCDaShangSuccessVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)initSubViews {
    UIImageView *imgView = [UIImageView new];
    imgView.image = JCIMAGE(@"jc_ds_success");
    [self.view addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.offset(AUTO(80));
        make.size.mas_equalTo(CGSizeMake(AUTO(255), AUTO(233)));
    }];
    
    UILabel *infoLab = [UILabel initWithTitle:@"谢谢您的支持\n我们必将再接再厉产出更好的内容！" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:infoLab];
    [infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imgView.mas_bottom);
        make.left.right.offset(0);
    }];
    
    UIButton *sureBtn = [UIButton initWithText:@"完成" FontSize:AUTO(16) Weight:2 BackGroundColor:JCBaseColor TextColors:JCWhiteColor];
    [sureBtn hg_setAllCornerWithCornerRadius:4];
    [self.view addSubview:sureBtn];
    [sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(infoLab.mas_bottom).offset(AUTO(64));
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(AUTO(176), AUTO(40)));
    }];
    
    WeakSelf;
    [sureBtn bk_whenTapped:^{
        [weakSelf.navigationController popViewControllerAnimated:YES];
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
