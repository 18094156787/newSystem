//
//  RBApplePayManager.m
//  Jingcai
//
//  Created by Administrator on 2018/12/29.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "RBApplePayManager.h"
#import "UPAPayPlugin.h"
#import <SVProgressHUD/SVProgressHUD.h>

@interface RBApplePayManager () <UPAPayPluginDelegate>
@property (strong, nonatomic) NSString * tnMode;
@end

@implementation RBApplePayManager
+ (instancetype)shareManager {
    static dispatch_once_t onceToken;
    static RBApplePayManager * instance;
    dispatch_once(&onceToken, ^{
        instance = [[RBApplePayManager alloc] init];
    });
    return instance;
}
- (void)payWithTN:(NSString *)tn merchantId:(NSString *)merchantId {
    if (tn != nil && tn.length > 0) {
        // ApplePay支付
        UIViewController * vc = [UIApplication sharedApplication].delegate.window.rootViewController;
        [UPAPayPlugin startPay:tn mode:self.tnMode viewController:vc delegate:self andAPMechantID:merchantId];
    }
}

- (NSString *)tnMode {
    if (!_tnMode) {
    #if DEBUG
        _tnMode = @"01";
    #else
        _tnMode = @"00";
    #endif
    }
    return _tnMode;
}
#pragma mark - UPAPayPluginDelegate
- (void)UPAPayPluginResult:(UPPayResult *)payResult {
    //[kCFNetServiceErrorInProgress]
    //applePay支付结果回调
    if (payResult.paymentResultStatus == UPPaymentResultStatusSuccess) {
        NSString *otherInfo = payResult.otherInfo?payResult.otherInfo:@"";
        NSString *successInfo = [NSString stringWithFormat:@"支付成功\n%@",otherInfo];
        NSLog(@"successInfo == %@",successInfo);
        //支付成功
        if (self.jcApplePaySuccessBlock) {
            self.jcApplePaySuccessBlock();
        }
        return ;
    }
    if (payResult.paymentResultStatus == UPPaymentResultStatusCancel){
        //支付取消
        if (self.jcApplePayCancelBlock) {
            self.jcApplePayCancelBlock();
        }
        return ;
    }
    if (payResult.paymentResultStatus == UPPaymentResultStatusFailure) {
//        NSString *errorInfo = [NSString stringWithFormat:@"%@",result.errorDescription];
//        [self showAlertMessage:errorInfo];
        //支付失败
        if (self.jcApplePayFailureBlock) {
            self.jcApplePayFailureBlock();
        }
        return ;
    }
    if (payResult.paymentResultStatus == UPPaymentResultStatusUnknownCancel)  {
        //TODO UPPAymentResultStatusUnknowCancel表示发起支付以后用户取消，导致支付状态不确认，需要查询商户后台确认真实的支付结果
        //        NSString *errorInfo = [NSString stringWithFormat:@"支付过程中用户取消了，请查询后台确认订单"];
        //        [self showAlertMessage:errorInfo];
        //支付过程中取消
        if (self.jcApplePayCancelBlock) {
            self.jcApplePayCancelBlock();
        }
        return ;
    }
    
    //银联支付结果回调
    //    [[UPPaymentControl defaultControl] handlePaymentResult:url completeBlock:^(NSString *code, NSDictionary *data) {
    //        JCPayManager * manager = [JCPayManager shareManager];
    //        if([code isEqualToString:@"success"]) {
    //
    //            //如果想对结果数据验签，可使用下面这段代码，但建议不验签，直接去商户后台查询交易结果
    //            if(data != nil){
    //                //数据从NSDictionary转换为NSString
    //                NSData *signData = [NSJSONSerialization dataWithJSONObject:data
    //                                                                   options:0
    //                                                                     error:nil];
    //                NSString *sign = [[NSString alloc] initWithData:signData encoding:NSUTF8StringEncoding];
    //                NSLog(@"sign==%@",sign);
    //                //此处的verify建议送去商户后台做验签，如要放在手机端验，则代码必须支持更新证书
    //                //                if([self verify:sign]) {
    //                //                    //验签成功
    //                //                }
    //                //                else {
    //                //                    //验签失败
    //                //                }
    //            }
    //
    //            //结果code为成功时，去商户后台查询一下确保交易是成功的再展示成功
    //            if (manager.unionPaySuccessBlock) {
    //                manager.unionPaySuccessBlock();
    //            }
    //        }
    //        else if([code isEqualToString:@"fail"]) {
    //            //交易失败
    //            if (manager.unionPayFailureBlock) {
    //                manager.unionPayFailureBlock();
    //            }
    //        }
    //        else if([code isEqualToString:@"cancel"]) {
    //            //交易取消
    //            if (manager.unionPayCancelBlock) {
    //                manager.unionPayCancelBlock();
    //            }
    //        }
    //    }];
}
@end
