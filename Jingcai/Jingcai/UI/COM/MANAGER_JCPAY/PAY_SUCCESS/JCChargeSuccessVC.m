//
//  JCChargeSuccessVC.m
//  Jingcai
//
//  Created by Administrator on 2019/5/15.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCChargeSuccessVC.h"

@interface JCChargeSuccessVC ()
@property (weak, nonatomic) IBOutlet UILabel *payNumLabel;
@end

@implementation JCChargeSuccessVC
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"充值成功";
    self.payNumLabel.text = [NSString stringWithFormat:@"%.2f",1.0*self.payNum/100];
}
- (IBAction)doneBtnClick:(UIButton *)sender {
     [self dismissViewControllerAnimated:YES completion:nil];
//    if (!self.navigationController || self.navigationController.viewControllers.count < 2) {
//        return ;
//    }
//    if (self.navigationController.viewControllers.count == 2) {
//        [self.navigationController popViewControllerAnimated:YES];
//        return ;
//    }
//    [self.navigationController popToViewController:self.navigationController.viewControllers[self.navigationController.viewControllers.count-3] animated:YES];
}
@end
