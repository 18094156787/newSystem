//
//  IAPManager.m
//  IAPDemo
//
//  Created by Charles.Yao on 2016/10/31.
//  Copyright © 2016年 com.pico. All rights reserved.
//

#import "IAPManager.h"

#import "SandBoxHelper.h"
#import "NSString+category.h"
#import "NSDate+category.h"


static NSString * const receiptKey = @"receipt_key";
static NSString * const dateKey = @"date_key";
//static NSString * const tKey = @"date_key";
static NSString * const userIdKey = @"orderID_key";

dispatch_queue_t iap_queue() {
    static dispatch_queue_t as_iap_queue;
    static dispatch_once_t onceToken_iap_queue;
    dispatch_once(&onceToken_iap_queue, ^{
        as_iap_queue = dispatch_queue_create("com.iap.queue", DISPATCH_QUEUE_CONCURRENT);
    });
    
    return as_iap_queue;
}

@interface IAPManager ()<SKPaymentTransactionObserver, SKProductsRequestDelegate>

@property (nonatomic, assign) BOOL goodsRequestFinished; //判断一次请求是否完成

@property (nonatomic, copy) NSString *receipt; //交易成功后拿到的一个64编码字符串

@property (nonatomic, copy) NSString *date; //交易时间

@property (nonatomic, copy) NSString *userId; //交易人

@end

@implementation IAPManager

singleton_implementation(IAPManager)

- (void)startManager { //开启监听

    dispatch_async(iap_queue(), ^{
       
        self.goodsRequestFinished = YES;
        
        /***
         内购支付两个阶段：
         1.app直接向苹果服务器请求商品，支付阶段；
         2.苹果服务器返回凭证，app向公司服务器发送验证，公司再向苹果服务器验证阶段；
         */
        
        /**
         阶段一正在进中,app退出。
         在程序启动时，设置监听，监听是否有未完成订单，有的话恢复订单。
         
         
         */
        

        [[SKPaymentQueue defaultQueue] addTransactionObserver:self];

        /**
         阶段二正在进行中,app退出。
         在程序启动时，检测本地是否有receipt文件，有的话，去二次验证。
         */
//        [self checkIAPFiles];
    });
}

- (void)stopManager{

    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [[SKPaymentQueue defaultQueue] removeTransactionObserver:self];
    });
}

#pragma mark 查询
- (void)requestProductWithId:(NSString *)productId order_id:(NSString *)order_id {
    self.order_id = order_id;
    if (self.goodsRequestFinished) {
       
        if ([SKPaymentQueue canMakePayments]) { //用户允许app内购
            
            if (productId.length) {

                [SVProgressHUD show];
                NSLog(@"%@商品正在请求中",productId);
//               [SVProgressHUD sh]
                self.goodsRequestFinished = NO; //正在请求
               
                NSArray *product = [[NSArray alloc] initWithObjects:productId, nil];
                
                NSSet *set = [NSSet setWithArray:product];
               
                SKProductsRequest *productRequest = [[SKProductsRequest alloc] initWithProductIdentifiers:set];
               
                productRequest.delegate = self;
               
                [productRequest start];
            
            } else {
               
                NSLog(@"商品为空");
                
                [self filedWithErrorCode:IAP_FILEDCOED_EMPTYGOODS error:nil];
                
                self.goodsRequestFinished = YES; //完成请求
            }
        
        } else { //没有权限
            
            [self filedWithErrorCode:IAP_FILEDCOED_NORIGHT error:nil];
            
            self.goodsRequestFinished = YES; //完成请求
        }
    
    } else {

        NSLog(@"上次请求还未完成，请稍等");
    }
}

#pragma mark SKProductsRequestDelegate 查询成功后的回调
- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response {

    NSArray *product = response.products;
 
    if (product.count == 0) {
        [SVProgressHUD dismiss];
     
        NSLog(@"无法获取商品信息，请重试");
        
        [self filedWithErrorCode:IAP_FILEDCOED_CANNOTGETINFORMATION error:nil];
        
        self.goodsRequestFinished = YES; //失败，请求完成

    } else {

        //发起购买请求
        SKPayment *payment = [SKPayment paymentWithProduct:product[0]];
       
        [[SKPaymentQueue defaultQueue] addPayment:payment];
    }
}

