//
//  UIAlertController+Addtional.m
//  lm_millionPeople_user
//
//  Created by ZY－jishubu1 on 2018/1/17.
//  Copyright © 2018年 LM-林敏. All rights reserved.
//

#import "UIAlertController+Addtional.h"
/*  用带有编辑框的 弹出框 比较多*/
@implementation UIAlertController (Addtional)

//没有取消按钮
+(UIAlertController *)alertTitle:(NSString *)title mesasge:(NSString *)message confirmHandler:(void(^)(UIAlertAction *confirmAction))confirmActionHandler
              showViewController:(UIViewController *)vc{
    
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *confirmAction=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:confirmActionHandler];
    
    [alertController addAction:confirmAction];
    
    [vc presentViewController:alertController animated:YES completion:nil];
    
    return alertController;
    
    
}

//有取消按钮的
//UIAlertControllerStyleAlert 显示到屏幕中间(按钮两个以上始终各位一行)  UIAlertControllerStyleActionSheet显示到屏幕底部(按钮始终各位一行)
+(UIAlertController *)alertTitle:(NSString *)title
                         mesasge:(NSString *)message
                      alertControllerStyle:(UIAlertControllerStyle)style
                  confirmHandler:(void(^)(UIAlertAction *confirmAction))confirmBlock
                   cancelHandler:(void(^)(UIAlertAction *cancleAction))cancleBlock
              showViewController:(UIViewController *)vc
{
    
    //初始化 标题,内容,展现形式
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:style];
    
    //添加按钮
    UIAlertAction *confirmAction=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:confirmBlock];
    
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:cancleBlock];
    
    [alertController addAction:confirmAction];
    [alertController addAction:cancleAction];
    
    //呈现
    [vc presentViewController:alertController animated:YES completion:nil];
    
    return alertController;
}

//带编辑的输入框
+(UIViewController *)alertTitle:(NSString *)title
                        mesasge:(NSString *)message
                   addTextField:(void(^)(UITextField *textFild))textFildBlock
                 confirmHandler:(void(^)(UIAlertAction *confirmAction))confirmBlock
                  cancelHandler:(void(^)(UIAlertAction *cancleAction))cancleBlock
             showViewController:(UIViewController *)vc{
    
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    //这边是无参数的block
    UIAlertAction *confirmAction=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:confirmBlock];
    
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:cancleBlock];
    
    [alertController addAction:confirmAction];
    [alertController addAction:cancleAction];
    
    //输入框  -- 注意 这里是得到textField 但是得不到输入的r内容。所以通过顶一个textField 去获取  弹出框的textField
    //或是下面的方法
    //NSArray * textfields = __weakSelf.alertController.textFields;
    //UITextField * reasonTF = textfields[0];
    [alertController addTextFieldWithConfigurationHandler:textFildBlock];
    
    [vc presentViewController:alertController animated:YES completion:nil];
    
    return alertController;
    
    
}

//弹框选择
+ (UIAlertController *)actionSheettWithTitle:(NSString *)title
                                     message:(NSString *)message
                                actionTitles:(NSArray *)actionTitleArr
                                 alertControllerStyle:(UIAlertControllerStyle)style
                               actionHandler:(actionHandler)actionHandler
                          showViewController:(UIViewController *)vc{
    
    //初始化
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:style];
    
    //根据传入的文字个数来创建 按钮个数
    if (actionTitleArr.count > 0) {
        for (NSUInteger i = 0; i < actionTitleArr.count; i++) {
            
            //这边是有参数的block
            UIAlertAction *action = [UIAlertAction actionWithTitle:actionTitleArr[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * action)  {
                actionHandler(action, i);
            }];

            [alertController addAction:action];
        }
    }
    
    //注意 取消按钮只有唯一一个。。
    UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:cancelAction];
    
    //显示
    [vc presentViewController:alertController animated:YES completion:nil];
    
    return alertController;
    
}

//版本更新弹窗
+(UIAlertController *)versionAlertTitle:(NSString *)title
                                mesasge:(NSString *)message isForce:(BOOL)force
                      alertControllerStyle:(UIAlertControllerStyle)style
                  confirmHandler:(void(^)(UIAlertAction *confirmAction))confirmBlock
                   cancelHandler:(void(^)(UIAlertAction *cancleAction))cancleBlock
              showViewController:(UIViewController *)vc
{
    
    //初始化 标题,内容,展现形式
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:style];
    
    //添加按钮
    UIAlertAction *confirmAction=[UIAlertAction actionWithTitle:@"更新" style:UIAlertActionStyleDefault handler:confirmBlock];

    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:cancleBlock];
    [alertController addAction:confirmAction];
    if (!force) {
        [alertController addAction:cancleAction];
    }
    
    //呈现
    [vc presentViewController:alertController animated:YES completion:nil];
    
    return alertController;
}

@end
