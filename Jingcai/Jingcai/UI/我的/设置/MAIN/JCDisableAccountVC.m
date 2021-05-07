//
//  JCDisableAccountVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/2/3.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCDisableAccountVC.h"
#import "JCDisableAccountCheckVC.h"
#import <WKWebView+AFNetworking.h>
#import <WebKit/WebKit.h>
@interface JCDisableAccountVC ()<WKNavigationDelegate>

@property (strong, nonatomic) WKWebView * webView;

@property (assign, nonatomic) NSInteger count;

@end

@implementation JCDisableAccountVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"申请注销账号";
    [self initSubViews];
    [self refreshData];
}

- (void)refreshData {
    [self.view showLoading];
    JCUserService_New * service = [JCUserService_New service];
    [service disableAccountTextWithoperation:@"1" mobile:@"" code:@"" Success:^(id  _Nullable object) {
        [self.view endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            NSString *count = object[@"data"][@"count"];
            self.count = [count integerValue];
            
            NSString *content = object[@"data"][@"html_text"];
            NSString *str = [content stringByAppendingString: @"<html><head><meta content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0\" name=\"viewport\"><style type=\"text/css\"></style></head><body></body></html>"];
            [self.webView loadHTMLString:str baseURL:nil];

            return;
        }
        [JCWToastTool showHint:object[@"msg"]];

    } failure:^(NSError * _Nonnull error) {
        [self.view endLoading];
    }];

}

- (void)initSubViews {
    
    [self.view addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.bottom.offset(AUTO(-75-kBottomTabSafeAreaHeight));
    }];
    
    UIButton *sureBtn = [UIButton initWithText:@"已清楚风险，确认注销" FontSize:AUTO(16) BackGroundColor:JCBaseColor TextColor:JCWhiteColor];
    [sureBtn hg_setAllCornerWithCornerRadius:AUTO(22.5)];
    [self.view addSubview:sureBtn];
    [sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.bottom.offset(AUTO(-15-kBottomTabSafeAreaHeight));
        make.height.mas_equalTo(AUTO(45));
        
    }];
    [sureBtn addTarget:self action:@selector(sureBtnClick) forControlEvents:UIControlEventTouchUpInside];

}

- (void)sureBtnClick {
    if ([JCWUserBall currentUser].user_phone.length==0) {
        //没有绑定手机号,则不用验证手机号,直接注销.否则需要验证手机号
        [self disableMyAccount];
    }else{
        if (self.count==0) {
            [self.navigationController pushViewController:[JCDisableAccountCheckVC new] animated:YES];
        }else {

            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"" message:@"您的账号已经注销过一次了，此手机号本次注销后将被冻结30天才可再进行注册！是否确认注销？" preferredStyle:UIAlertControllerStyleAlert];
            [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
            [alertController addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [self.navigationController pushViewController:[JCDisableAccountCheckVC new] animated:YES];

            }]];
            [self presentViewController:alertController animated:YES completion:nil];


        }
    }

    
}

- (void)disableMyAccount {

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"" message:@"您的账号未绑定手机,注销后该账号信息将无法查询,是否确认注销?" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.view showLoading];
        JCUserService_New * service = [JCUserService_New service];
        [service disableAccountTextWithoperation:@"3" mobile:@"" code:@"" Success:^(id  _Nullable object) {
            [self.view endLoading];
            if ([JCWJsonTool isSuccessResponse:object]) {
                [JCWToastTool showHint:@"账号注销成功！"];
                [JCWUserBall logOut];
                [self.navigationController popToRootViewControllerAnimated:YES];
                [[NSNotificationCenter defaultCenter] postNotificationName:NotificationUserLogout object:nil];
                return;
            }
            [JCWToastTool showHint:object[@"msg"]];

        } failure:^(NSError * _Nonnull error) {
            [self.view endLoading];
        }];
        
    }]];
    [self presentViewController:alertController animated:YES completion:nil];

}


- (WKWebView *)webView {
    if (!_webView) {
        _webView = [WKWebView new];
        _webView.scrollView.showsVerticalScrollIndicator = NO;
        _webView.scrollView.showsHorizontalScrollIndicator = NO;
        _webView.navigationDelegate = self;
        
        _webView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
//        _webView.scrollView.scrollEnabled = NO;
        _webView.userInteractionEnabled = YES;
//        _webView.contentScaleFactor = 1;
    }
    return _webView;
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
