//
//  JCTuiJianManager.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/27.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCTuiJianManager.h"
#import "JCHongbangBuylWMstckyVC.h"
#import "JCHongbangDetailWMstckyVC.h"
#import "JCDakaBuyPlanStickWMVC.h"
#import "JCDakaPlanDetailStickWMVC.h"
#import "JCWMyHongbaoBall.h"
#import "JCHongbangOrderWMstckyVC.h"
#import "JCPlaneDetailQRModel.h"
@implementation JCTuiJianManager
//从我的购买记录进去,需要传type=2和order_id,其他页面进去不用
+ (void)getTuiJianDetailWithTuiJianID:(NSString *)tuijian_id orderID:(NSString *)order_id type:(NSString *)type  WithViewController:(UIViewController *)viewController is_push:(BOOL)push success:(successBlocks)successBlock {
    [[UIApplication sharedApplication].keyWindow showLoading];
    JCHomeService_New *service = [JCHomeService_New new];
    [service getHongbang_TuijianDetailWithTuijian_id:tuijian_id orderID:order_id type:type Success:^(id  _Nullable object) {
        [[UIApplication sharedApplication].keyWindow endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
           
            JCHongbangDetailModel *detailModel = (JCHongbangDetailModel *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCHongbangDetailModel class]];
            detailModel.talent_plan.user = detailModel.tuijian_pay;
            detailModel.talent_plan.is_pay_show = detailModel.talent_plan.is_pay;
            if ([detailModel.talent_plan.all_wl integerValue]>0) {
                detailModel.talent_plan.is_pay = @"1";//如果是已开奖,是可以查看的,所以这边归置为已购买
            }

            if ([detailModel.talent_plan.is_free intValue]==0) {
                //免费
                JCHongbangDetailWMstckyVC * detailVC = [JCHongbangDetailWMstckyVC new];
                detailVC.tjInfoId = detailModel.talent_plan.id;
                detailVC.detailModel = detailModel;
                 [viewController.navigationController pushViewController:detailVC animated:YES];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [self clearPopVCWithVC:viewController];
                });
            }else{
                
                
                if ([detailModel.talent_plan.is_pay intValue]==1||[detailModel.talent_plan.is_pay intValue]==2) {
//                    is_pay  0未购买   1已购买   2已退款
//                    refund_type   退款类型   0未退款   1不中返还退款  2系统退款  3申请退款
                    if ([detailModel.talent_plan.refund_type intValue]==3&&[detailModel.talent_plan.is_pay intValue]==2) {
                        //主动申请的退款需要重新购买才能看
                        JCHongbangBuylWMstckyVC * detailVC = [JCHongbangBuylWMstckyVC new];
                        detailVC.tjInfoId = detailModel.talent_plan.id;
                        detailVC.detailModel = detailModel;
                          [viewController.navigationController pushViewController:detailVC animated:YES];
                        return;
                    }
                    
                    //已购买
                    JCHongbangDetailWMstckyVC * detailVC = [JCHongbangDetailWMstckyVC new];
                    detailVC.tjInfoId = detailModel.talent_plan.id;
                    detailVC.detailModel = detailModel;
                     [viewController.navigationController pushViewController:detailVC animated:YES];
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        [self clearPopVCWithVC:viewController];
                    });
                    
                    
                    
                } else{

                    //需要购买
                    JCHongbangBuylWMstckyVC * detailVC = [JCHongbangBuylWMstckyVC new];
                    detailVC.tjInfoId = detailModel.talent_plan.id;
                    detailVC.detailModel = detailModel;
                      [viewController.navigationController pushViewController:detailVC animated:YES];
                 
                }
                
            }
//            if (successBlock) {
//                successBlock();
//            }
            
            
        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [JCWToastTool showHint:@"网络异常"];
        [[UIApplication sharedApplication].keyWindow endLoading];
    }];


}
//从我的购买记录进去,需要传type=2和order_id,其他页面进去不用
+ (void)loadGZH_ArticleDetailWithArticleID:(NSString *)ID orderID:(NSString *)order_id type:(NSString *)type WithViewController:(UIViewController *)viewController is_push:(BOOL)push {
    [[UIApplication sharedApplication].keyWindow showLoading];
    JCHomeService_New *service = [JCHomeService_New service];
    [service getGZHT_TuijianDetailWithTuijian_id:ID orderID:order_id type:type Success:^(id  _Nullable object) {
        [[UIApplication sharedApplication].keyWindow endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
             JCWTjInfoBall *model = (JCWTjInfoBall *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCWTjInfoBall class]];
            if (model.is_pay==1||model.is_pay==2) {
                if ([model.refund_type integerValue]==3&&model.is_pay==2) {
                    JCWTjInfoBall *model = (JCWTjInfoBall *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCWTjInfoBall class]];
                    //需要支付
                    JCDakaBuyPlanStickWMVC *vc = [JCDakaBuyPlanStickWMVC new];
                    vc.payInfoModel = model;
//                    vc.autherID = model.user_id;
                    [viewController.navigationController pushViewController:vc animated:YES];
                    
                    


                    
                    return;
                }
                //可以直接查看
                 JCWTjInfoBall *model = (JCWTjInfoBall *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCWTjInfoBall class]];

                
                JCDakaPlanDetailStickWMVC *vc = [JCDakaPlanDetailStickWMVC new];
                vc.autherID = model.user_id;
                vc.planDetailModel = model;
                [viewController.navigationController pushViewController:vc animated:YES];
                
                //清空购买页,避免重复返回购买页
                NSMutableArray*tempMarr = [NSMutableArray arrayWithArray : viewController.navigationController.viewControllers];
                //    [tempMarr removeObject:weakSelf];
                    for (UIViewController *vc in viewController.navigationController.viewControllers) {
                        if ([vc isKindOfClass:[JCDakaBuyPlanStickWMVC class]]) {
                            [tempMarr removeObject:vc];
                        }
                    }
                    [viewController.navigationController setViewControllers:tempMarr animated:YES];
                
            }else{
                //是否免费 1付费方案 0免费方案
                if (model.is_free==0) {
                    //免费方案可直接查看
                    JCWTjInfoBall *model = (JCWTjInfoBall *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCWTjInfoBall class]];
                    

                   JCDakaPlanDetailStickWMVC *vc = [JCDakaPlanDetailStickWMVC new];
                   vc.autherID = model.user_id;
                   vc.planDetailModel = model;
                   [viewController.navigationController pushViewController:vc animated:YES];
                }else{

                    
                    JCWTjInfoBall *model = (JCWTjInfoBall *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCWTjInfoBall class]];
                    //需要支付
                    JCDakaBuyPlanStickWMVC *vc = [JCDakaBuyPlanStickWMVC new];
                    vc.payInfoModel = model;
//                    vc.autherID = model.user_id;
                    [viewController.navigationController pushViewController:vc animated:YES];
                    
                }
                
                
                
            }

        }else {
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [[UIApplication sharedApplication].keyWindow endLoading];
    }];

}

+ (void)clearPopVCWithVC:(UIViewController *)viewController {
    NSMutableArray*tempMarr = [NSMutableArray arrayWithArray : viewController.navigationController.viewControllers];
//    [tempMarr removeObject:weakSelf];
    NSArray *array=  viewController.navigationController.viewControllers;
    for (UIViewController *vc  in array) {
        if ([vc isKindOfClass:[JCHongbangBuylWMstckyVC class]]||[vc isKindOfClass:[JCHongbangOrderWMstckyVC class]]) {
            [tempMarr removeObject:vc];
        }
    }
    [viewController.navigationController setViewControllers:tempMarr animated:YES];
}

@end