#pragma mark SKProductsRequestDelegate 查询失败后的回调
- (void)request:(SKRequest *)request didFailWithError:(NSError *)error {
    
    [self filedWithErrorCode:IAP_FILEDCOED_APPLECODE error:[error localizedDescription]];
    
    self.goodsRequestFinished = YES; //失败，请求完成
}

#pragma Mark 购买操作后的回调
- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(nonnull NSArray<SKPaymentTransaction *> *)transactions {

    for (SKPaymentTransaction *transaction in transactions) {
       
        switch (transaction.transactionState) {
           
            case SKPaymentTransactionStatePurchasing://正在交易
                [SVProgressHUD show];
                break;

            case SKPaymentTransactionStatePurchased://交易完成

                [SVProgressHUD dismiss];

             
//                [self getReceipt]; //获取交易成功后的购买凭证
//
//                [self saveReceipt]; //存储交易凭证
//
//                [self checkIAPFiles];//把self.receipt发送到服务器验证是否有效
                NSLog(@"交易号=%@",transaction.transactionIdentifier);
                [self sendRequestWithStransaction:transaction];
                
//                [self completeTransaction:transaction];
                break;

            case SKPaymentTransactionStateFailed://交易失败
               
                [self failedTransaction:transaction];
                
                break;

            case SKPaymentTransactionStateRestored://已经购买过该商品
                
                [self restoreTransaction:transaction];
                
                break;
           
            default:
                [[SKPaymentQueue defaultQueue] finishTransaction: transaction];
                break;
        }
    }
}

- (void)completeTransaction:(SKPaymentTransaction *)transaction {
    
    self.goodsRequestFinished = YES; //成功，请求完成
    
    [[SKPaymentQueue defaultQueue] finishTransaction: transaction];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"recharge_order_id"];
}


- (void)failedTransaction:(SKPaymentTransaction *)transaction {

    NSLog(@"transaction.error.code = %ld", transaction.error.code);

    if(transaction.error.code != SKErrorPaymentCancelled) {

        [self filedWithErrorCode:IAP_FILEDCOED_BUYFILED error:nil];

    } else {

        [self filedWithErrorCode:IAP_FILEDCOED_USERCANCEL error:nil];
    }

    [[SKPaymentQueue defaultQueue] finishTransaction: transaction];
   
    self.goodsRequestFinished = YES; //失败，请求完成

}


- (void)restoreTransaction:(SKPaymentTransaction *)transaction {
    
    [[SKPaymentQueue defaultQueue] finishTransaction: transaction];
    
    self.goodsRequestFinished = YES; //恢复购买，请求完成

}

#pragma mark 获取交易成功后的购买凭证

