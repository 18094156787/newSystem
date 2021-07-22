//
//  JCPageRedirectManager.m
//  Jingcai
//
//  Created by Rain on 2018/11/27.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCPageRedirectManager.h"
#import "JCMainTabBarController.h"
#import "JCBaseNavigationController.h"
#import "JCWUserBall.h"
#import "JCChargeVC.h"
#import "UIView+CurrentVC.h"
#import "JCMyHongbaoVC.h"
#import "JCPageRedirectManager.h"
#import "JCYCMyFriendViewController.h"
#import "JCHongbangWMstckyVC.h"
#import "JCYCHongBaoWMVC.h"
#import "JcActivitySquareVC.h"
#import "JCHongbangWMstckyVC.h"
#import "JCFootBallAuthorDetailWMViewController.h"
#import "JCActivityDetailCommomVC.h"
#import "JCActivityGuessVC.h"
#import "JCActivityKindVC.h"
#import "JCActivityGuess_SPF_VC.h"
#import "JCArticleDetailVC.h"
@interface JCPageRedirectManager ()
@property (nonatomic, strong) JCMainTabBarController * tabBarController;

@end

@implementation JCPageRedirectManager
+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    static JCPageRedirectManager *instance;
    dispatch_once(&onceToken, ^{
        instance = [[JCPageRedirectManager alloc] init];
    });
    return instance;
}
+ (void)redirectWithRoute:(NSString *)route vc:(UIViewController *)vc {
    //充值
    if ([route isEqualToString:@"mine_charge"]) {
        [[JCPageRedirectManager sharedManager] redirectToCharge];
        return ;
    }
//    我的红包
    if ([route isEqualToString:@"mine_hongbao"]) {
        [[JCPageRedirectManager sharedManager] redirectToHongbao];
        return ;
    }
    //邀请新人
    if ([route isEqualToString:@"mine_88"]) {
        [[JCPageRedirectManager sharedManager] redirectToInviteFriend];
        return ;
    }
    //全民预测
    if ([route isEqualToString:@"mine_guess"]) {
        [[JCPageRedirectManager sharedManager] redirectToMyGuess];
        return ;
    }
    //活动广场
    if ([route isEqualToString:@"mine_huodong"]) {
        [[JCPageRedirectManager sharedManager] redirectToActivity];
        return ;
    }
    //跳转公众号专家
    if ([route hasPrefix:@"expert_"]) {
        NSArray *array = [route componentsSeparatedByString:@"_"];
        if (array.count==2) {
            NSString *userID = array[1];
            [[JCPageRedirectManager sharedManager] redirectToGZH_ExpertWithUserID:userID ViewController:vc];
            
        }
        return ;
    }
    //跳转公众号文章详情
    if ([route hasPrefix:@"expertArticle_"]) {
        NSArray *array = [route componentsSeparatedByString:@"_"];
        if (array.count==2) {
            NSString *articleID = array[1];
            [[JCPageRedirectManager sharedManager] redirectToGZH_ArticleWithArticleID:articleID ViewController:vc];
            
        }

        return ;
    }
    //跳转红榜专家
    if ([route hasPrefix:@"talent_"]) {
        NSArray *array = [route componentsSeparatedByString:@"_"];
        if (array.count==2) {
            NSString *userID = array[1];
            [[JCPageRedirectManager sharedManager] redirectToHB_ExpertWithUserID:userID ViewController:vc];
        }
        return ;
    }
    //跳转红榜文章详情
    if ([route hasPrefix:@"talentArticle_"]) {
        NSArray *array = [route componentsSeparatedByString:@"_"];
        if (array.count==2) {
            NSString *articleID = array[1];
            [[JCPageRedirectManager sharedManager] redirectToHB_ArticleWithArticleID:articleID ViewController:vc];
        }
        return;

    }
    //跳转资讯文章详情
    if ([route hasPrefix:@"article_"]) {
        NSArray *array = [route componentsSeparatedByString:@"_"];
        if (array.count==2) {
            NSString *articleID = array[1];
            [[JCPageRedirectManager sharedManager] redirectToNews_ArticleWithArticalId:articleID ViewController:vc];
        }

        return ;
    }
    
    
}

//跳转公众号专家
- (void)redirectToGZH_ExpertWithUserID:(NSString *)userID ViewController:(UIViewController *)viewController {
    JCFootBallAuthorDetailWMViewController *vc = [JCFootBallAuthorDetailWMViewController new];
    vc.autherID = userID;
    [viewController.navigationController pushViewController:vc animated:YES];
 
}

