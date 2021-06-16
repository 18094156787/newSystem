//
//  JCYCInviteShareVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/20.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCYCInviteShareVC.h"
#import <UMShare/UMShare.h>
#import <ZXingWrapper.h>
#import <Photos/Photos.h>
#import "QiCodeManager.h"
#ifndef czh_dispatch_queue_async_safe
#define czh_dispatch_queue_async_safe(queue, block)\
if (strcmp(dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL), dispatch_queue_get_label(queue)) == 0) {\
block();\
} else {\
dispatch_async(queue, block);\
}
#endif

#ifndef czh_dispatch_main_sync_safe
#define czh_dispatch_main_sync_safe(block) czh_dispatch_queue_async_safe(dispatch_get_main_queue(), block)
#endif
@interface JCYCInviteShareVC ()

@end

@implementation JCYCInviteShareVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleTransparent;
    [self setNavBackImgWhiteColor];

}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationBarStyle = JCNavigationBarStyleTransparent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = COLOR_9F9F9F;
//    self.view.backgroundColor = [COLOR_000000 colorWithAlphaComponent:0.6];
    [self initViews];

}

- (void)initViews {
    UIImageView *topImgView = [UIImageView new];
    topImgView.image = JCIMAGE(@"jc_invite_shareView");
    [self.view addSubview:topImgView];
    [topImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.offset(kNavigationBarHeight+kBottomTabSafeAreaHeight*2+40);
        make.size.mas_equalTo(CGSizeMake(280, 400));
    }];
    
    UIView *whiteView = [UIView new];
    whiteView.backgroundColor = JCWhiteColor;
    [self.view addSubview:whiteView];
    [whiteView hg_setAllCornerWithCornerRadius:4];
    [whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view).offset(3);
        make.bottom.equalTo(topImgView.mas_bottom).offset(-8);
        make.size.mas_equalTo(CGSizeMake(264, 98));
    }];
    
    UIView *bottomView = [UIView new];
    bottomView.backgroundColor = JCWhiteColor;
    [self.view addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.view);
        make.height.mas_equalTo(kBottomTabSafeAreaHeight+100);
    }];
    
    UILabel *label = [UILabel initWithTitle:@"还有更多奖励等您来领取" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [whiteView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(10));
        make.top.offset(AUTO(15));
    }];
    
    UILabel *label1 = [UILabel initWithTitle:@"长按识别二维码  立即下载" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
    [whiteView addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(10));
        make.top.equalTo(label.mas_bottom).offset(AUTO(10));
    }];
    
    UIImageView *codeImgView = [UIImageView new];
    [whiteView addSubview:codeImgView];
    [codeImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(5));
        make.right.offset(AUTO(-5));
        make.width.height.mas_equalTo(75);
    }];
    codeImgView.image = [self getCodewithInfo:self.infoModel.url];
    
    NSArray *imgArray = @[JCIMAGE(@"jc_yuce_incite_wx"),JCIMAGE(@"jc_yuce_incite_pyx"),JCIMAGE(@"jc_yuce_incite_xz"),JCIMAGE(@"jc_yuce_incite_copy")];
    NSArray *titleArray = @[@"微信好友",@"朋友圈",@"保存图片",@"复制链接"];
    float widht = (SCREEN_WIDTH - AUTO(45)*4)/5.0f;
    for (int i=0; i<4; i++) {
        UIButton *btn = [UIButton new];
        btn.frame = CGRectMake(widht+(AUTO(45)+widht)*i, AUTO(12), AUTO(45), AUTO(45));
        [btn setImage:imgArray[i] forState:0];
        [btn setImage:imgArray[i] forState:UIControlStateHighlighted];
        btn.tag = 100+i;
        [bottomView addSubview:btn];
        
        UILabel *titleLab = [UILabel initWithTitle:titleArray[i] andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
        [bottomView addSubview:titleLab];
        [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(btn.mas_bottom).offset(AUTO(10));
            make.centerX.equalTo(btn);
        }];
        
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
}

- (void)btnClick:(UIButton *)sender {
    switch (sender.tag) {
        case 100:
        {
//            [self activityAnalysis];
            NSString *title = self.infoModel.information;
            if (self.infoModel.position.length>0) {
                title =  [NSString stringWithFormat:@"%@,%@",self.infoModel.position,self.infoModel.information];
            }
            [self shareToWechatWithWebTitle:title description:self.infoModel.desc thumbImage:JCIMAGE(@"icon_app") webpageUrl:self.infoModel.url type:UMSocialPlatformType_WechatSession];
            
        }
            break;
        case 101:
        {
//            [self activityAnalysis];
            NSString *title = self.infoModel.information;
            if (self.infoModel.position.length>0) {
                title =  [NSString stringWithFormat:@"%@,%@",self.infoModel.position,self.infoModel.information];
            }
            [self shareToWechatWithWebTitle:title description:self.infoModel.desc thumbImage:JCIMAGE(@"icon_app") webpageUrl:self.infoModel.friend_url type:UMSocialPlatformType_WechatTimeLine];
            
        }
            break;
        case 102:
        {
            [self cjw_syntheticLocalAndNetWork];
            
        }
            break;
        case 103:
        {
            if (self.infoModel.url.length==0) {
                return;
            }
            UIPasteboard * pasteBoard = [UIPasteboard generalPasteboard];
            pasteBoard.string = self.infoModel.url;
            [JCWToastTool showHint:@"已复制"];
            
        }
            break;
            
        default:
            break;
    }
}
- (void)shareToWechatWithWebTitle:(NSString *)title
                      description:(NSString *)description
                       thumbImage:(UIImage *)thumbImage
                       webpageUrl:(NSString *)webpageUrl
                             type:(UMSocialPlatformType)type
{
    
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    //创建网页内容对象
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:title descr:description thumImage:thumbImage];
    //设置网页地址
    shareObject.webpageUrl = webpageUrl;
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    
    [[UMSocialManager defaultManager] shareToPlatform:type messageObject:messageObject currentViewController:nil completion:^(id data, NSError *error) {
        if (error) {
            NSLog(@"************Share fail with error %@*********",error);
        } else {
            NSLog(@"response data is %@",data);
        }
    }];
