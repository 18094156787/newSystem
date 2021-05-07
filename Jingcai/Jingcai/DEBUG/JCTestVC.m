//
//  JCTestVC.m
//  Jingcai
//
//  Created by Administrator on 2019/4/12.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCTestVC.h"
#import "JCFreeView.h"
#import "JCWToastTool.h"
#import "JCWJsonTool.h"
#import "JCWUserBall.h"
#import "JCAiProfitDetailVC.h"
@interface JCTestVC () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray * dataArray;
@property (nonatomic, strong) UITextField *userTF;
@property (nonatomic, strong) NSString *userID;
@end

@implementation JCTestVC
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"DEBUG.";
}
- (NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = @[@"模拟登录",@"切换服务器环境",@"环形图"];
    }
    return _dataArray;
}

#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * cellId = @"cellId";
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    if (indexPath.row == 0) {
        WeakSelf;
 
        [UIAlertController alertTitle:@"模拟登陆" mesasge:@"输入用户id" addTextField:^(UITextField *textFild) {
            self.userTF = textFild;
        } confirmHandler:^(UIAlertAction *confirmAction) {
            if (self.userTF.text.length==0) {
                return ;
            }


            
            
            
        } cancelHandler:^(UIAlertAction *cancleAction) {
            
        } showViewController:self];
        
    }
    if (indexPath.row == 1) {
        NSString *url = [[NSUserDefaults standardUserDefaults] objectForKey:JCEnvironmentUrl];
        NSString *title = @"当前处于 《正式服务器》";
        BOOL value = (url||[url isEqualToString:@"0"]);
        if (value) {
            title = @"当前处于 《测试服务器》";
        }
        NSString *msg = @"是否切换到 《测试服务器》";
        if (value) {
            msg = @"是否切换到 《正式服务器》";
        }
        
        [UIAlertController alertTitle:title mesasge:msg alertControllerStyle:1 confirmHandler:^(UIAlertAction *confirmAction) {
            if (value) {
                //切换到正式服
                [[NSUserDefaults standardUserDefaults] removeObjectForKey:JCEnvironmentUrl];
                
            }else{
                //切换到测试服
                [[NSUserDefaults standardUserDefaults] setObject:@"0" forKey:JCEnvironmentUrl];
            }
            
            [self dismissViewControllerAnimated:YES completion:^{
                if (value) {
                    [JCWToastTool showHint:@"成功切换到正式服,请重新启动app"];
                }else{
                    [JCWToastTool showHint:@"成功切换到测试服,请重新启动app"];
                }
                
            }];
        } cancelHandler:^(UIAlertAction *cancleAction) {
            
        } showViewController:self];
        
    }
    if (indexPath.row==2) {
        [self presentViewController:[JCAiProfitDetailVC new] animated:YES completion:^{
            
        }];
    }

//    if (indexPath.row == 3) {
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"itms-services://?action=download-manifest&url=https%3A%2F%2Fdownload.fir.im%2Fapps%2F5c60eb75959d694783eae8ae%2Finstall%3Fdownload_token%3De38c2898395e29164e420b6f3b739a82%26release_id%3D5cc6c41a548b7a434021958f"] options:@{} completionHandler:nil];
//    }
//    if (indexPath.row == 4) {
//        [JCWUserBall logOut];
//        JCWUserBall * userBall = [JCWUserBall new];
//        [JCWUserBall save:userBall];
//        [JCWToastTool showHint:@"已写入"];
//    }
}

#pragma mark -
- (IBAction)closeBtnClick:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