//跳转公众号文章详情
- (void)redirectToGZH_ArticleWithArticleID:(NSString *)articleID ViewController:(UIViewController *)viewController {
    [JCTuiJianManager loadGZH_ArticleDetailWithArticleID:articleID orderID:@"" type:@"" WithViewController:viewController is_push:YES];

}

//红榜专家
- (void)redirectToHB_ExpertWithUserID:(NSString *)userID ViewController:(UIViewController *)viewController {
    
    JCHongbangWMstckyVC *vc = [JCHongbangWMstckyVC new];
    vc.autherID = userID;
    [viewController.navigationController pushViewController:vc animated:YES];

}



//跳转红榜文章详情
- (void)redirectToHB_ArticleWithArticleID:(NSString *)articleID ViewController:(UIViewController *)viewController {
    [JCTuiJianManager getTuiJianDetailWithTuiJianID:articleID orderID:@"" type:@"" WithViewController:viewController is_push:YES success:^{
    //
    }];
    
}

//跳转资讯文章详情
- (void)redirectToNews_ArticleWithArticalId:(NSString *)articalId ViewController:(UIViewController *)viewController {
    JCArticleDetailVC *vc = [JCArticleDetailVC new];
    vc.articalId = articalId;
    [viewController.navigationController pushViewController:vc animated:YES];

}





- (void)redirectToCharge {
    JCBaseViewController * currentVC = (JCBaseViewController *)[self.tabBarController.view getCurrentVC];
    if (![JCWUserBall currentUser]) {
        //JCBaseViewController * currentVC = self.tabBarController.viewControllers[self.tabBarController.selectedIndex];
        [currentVC presentLogin];
        return ;
    }
    [currentVC.navigationController pushViewController:[JCChargeVC new] animated:YES];
}
- (void)redirectToHongbao {
    JCBaseViewController * currentVC = (JCBaseViewController *)[self.tabBarController.view getCurrentVC];
    if (![JCWUserBall currentUser]) {
        //JCBaseViewController * currentVC = self.tabBarController.viewControllers[self.tabBarController.selectedIndex];
        [currentVC presentLogin];
        return ;
    }
    [currentVC.navigationController pushViewController:[JCYCHongBaoWMVC new] animated:YES];
}

- (void)redirectToInviteFriend {
    JCBaseViewController * currentVC = (JCBaseViewController *)[self.tabBarController.view getCurrentVC];
    if (![JCWUserBall currentUser]) {
        [currentVC presentLogin];
        return ;
    }
    [currentVC.navigationController pushViewController:[JCYCMyFriendViewController new] animated:YES];
}

- (void)redirectToMyGuess {
    [self.tabBarController showYCVC];
    
}

- (void)redirectToActivity {
    JCBaseViewController * currentVC = (JCBaseViewController *)[self.tabBarController.view getCurrentVC];
    [currentVC.navigationController pushViewController:[JcActivitySquareVC new] animated:YES];
}

- (JCMainTabBarController *)tabBarController {
    if (!_tabBarController) {
        _tabBarController = (JCMainTabBarController *)[UIApplication sharedApplication].delegate.window.rootViewController;
    }
    return _tabBarController;
}
- (void)redirectToTjUserWithTjUserId:(NSString *)tjUserId {
    JCBaseViewController * currentVC = (JCBaseViewController *)[self.tabBarController.view getCurrentVC];
    //防重复跳转
    if ([currentVC isKindOfClass:[JCHongbangWMstckyVC class]]) {
        JCHongbangWMstckyVC * userVC = (JCHongbangWMstckyVC *)currentVC;
        if ([userVC.autherID isEqualToString:tjUserId]) {
            return ;
        }
    }
    JCHongbangWMstckyVC * tjUserVC = [JCHongbangWMstckyVC new];
    tjUserVC.autherID = tjUserId;
    [currentVC.navigationController pushViewController:tjUserVC animated:YES];
}

#pragma mark--//网页超链接跳转

