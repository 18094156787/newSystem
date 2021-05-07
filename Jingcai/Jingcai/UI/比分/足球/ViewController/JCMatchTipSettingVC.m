//
//  JCMatchTipSettingVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/16.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCMatchTipSettingVC.h"
#import "JCMatchTipSettingCell.h"
#import "SoundControlSingle.h"
@interface JCMatchTipSettingVC ()

@property (nonatomic,strong) NSString *is_gz;

@property (nonatomic,strong) NSString *is_voice;

@property (nonatomic,strong) NSString *is_shock;

@end

@implementation JCMatchTipSettingVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
    [self setNavBackImg];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"进球提醒设置";
    self.view.backgroundColor = COLOR_F0F0F0;
    [self initViews];
    [self getMatchTipSetting];
}

- (void)getMatchTipSetting {
    [self.view showLoading];
    JCMatchService_New *service = [JCMatchService_New new];
    [service getMatchEnterBallTipsWithOP:@"0" Value:@"" Success:^(id  _Nullable object) {
        [self endRefresh];
      if ([JCWJsonTool isSuccessResponse:object]) {
          NSString *is_gz = [NSString stringWithFormat:@"%@",object[@"data"][@"is_gz"]];
          NSString *is_voice = [NSString stringWithFormat:@"%@",object[@"data"][@"is_voice"]];
          NSString *is_shock = [NSString stringWithFormat:@"%@",object[@"data"][@"is_shock"]];
          if (is_gz.length>0) {
              [[NSUserDefaults standardUserDefaults] setValue:is_gz forKey:@"is_gz"];
          }
          if (is_voice.length>0) {
              [[NSUserDefaults standardUserDefaults] setValue:is_voice forKey:@"is_voice"];
          }
          if (is_shock.length>0) {
              [[NSUserDefaults standardUserDefaults] setValue:is_shock forKey:@"is_shock"];
          }
          self.is_gz = is_gz;
          self.is_voice = is_voice;
          self.is_shock = is_shock;
          [self.tableView reloadData];
      }else{
          [JCWToastTool showHint:object[@"msg"]];
      }

    } failure:^(NSError * _Nonnull error) {
        [self endRefresh];
    }];

}

- (void)initViews {
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(8));
    }];
    
    self.tableView.backgroundColor = COLOR_F4F6F9;
    [self.tableView registerClass:[JCMatchTipSettingCell class] forCellReuseIdentifier:@"JCMatchTipSettingCell"];
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"is_gz"]) {
        self.is_gz = [[NSUserDefaults standardUserDefaults] objectForKey:@"is_gz"];
    }else{
        self.is_gz = @"1";
    }
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"is_voice"]) {
        self.is_voice = [[NSUserDefaults standardUserDefaults] objectForKey:@"is_voice"];
    }else{
        self.is_voice = @"1";
    }
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"is_shock"]) {
        self.is_shock = [[NSUserDefaults standardUserDefaults] objectForKey:@"is_shock"];
    }else{
        self.is_shock = @"1";
    }
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 3;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JCMatchTipSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCMatchTipSettingCell"];

    if (indexPath.row==0) {
        cell.titleLab.text = @"仅提示我关注的";
        cell.switchBtn.hidden = NO;
        cell.is_on = self.is_gz;
    }
    if (indexPath.row==1) {
        cell.titleLab.text = @"声音";
        cell.switchBtn.hidden = NO;
        cell.is_on = self.is_voice;
    }
    if (indexPath.row==2) {
        cell.titleLab.text = @"震动";
        cell.switchBtn.hidden = NO;
        cell.is_on = self.is_shock;
    }
    cell.type = [NSString stringWithFormat:@"%ld",indexPath.row+1];
    WeakSelf;
    cell.JCSettingBlock = ^(NSString * _Nonnull type, NSString * _Nonnull is_on) {
        [weakSelf settingTipWithType:type is_on:is_on];
    };

    return cell;
}

- (void)settingTipWithType:(NSString *)type is_on:(NSString *)isOn {
       [self.view showLoading];

    JCMatchService_New *service = [JCMatchService_New new];
    [service getMatchEnterBallTipsWithOP:type Value:isOn Success:^(id  _Nullable object) {
        [self endRefresh];
      if ([JCWJsonTool isSuccessResponse:object]) {
          NSString *is_gz = [NSString stringWithFormat:@"%@",object[@"data"][@"is_gz"]];
          NSString *is_voice = [NSString stringWithFormat:@"%@",object[@"data"][@"is_voice"]];
          NSString *is_shock = [NSString stringWithFormat:@"%@",object[@"data"][@"is_shock"]];
          if (is_gz.length>0) {
              [[NSUserDefaults standardUserDefaults] setValue:is_gz forKey:@"is_gz"];
          }
          if (is_voice.length>0) {
              [[NSUserDefaults standardUserDefaults] setValue:is_voice forKey:@"is_voice"];
          }
          if (is_shock.length>0) {
              [[NSUserDefaults standardUserDefaults] setValue:is_shock forKey:@"is_shock"];
          }
          self.is_gz = is_gz;
          self.is_voice = is_voice;
          self.is_shock = is_shock;
          [self.tableView reloadData];
          [[NSNotificationCenter defaultCenter] postNotificationName:JCMatchEntetBallTip object:nil userInfo:nil];
      }else{
          [JCWToastTool showHint:object[@"msg"]];
      }

    } failure:^(NSError * _Nonnull error) {
        [self endRefresh];
    }];
//    [service getMatchEnterBallTipsSetttingWithParam:dic Success:^(id  _Nullable object) {
//          [self endRefresh];
//        if ([JCWJsonTool isSuccessResponse:object]) {
//            NSString *is_gz = object[@"data"][@"is_gz"];
//            NSString *is_voice = object[@"data"][@"is_voice"];
//            NSString *is_shock = object[@"data"][@"is_shock"];
//
//            if (is_gz.length>0) {
//                [[NSUserDefaults standardUserDefaults] setValue:is_gz forKey:@"is_gz"];
//                [[NSNotificationCenter defaultCenter] postNotificationName:JCMatchConcern object:nil];
//            }
//            if (is_voice.length>0) {
//                [[NSUserDefaults standardUserDefaults] setValue:is_voice forKey:@"is_voice"];
//            }
//            if (is_shock.length>0) {
//                [[NSUserDefaults standardUserDefaults] setValue:is_shock forKey:@"is_shock"];
//            }
//            self.is_gz = is_gz;
//            self.is_voice = is_voice;
//            self.is_shock = is_shock;
//            [self.tableView reloadData];
//        }else{
//            [JCWToastTool showHint:object[@"msg"]];
//        }
//
//    } failure:^(NSError * _Nonnull error) {
//         [self endRefresh];
//    }];

}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return AUTO(50);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.0001f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.0001;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *backView= [UIView new];
    return backView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row==1) {
        SoundControlSingle * single = [SoundControlSingle sharedInstanceForSound];//获取声音对象
        [single play];
    }
    if (indexPath.row==2) {
        SoundControlSingle * single = [SoundControlSingle sharedInstanceForVibrate];;//获取声音对象
        [single play];
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
 
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        if (indexPath.row==0) {
              [cell setSeparatorInset:UIEdgeInsetsZero];
        }
        else{
             [cell setSeparatorInset:UIEdgeInsetsMake(0, AUTO(15), 0, AUTO(15))];

        }
    }

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
