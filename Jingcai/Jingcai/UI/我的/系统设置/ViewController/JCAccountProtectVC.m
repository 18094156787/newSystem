//
//  JCAccountProtectVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/2/3.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCAccountProtectVC.h"
#import "JCAccountProtectCell.h"
@interface JCAccountProtectVC ()

@end

@implementation JCAccountProtectVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
    [self hideNavShadow];
   
}

- (void)viewDidLoad {
    self.style = 1;
    [super viewDidLoad];
    self.title = @"个人信息保护设置";
    self.view.backgroundColor = COLOR_F0F0F0;
    [self initViews];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadView) name:@"appBecomeActive" object:nil];
}
- (void)reloadView {
    [self.tableView reloadData];
}

- (void)initViews {
    self.tableView.backgroundColor = JCClearColor;
//    self.tableView.separatorStyle = 0;
//    self.tableView.tableHeaderView = self.headView;
    self.tableView.estimatedRowHeight = 80;
    // 表格注册cell
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    [self.tableView registerClass:[JCAccountProtectCell class] forCellReuseIdentifier:@"JCAccountProtectCell"];
//
//    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.top.offset(AUTO(8));
//    }];
}

#pragma mark - Protocol
#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}



- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.001f;
}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    UIView *view = [UIView new];
//    view.backgroundColor = COLOR_F6F6F6;
//    return view;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    return AUTO(10);
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JCAccountProtectCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCAccountProtectCell"];
//    cell.backgroundColor = [UIColor clearColor];
     if (indexPath.row==0) {
         cell.titleLab.text = @"精确定位信息";
         cell.contentLab.text = @"关闭后，将不再收集您的GPS等精确位置信息，仅通过IP等定位大致的位置以保障基本的业务功能和用于安全风控。";
//         AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
         NSInteger authStatus = [CLLocationManager authorizationStatus];
         if (authStatus==kCLAuthorizationStatusAuthorizedAlways||authStatus==kCLAuthorizationStatusAuthorizedWhenInUse) {
             [cell.settingBtn setTitle:@"已开启>" forState:0];
         }else {
             [cell.settingBtn setTitle:@"去设置>" forState:0];
         }

     }
    if (indexPath.row==1) {
        cell.titleLab.text = @"相机";
        cell.contentLab.text = @"帮助你管理、授权通过拍摄等方式收集照片信息。关闭后，将不能采集照片信息。";
        AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        if (authStatus==AVAuthorizationStatusAuthorized){
            [cell.settingBtn setTitle:@"已开启>" forState:0];
        }else{
            [cell.settingBtn setTitle:@"去设置>" forState:0];
        }
    }
    if (indexPath.row==2) {
        cell.titleLab.text = @"相册";
        cell.contentLab.text = @"帮助你管理、授权通过拍摄等方式收集照片信息。关闭后，将不能采集照片信息。";
        PHAuthorizationStatus authStatus = [PHPhotoLibrary authorizationStatus];
        if (authStatus==PHAuthorizationStatusAuthorized){
            [cell.settingBtn setTitle:@"已开启>" forState:0];
        }else{
            [cell.settingBtn setTitle:@"去设置>" forState:0];
        }
    }

//     if (indexPath.row==1) {
//         cell.titleLab.text = @"推送设置";
//     }
//     if (indexPath.row==2) {
//        cell.titleLab.text = @"进球提醒设置";
//    }
//    if (indexPath.row==3) {
//       cell.titleLab.text = @"进球提醒设置";
//   }
    return cell;
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row==0) {
//            AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        NSInteger authStatus = [CLLocationManager authorizationStatus];
        if (authStatus==kCLAuthorizationStatusAuthorizedAlways||authStatus==kCLAuthorizationStatusAuthorizedWhenInUse) {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"" message:@"关闭后，将无法为你提供基于精确位置的地理位置功能或服务" preferredStyle:UIAlertControllerStyleAlert];
            [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
            [alertController addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
            }]];
            [self presentViewController:alertController animated:YES completion:nil];

            
        }else {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
        }
    }
        if (indexPath.row==1) {
//            AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
            AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        if (authStatus==AVAuthorizationStatusAuthorized) {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"" message:@"关闭后，可能影响发布/保存/修改图文、文件等功能。" preferredStyle:UIAlertControllerStyleAlert];
            [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
            [alertController addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
            }]];
            [self presentViewController:alertController animated:YES completion:nil];

            
        }else {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
        }
            
        }
        
        if (indexPath.row==2) {
            
            PHAuthorizationStatus authStatus = [PHPhotoLibrary authorizationStatus];
        if (authStatus==PHAuthorizationStatusAuthorized) {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"" message:@"关闭后，可能影响发布/保存/修改图文、文件等功能。" preferredStyle:UIAlertControllerStyleAlert];
            [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
            [alertController addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
            }]];
            [self presentViewController:alertController animated:YES completion:nil];

            
        }else {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
        }
            
        }

        
    

    
}

@end
