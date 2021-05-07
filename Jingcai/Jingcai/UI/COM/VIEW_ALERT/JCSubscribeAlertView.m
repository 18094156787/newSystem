//
//  JCSubscribeAlertView.m
//  Jingcai
//
//  Created by Rain on 2018/10/10.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCSubscribeAlertView.h"

@interface JCSubscribeAlertView ()
@property (weak, nonatomic) IBOutlet UIView * maskView;
@property (weak, nonatomic) IBOutlet UIView * alertView;
@property (weak, nonatomic) IBOutlet UILabel * msgLabel;
//@property (strong, nonatomic) NSString * msg;//提示文字
@end

@implementation JCSubscribeAlertView
- (void)awakeFromNib {
    [super awakeFromNib];
    self.baseAlertView = self.alertView;
    self.baseBackView = self.maskView;
}
- (IBAction)cancelBtnClick:(UIButton *)sender {
    [self hide];
}
- (IBAction)confirmBtnClick:(UIButton *)sender {
    [self hide];
    if (self.confirmBlock) {
        self.confirmBlock();
    }
}
- (void)setIsAdd:(BOOL)isAdd {
    _isAdd = isAdd;
    _msgLabel.text = isAdd ? @"是否关注该专家" : @"是否取消关注该专家";
}

#pragma mark - 重载show方法
//- (void)show {
//    WeakSelf;
//    NSString * message = self.isAdd ? @"是否关注该专家" : @"是否取消关注该专家";
//    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"温馨提示" message:message preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//        //取消按钮的回调
//    }];
//    UIAlertAction * submitAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        if (weakSelf.confirmBlock) {
//            weakSelf.confirmBlock();
//        }
//    }];
//    [alertController addAction:cancelAction];
//    [alertController addAction:submitAction];
//    UIViewController * currentVC = [UIApplication sharedApplication].delegate.window.rootViewController;
//    [currentVC presentViewController:alertController animated:YES completion:nil];
//}
@end