+ (void)jumpVCWithRoute:(NSString *)route vc:(UIViewController *)viewController {
    NSString *app_url =  [self getParamByName:@"app_url" URLString:route];
    NSString *app_weburl =  [self getParamByName:@"app_weburl" URLString:route];
    NSString *type =  [self getParamByName:@"type" URLString:route];
    NSString *ID =  [self getParamByName:@"id" URLString:route];
    if ([app_url isEqualToString:@"huodong"]) {
        if (ID.length>0) {
            if ([type integerValue]==2||[type integerValue]==3) {
                JCActivityDetailCommomVC *vc = [JCActivityDetailCommomVC new];
                vc.actID = ID;
                [viewController.navigationController pushViewController:vc animated:YES];
            }
            if ([type integerValue]==4) {

                JCActivityGuessVC *vc = [JCActivityGuessVC new];
                vc.actID = ID;
                [viewController.navigationController pushViewController:vc animated:YES];
            }
            if ([type integerValue]==5) {
                JCActivityKindVC *vc = [JCActivityKindVC new];
                vc.actID = ID;
                [viewController.navigationController pushViewController:vc animated:YES];
            }
            if ([type integerValue]==6) {
                JCActivityGuess_SPF_VC *vc = [JCActivityGuess_SPF_VC new];
                vc.actID = ID;
                [viewController.navigationController pushViewController:vc animated:YES];
            }
        }


        
    }
    if ([app_url isEqualToString:@"mine_expert"]) {
        //公众号专家
        if (ID.length==0) {
            return;
        }
        JCFootBallAuthorDetailWMViewController *vc = [JCFootBallAuthorDetailWMViewController new];
        vc.autherID = ID;
        [viewController.navigationController pushViewController:vc animated:YES];
        
        
        
    }
    if ([app_url isEqualToString:@"mine_talent"]) {
        //红榜达人
        if (ID.length==0) {
            return;
        }
        JCHongbangWMstckyVC *vc = [JCHongbangWMstckyVC new];
        vc.autherID = ID;
        [viewController.navigationController pushViewController:vc animated:YES];
        
    }
    if ([app_url isEqualToString:@"mine_expert_article"]) {
        //公众号方案
        if (ID.length==0) {
            return;
        }
        [JCTuiJianManager loadGZH_ArticleDetailWithArticleID:ID orderID:@"" type:@"" WithViewController:viewController is_push:YES];
        return;

        
    }
    if ([app_url isEqualToString:@"mine_talent_article"]) {
        //红榜达人方案
        if (ID.length==0) {
            return;
        }
        [JCTuiJianManager getTuiJianDetailWithTuiJianID:ID orderID:@"" type:@"" WithViewController:viewController is_push:YES success:^{
            
        }];
        
    }
    //充值页
    if ([app_url isEqualToString:@"mine_charge"]) {
        [[JCPageRedirectManager sharedManager] redirectToCharge];
        return ;
    }
//    我的红包
    if ([app_url isEqualToString:@"mine_hongbao"]) {
        [[JCPageRedirectManager sharedManager] redirectToHongbao];
        return ;
    }
    //邀请新人
    if ([app_url isEqualToString:@"mine_88"]) {
        [[JCPageRedirectManager sharedManager] redirectToInviteFriend];
        return ;
    }
    //全民预测
    if ([app_url isEqualToString:@"mine_guess"]) {
        [[JCPageRedirectManager sharedManager] redirectToMyGuess];
        return ;
    }
    //活动广场
    if ([app_url isEqualToString:@"mine_huodong"]) {
        [[JCPageRedirectManager sharedManager] redirectToActivity];
        return ;
    }
    //手机浏览器打开
    if ([app_url isEqualToString:@"mine_sys_web"]) {
        if (app_weburl.length>0) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:app_weburl] options:@{} completionHandler:nil];
        }

    }
    if (app_url.length==0&&app_weburl.length>0) {
        WebViewController *vc = [WebViewController new];
        vc.urlStr = app_weburl;
        [viewController.navigationController pushViewController:vc animated:YES];
    }
//    else{
//        if (app_weburl.length>0) {
//            WebViewController *vc = [WebViewController new];
//            vc.urlStr = app_weburl;
//            [viewController.navigationController pushViewController:vc animated:YES];
//        }
//
//    }
    
    

}
+ (NSString *)getParamByName:(NSString *)name URLString:(NSString *)url {

    NSError *error;
    NSString *regTags=[[NSString alloc] initWithFormat:@"(^|&|\\?)+%@=+([^&]*)(&|$)", name];
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regTags
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
     
    // 执行匹配的过程
    NSArray *matches = [regex matchesInString:url
                                      options:0
                                        range:NSMakeRange(0, [url length])];
    for (NSTextCheckingResult *match in matches) {
        NSString *tagValue = [url substringWithRange:[match rangeAtIndex:2]];  // 分组2所对应的串
        return tagValue;
    }
    return @"";
}
@end