- (void)getReceipt {

    NSURL *receiptUrl=[[NSBundle mainBundle] appStoreReceiptURL];
    NSData *receiptData=[NSData dataWithContentsOfURL:receiptUrl];
    //转化为base64字符串
    NSString *receiptString=[receiptData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    self.receipt = receiptString;
     
 

}

#pragma mark  持久化存储用户购买凭证(这里最好还要存储当前日期，用户id等信息，用于区分不同的凭证)
-(void)saveReceipt {

    self.date = [NSDate chindDateFormate:[NSDate date]];
    
    NSString *fileName = [NSString uuid];
   
//    self.userId = self.order_id;
   
    NSString *savedPath = [NSString stringWithFormat:@"%@/%@.plist", [SandBoxHelper iapReceiptPath], fileName];
    if (self.order_id.length==0) {
        if ([[NSUserDefaults standardUserDefaults] objectForKey:@"recharge_order_id"]) {
            self.order_id = [[NSUserDefaults standardUserDefaults] objectForKey:@"recharge_order_id"];
        }
        
    }
    NSDictionary *dic =[NSDictionary dictionaryWithObjectsAndKeys:
                        self.receipt,                           receiptKey,
                        self.date,                              dateKey,
                        self.order_id,                            userIdKey,
                        nil];
   
    NSLog(@"储存%@",savedPath);
    
    [dic writeToFile:savedPath atomically:YES];
}

#pragma mark 将存储到本地的IAP文件发送给服务端 验证receipt失败,App启动后再次验证
- (void)checkIAPFiles{

    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSError *error = nil;
   
    //搜索该目录下的所有文件和目录
    NSArray *cacheFileNameArray = [fileManager contentsOfDirectoryAtPath:[SandBoxHelper iapReceiptPath] error:&error];
    
    if (error == nil) {
       
        for (NSString *name in cacheFileNameArray) {
            
            if ([name hasSuffix:@".plist"]){ //如果有plist后缀的文件，说明就是存储的购买凭证
               
                NSString *filePath = [NSString stringWithFormat:@"%@/%@", [SandBoxHelper iapReceiptPath], name];
                
//                [self sendAppStoreRequestBuyPlist:filePath];
            }
        }
    
    } else {
       
        NSLog(@"AppStoreInfoLocalFilePath error:%@", [error domain]);
    }
}

#warning 在这里将凭证发送给服务器
//
////    if(@"凭证有效"){
////
////        [self removeReceipt];
////
////    } else {//凭证无效
////
////        //做你想做的
////    }
//
//
//}

- (void)sendRequestWithStransaction:(SKPaymentTransaction *)transaction {
    [SVProgressHUD show];
    NSURL *receiptUrl=[[NSBundle mainBundle] appStoreReceiptURL];
    NSData *receiptData=[NSData dataWithContentsOfURL:receiptUrl];
    //转化为base64字符串
    NSString *receiptString=[receiptData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
//    self.receipt = receiptString;
    JCPayService_New * service = [[JCPayService_New alloc] init];
    [service getUserRechareSuccessWithOrder_id:transaction.transactionIdentifier receipt_data:receiptString success:^(id  _Nullable object) {
        self.goodsRequestFinished = YES;
        [SVProgressHUD dismiss];
       if ([JCWJsonTool isSuccessResponse:object]) {

           if (self.JNSuccessBlock) {
               self.JNSuccessBlock();
           }
           [[NSNotificationCenter defaultCenter] postNotificationName:UserRechargeSuccess object:nil];


           [self completeTransaction:transaction];
       }else{
           //10004 订单号重复使用
           if ([object[@"code"] integerValue]==10004) {
//               [self removeReceipt];
               [self completeTransaction:transaction];
           }else{
               [JCWToastTool showHint:object[@"msg"]];
           }

//           [self removeReceipt];
       }

    } failure:^(NSError * _Nonnull error) {
        self.goodsRequestFinished = YES;
        [SVProgressHUD dismiss];
    }];
}


//验证成功就从plist中移除凭证
-(void)removeReceipt{
   
    NSFileManager *fileManager = [NSFileManager defaultManager];
   
    if ([fileManager fileExistsAtPath:[SandBoxHelper iapReceiptPath]]) {
        
        [fileManager removeItemAtPath:[SandBoxHelper iapReceiptPath] error:nil];
    
    }
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"recharge_order_id"];
}


#pragma mark 错误信息反馈
- (void)filedWithErrorCode:(NSInteger)code error:(NSString *)error {
    //充值失败,删除order_id
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"recharge_order_id"]) {
         [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"recharge_order_id"];
    }

    if (self.delegate && [self.delegate respondsToSelector:@selector(filedWithErrorCode:andError:)]) {
        switch (code) {
            case IAP_FILEDCOED_APPLECODE:
                [self.delegate filedWithErrorCode:IAP_FILEDCOED_APPLECODE andError:error];
                break;

                case IAP_FILEDCOED_NORIGHT:
                [self.delegate filedWithErrorCode:IAP_FILEDCOED_NORIGHT andError:nil];
                break;

            case IAP_FILEDCOED_EMPTYGOODS:
                [self.delegate filedWithErrorCode:IAP_FILEDCOED_EMPTYGOODS andError:nil];
                break;

            case IAP_FILEDCOED_CANNOTGETINFORMATION:
                 [self.delegate filedWithErrorCode:IAP_FILEDCOED_CANNOTGETINFORMATION andError:nil];
                break;

            case IAP_FILEDCOED_BUYFILED:
                 [self.delegate filedWithErrorCode:IAP_FILEDCOED_BUYFILED andError:nil];
                break;

            case IAP_FILEDCOED_USERCANCEL:
                 [self.delegate filedWithErrorCode:IAP_FILEDCOED_USERCANCEL andError:nil];
                break;

            default:
                break;
        }
    }
}


//检查是否有未完成订单
- (void)checkMyBuyGoods {
    NSArray *array =  [[SKPaymentQueue defaultQueue] transactions];
    NSLog(@"%@",array);
    if (array.count>0) {
        SKPaymentTransaction *transaction = array.firstObject;
        if (transaction.transactionState==SKPaymentTransactionStatePurchased) {
            [self sendRequestWithStransaction:transaction];

        }
       
    }

}



@end
