//
//  JCAcitvityTool.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/4/19.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCAcitvityTool.h"

@implementation JCAcitvityTool

- (void)showActivityPresentWithPosition:(NSString *)position ViewController:(UIViewController *)viewController {
    self.viewController = viewController;
    JCActivityService *service = [JCActivityService new];
    [service getActivityPresentWithPosition:position success:^(id  _Nullable object) {
        if ([JCWJsonTool isSuccessResponse:object]) {
            NSArray *array = [NSArray yy_modelArrayWithClass:[JCWSlideBall class] json:object[@"data"]];
            self.activtyArray = [NSMutableArray arrayWithArray:array];
            if (self.activtyArray.count>0) {
                [self showActivityViewWithVC:self.viewController];
            }


        }
           
        
    } failure:^(NSError * _Nonnull error) {
        
    }];

}

- (void)showActivityViewWithVC:(UIViewController *)viewController {
    if (self.activtyArray.count>0) {
        JCActivityTipView *activityTipView = [JCActivityTipView new];
        JCWSlideBall *actModel = self.activtyArray.firstObject;
        [activityTipView.imgView sd_setImageWithURL:[NSURL URLWithString:actModel.img_url]];
        activityTipView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        [self.jcWindow addSubview:activityTipView];
//        WeakSelf;
        __weak typeof(self)weakSelf = self;
        activityTipView.JCSureBlock = ^{
            __strong typeof(weakSelf) strongSelf = weakSelf;
            [weakSelf.activtyArray removeObject:actModel];
            if ([actModel.type integerValue]==2||[actModel.type integerValue]==3) {
                JCActivityDetailCommomVC *vc = [JCActivityDetailCommomVC new];
                vc.actID = actModel.id;
                [viewController.navigationController pushViewController:vc animated:YES];
                vc.JCCancelBlock = ^{
                    [strongSelf showActivityViewWithVC:strongSelf.viewController];
                };
            }
            if ([actModel.type integerValue]==4) {
                JCActivityGuessVC *vc = [JCActivityGuessVC new];
                vc.actID = actModel.id;
                [viewController.navigationController pushViewController:vc animated:YES];

                vc.JCCancelBlock = ^{
                    [strongSelf showActivityViewWithVC:strongSelf.viewController];
                };
            }

        };
        activityTipView.JCCancelBlock = ^{
            __strong typeof(weakSelf) strongSelf = weakSelf;
            [strongSelf.activtyArray removeObject:actModel];
            [strongSelf showActivityViewWithVC:strongSelf.viewController];
        };
    }

}

- (UIWindow *)jcWindow {
    return [UIApplication sharedApplication].keyWindow;
}

@end
