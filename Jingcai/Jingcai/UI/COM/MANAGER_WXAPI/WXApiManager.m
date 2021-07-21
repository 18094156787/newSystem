//
//  WXApiManager.m
//  Jingcai
//
//  Created by Rain on 2018/11/16.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "WXApiManager.h"
#import "JCWJsonTool.h"
#import "JCWConst.h"
#import "JCWUserBall.h"
#import "SVProgressHUD.h"

@implementation WXApiManager
#pragma mark - LifeCycle
+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    static WXApiManager *instance;
    dispatch_once(&onceToken, ^{
        instance = [[WXApiManager alloc] init];
    });
    return instance;
}
- (void)wxLogin {
    [SVProgressHUD show];
    // 构造SendAuthReq结构体
    SendAuthReq * req = [[SendAuthReq alloc] init];
    req.scope = @"snsapi_userinfo";
    req.state = WXSendAuthReqStateLogin;
    // 第三方向微信终端发送一个SendAuthReq消息结构
//    [WXApi sendReq:req];
    [WXApi sendReq:req completion:^(BOOL success) {
        
    }];
}
- (void)wxPayWithPayment:(WXPaymentBall *)wxPaymentBall {
    // 本地也可签名，但最好还是放在后台做
    //NSString * resign = [self createMD5SingForPayWithAppID:wxPayBall.appid partnerid:wxPayBall.mch_id prepayid:wxPayBall.prepay_id package:@"Sign=WXPay" noncestr:wxPayBall.nonce_str timestamp:(UInt32)wxPayBall.timestamp.intValue];
    
//    PayReq *req = [[PayReq alloc] init];
    // 实际项目中这些参数都是通过网络请求后台得到的，详情见以下注释，测试的时候可以让后台将价格改为1分钱
//    req.openID = wxPaymentBall.appid; // 微信开放平台审核通过的AppID
//    req.partnerId = wxPaymentBall.partnerid; // 微信支付分配的商户ID
//    req.prepayId = wxPaymentBall.prepayid; // 预支付交易会话ID
//    req.nonceStr = wxPaymentBall.noncestr; // 随机字符串
//    req.timeStamp = (UInt32)[wxPaymentBall.timestamp intValue];
//    //req.timeStamp = (UInt32)intTimeStamp; // 当前时间
//    //req.timeStamp = (UInt32)[self getNowTimeTimestamp];
//    req.package = @"Sign=WXPay"; // 固定值
//    //req.sign = resign; // 签名，除了sign，剩下6个组合的再次签名字符串
//    req.sign = wxPaymentBall.sign;
//    if ([WXApi isWXAppInstalled] == YES) {
//        // 此处会调用微信支付界面
//        [WXApi sendReq:req completion:^(BOOL success) {
//
//        }];
////        BOOL sss = [WXApi sendReq:req];
////        if (!sss) {
////            // ...
////            // [MBManager showMessage:@"微信sdk错误" inView:weakself.view afterDelayTime:2];
////        } else {
////            //微信未安装
////            // [MBManager showMessage:@"您没有安装微信" inView:weakself.view afterDelayTime:2];
////        }
//    }
}
- (void)jumpWXSubscribeWithUrl:(NSString *)url {
//    JumpToBizProfileReq *req = [JumpToBizProfileReq new];
//    req.username = url; // 原始ID
//    req.profileType = WXBizProfileType_Normal;
//    req.extMsg = @"";
//    [WXApi sendReq:req];
}
- (void)openWebWithUrl:(NSString *)url {
    OpenWebviewReq *req = [OpenWebviewReq new];
    req.url = url;
//    [WXApi sendReq:req];
    [WXApi sendReq:req completion:^(BOOL success) {
        
    }];
}
- (void)sendSubscribe {
    WXSubscribeMsgReq *req = [[WXSubscribeMsgReq alloc] init];
    req.scene = WXSceneSession;
    req.templateId = @"7YuTL__ilzyZB9DXcDt2mHx-CAS_E7KtsQkhIGVhhRM";
    req.reserved = @"hello";
//    [WXApi sendReq:req];
    [WXApi sendReq:req completion:^(BOOL success) {
        
    }];
}

#pragma mark - WXApiDelegate
- (void)onReq:(BaseReq *)req {
    // 暂时用不到，不管它
}
- (void)onResp:(BaseResp *)resp {
    /*
     ErrCode ERR_OK = 0(用户同意)
     ERR_AUTH_DENIED = -4（用户拒绝授权）
     ERR_USER_CANCEL = -2（用户取消）
     code    用户换取access_token的code，仅在ErrCode为0时有效
     state   第三方程序发送时用来标识其请求的唯一性的标志，由第三方程序调用sendReq时传入，由微信终端回传，state字符串长度不能超过1K
     lang    微信客户端当前语言
     country 微信用户当前国家信息
     */
    
    // 微信登录授权
    WeakSelf;
    if ([resp isKindOfClass:[SendAuthResp class]]) //判断是否为授权请求，否则与微信支付等功能发生冲突
    {
        [SVProgressHUD dismiss];
        SendAuthResp *aresp = (SendAuthResp *)resp;
        // 获取code
        if (aresp.errCode== 0)
        {
            NSLog(@"code == %@",aresp.code);
            // 调用接口

//            NSString *code = aresp.code;
//            [[NSNotificationCenter defaultCenter] postNotificationName:@"app_wxLogin" object:nil userInfo:@{@"code":code}];
//            JCUserService_New *service = [JCUserService_New new];
//            [service wxLoginWithCode:code success:^(id  _Nullable object) {
//                if ([JCWJsonTool isSuccessResponse:object]) {
//
//                }else {
//
//                }
//
//            } failure:^(NSError * _Nonnull error) {
//
//            }];
            
        }else{
            [JCWToastTool showHint:@"微信授权失败"];
        }
        //errCode不为0
//        if (weakSelf.loginFailureBlock) {
//            weakSelf.loginFailureBlock();
//        }
        

    }
    
    // 微信支付
//    if ([resp isKindOfClass:[PayResp class]]){
//        PayResp * response = (PayResp *)resp;
//        switch(response.errCode) {
//            case WXSuccess:
//                //服务器端查询支付通知或查询API返回的结果再提示成功
//                NSLog(@"支付成功");
//                if (weakSelf.wxPaySuccessBlock) {
//                    weakSelf.wxPaySuccessBlock();
//                }
//                break;
//            default:
//                NSLog(@"支付失败，retcode=%d",resp.errCode);
//                if (weakSelf.wxPayFailureBlock) {
//                    weakSelf.wxPayFailureBlock();
//                }
//                break;
//        }
//    }
    
}


- (void)dealWithError:(NSError *)error {
    if(!error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey]){
        return;
    }
    id errorResponse =    [NSJSONSerialization JSONObjectWithData:error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] options:0 error:nil];
    NSLog(@"错误消息为:%@",errorResponse);
}
@end