//    WXMediaMessage *message = [WXMediaMessage message];
//    message.title = title;
//    message.description = description;
//    [message setThumbImage:thumbImage];
//
//    WXWebpageObject *webpageObject = [WXWebpageObject object];
//    webpageObject.webpageUrl = webpageUrl;
//    message.mediaObject = webpageObject;
//
//    [self sendToWechatWithBText:NO message:message scene:type];
}

#pragma mark 生成图片

- (void)cjw_syntheticLocalAndNetWork {
    

//    NSString *url = @"https://goss2.cfp.cn/creative/vcg/800/new/VCG211268773298.jpg";
    
    //    @"http://static.yygo.tv/avatar/2/5a5756e2dd94b.png"
    czh_dispatch_queue_async_safe(dispatch_get_global_queue(0, 0), (^{
        UIImage *blackBgImage = [UIImage imageNamed:@"BlackBg"];//底部黑色图
//
        UIImage *networkImage = [UIImage imageNamed:@"jc_invite_shareView"];//顶部图
//        UIImage *bottmWhiteImgge = [UIImage imageNamed:@"cornorWhite"];//底部白色圆角
        UIImage *localImage = [self getCodewithInfo:self.infoModel.url];//二维码图
                CGFloat networkImageWithd = networkImage.size.width;
                CGFloat networkImageHeight = networkImage.size.height;
        
        float screenWidth = SCREEN_WIDTH;
//        float screenHeight = 812;
        
        float xLocation = (screenWidth-280)/2.0f;
//        float yLocation = 50;
        if (xLocation<0) {
            xLocation = 0;
        }
        
        //固定的大小为画布创建上下文
//        而不影响清晰度的创建方法应该是
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(SCREEN_WIDTH, networkImageHeight), YES, [UIScreen mainScreen].scale);
        
//        UIGraphicsBeginImageContextWithOptions(CGSize size, YES,[UIScreen mainScreen].scale);
//        UIGraphicsBeginImageContext(CGSizeMake(SCREEN_WIDTH, networkImageHeight));
        [blackBgImage drawInRect:CGRectMake(0, 0, SCREEN_WIDTH, networkImageHeight)];
//        [bottmImgge drawInRect:CGRectMake(xLocation, yLocation, 347, 445)];

//        [bottmWhiteImgge drawInRect:CGRectMake(33, 445+yLocation, 315, 88)];
       
        [networkImage drawInRect:CGRectMake(xLocation, 0, networkImageWithd, networkImageHeight)];//先把网络封面图片放在下面
        
        NSLog(@"位置=%.0f",xLocation);
        
        NSDictionary *attr = @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Medium" size:16], NSForegroundColorAttributeName : COLOR_2F2F2F };

        NSDictionary *attr1 = @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Regular" size:12], NSForegroundColorAttributeName : COLOR_2F2F2F };
        
        UIImage *whiye_bottomImage = [UIImage imageNamed:@"jc_invite_white"];//底部白底图
        [whiye_bottomImage drawInRect:CGRectMake(xLocation+10, networkImageHeight-90, networkImageWithd-20, 80)];//先把网络封面图片放在下面

        //位置显示
        [@"预测比赛送红包" drawInRect:CGRectMake(30+xLocation, networkImageHeight-75, 150, 20) withAttributes:attr];
         [@"长按识别二维码  立即下载" drawInRect:CGRectMake(30+xLocation, networkImageHeight-45, 150, 20) withAttributes:attr1];

         [localImage drawInRect:CGRectMake(xLocation+networkImageWithd-70, networkImageHeight-75, 50, 50)];//二维码
    
        
        //需要合成更多，继续添加
        
        UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();//从当前上下文中获得最终图片
        UIGraphicsEndImageContext();//关闭上下文
        
        czh_dispatch_main_sync_safe(^{

            UIImageWriteToSavedPhotosAlbum(resultImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);

        });
        
        
        
    }));
    
}

- (UIImage *)getCodewithInfo:(NSString *)ifno {
    if (ifno.length==0) {
        //如果没有信息,则无法生成二维码
        return [UIImage new];
    }
    NSString * jsonString = ifno;
   jsonString = [jsonString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];  //去除掉首尾的空白字符和换行字符
   [jsonString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    UIImage *image = [QiCodeManager generateQRCode:jsonString size:CGSizeMake(75, 75)];
//    UIImage *image = [ZXingWrapper createCodeWithString:jsonString size:CGSizeMake(75, 75) CodeFomart:kBarcodeFormatQRCode];
    return image;
}

-(void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
//    NSString *msg = nil ;
    if(error){
//        msg = @"保存图片失败" ;
        [JCWToastTool showHint:@"保存失败"];
    }else{
//        msg = @"保存图片成功" ;
        [JCWToastTool showHint:@"保存成功"];
    }
}
//活动统计
//- (void)activityAnalysis {
//
//    if (self.activity_id.length==0) {
//        return;
//    }
//    JCActivityService *service = [JCActivityService service];
//    [service getActivityAnalysisWithActID:self.activity_id success:^(id  _Nullable object) {
//        if ([JCWJsonTool isSuccessResponse:object]) {
//
//        }else{
//            [JCWToastTool showHint:object[@"msg"]];
//        }
//
//
//    } failure:^(NSError * _Nonnull error) {
//
//    }];
//
//
//}

@end
