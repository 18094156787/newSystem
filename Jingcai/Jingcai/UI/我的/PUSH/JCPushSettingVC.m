//
//  JCPushSettingVC.m
//  Jingcai
//
//  Created by Administrator on 2019/2/1.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCPushSettingVC.h"
#import "JCPushSettingCell.h"
#import "JCWAppTool.h"
#import "JCWJsonTool.h"
#import "JCJPushManager.h"
#import "JCWSettingBall.h"

@interface JCPushSettingVC () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView * tableView;
//@property (strong, nonatomic) JCPushSettingCell * cell;
@end

@implementation JCPushSettingVC

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
    self.navigationItem.title = @"推送设置";
    self.view.backgroundColor = COLOR_F0F0F0;

    
    [self.tableView registerNib:[UINib nibWithNibName:@"JCPushSettingCell" bundle:nil] forCellReuseIdentifier:@"JCPushSettingCell"];
    
    //用户保存推送设置,如果没有则创建一个.
    JCWSettingBall * settingBall = [JCWSettingBall currentSetting];
    if (!settingBall) {
        settingBall = [[JCWSettingBall alloc] init];
        //默认需要是打开状态
        settingBall.isCustomPushOn = YES;
        //需要保存一下 否则有问题
        [JCWSettingBall save:settingBall];
    }
    
    UIView *colorView = [UIView new];
    colorView.backgroundColor = COLOR_F0F0F0;
    colorView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(8));
    self.tableView.tableHeaderView = colorView;
}

#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JCPushSettingCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCPushSettingCell"];
    cell.isOn = [[JCWUserBall currentUser].tuisong integerValue]==1?YES:NO;
    WeakSelf;
    cell.swichBlock = ^(BOOL isOn, JCPushSettingCell *pushSettingCell) {
//        //加载动画
        [pushSettingCell showLoading];

        JCUserService_New *service = [JCUserService_New new];
        [service openPushWithSuccess:^(id  _Nullable object) {
            [pushSettingCell hideLoading];
            if ([JCWJsonTool isSuccessResponse:object]) {
                JCWUserBall *user =   [JCWUserBall currentUser];
                user.tuisong = object[@"data"][@"result"];
                [JCWUserBall save:user];
                [weakSelf.tableView reloadData];
                
            }else{
                [JCWToastTool showHint:object[@"msg"]];
            }
            
        } failure:^(NSError * _Nonnull error) {
            [pushSettingCell hideLoading];
            
        }];
        
    };
    return cell;
}

- (void)reloadSetting {
    [self.tableView reloadData];
}
@end
