//
//  JCKindShareView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/6/2.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCKindShareView.h"
#import <UMShare/UMShare.h>
@implementation JCKindShareView

- (void)initViews {

    
    
    self.bgView.backgroundColor = JCWhiteColor;
    [self addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self);
        make.height.mas_equalTo(kBottomTabSafeAreaHeight+100);
    }];


    NSArray *imgArray = @[JCIMAGE(@"jc_yuce_incite_wx"),JCIMAGE(@"jc_yuce_incite_pyx"),JCIMAGE(@"jc_yuce_incite_xz")];
    NSArray *titleArray = @[@"微信好友",@"朋友圈",@"保存图片"];
    float widht = (SCREEN_WIDTH - AUTO(45)*3)/4.0f;
    for (int i=0; i<3; i++) {
        UIButton *btn = [UIButton new];
        btn.frame = CGRectMake(widht+(AUTO(45)+widht)*i, AUTO(12), AUTO(45), AUTO(45));
        [btn setImage:imgArray[i] forState:0];
        [btn setImage:imgArray[i] forState:UIControlStateHighlighted];
        btn.tag = 100+i;
        [self.bgView addSubview:btn];
        
        UILabel *titleLab = [UILabel initWithTitle:titleArray[i] andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
        [self.bgView addSubview:titleLab];
        [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(btn.mas_bottom).offset(AUTO(10));
            make.centerX.equalTo(btn);
        }];
        
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
}

- (void)btnClick:(UIButton *)sender {
//    switch (sender.tag) {
//        case 100:
//        {
//
//            NSString *title = self.infoModel.information;
//            if (self.infoModel.position.length>0) {
//                title =  [NSString stringWithFormat:@"%@,%@",self.infoModel.position,self.infoModel.information];
//            }
//            [self shareToWechatWithWebTitle:title description:self.infoModel.desc thumbImage:JCIMAGE(@"icon_app") webpageUrl:self.infoModel.url type:UMSocialPlatformType_WechatSession];
//
//        }
//            break;
//        case 101:
//        {
//            NSString *title = self.infoModel.information;
//            if (self.infoModel.position.length>0) {
//                title =  [NSString stringWithFormat:@"%@,%@",self.infoModel.position,self.infoModel.information];
//            }
//            [self shareToWechatWithWebTitle:title description:self.infoModel.desc thumbImage:JCIMAGE(@"icon_app") webpageUrl:self.infoModel.friend_url type:UMSocialPlatformType_WechatTimeLine];
//
//        }
//            break;
//        case 102:
//        {
//            [self cjw_syntheticLocalAndNetWork];
//
//        }
//            break;
//        case 103:
//        {
//            UIPasteboard * pasteBoard = [UIPasteboard generalPasteboard];
//            pasteBoard.string = self.infoModel.url;
//            [JCWToastTool showHint:@"已复制"];
//
//        }
//            break;
//
//        default:
//            break;
//    }
    if (sender.tag==102) {
        if (!self.shareImage) {
            return;
        }
        UIImageWriteToSavedPhotosAlbum(self.shareImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    }
    
    if (sender.tag==100||sender.tag==101) {

        UMSocialPlatformType platformType = UMSocialPlatformType_UnKnown;
        if (sender.tag == 100) {
            platformType = UMSocialPlatformType_WechatSession;
        }
        if (sender.tag == 101) {
            platformType = UMSocialPlatformType_WechatTimeLine;
        }

        
        if (![[UMSocialManager defaultManager] isInstall:platformType]) {
            [JCWToastTool showHint:@"未安装相应的客户端"];
            return ;
        }
        
        //创建分享消息对象
        UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
//        //创建网页内容对象
//        UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:@"" descr:@"" thumImage:nil];
//        if (self.imageUrl) {
//            shareObject = [UMShareWebpageObject shareObjectWithTitle:title descr:self.desc thumImage:self.imageUrl];
//        }
//        //设置网页地址
//        shareObject.webpageUrl = self.webPageUrl;
//        if (platformType == UMSocialPlatformType_WechatTimeLine) {
//            shareObject.webpageUrl = self.friend_url;
//
//        }
        //分享消息对象设置分享内容对象
//        messageObject.shareObject = shareObject;
        
        UMShareImageObject  *imageObj = [UMShareImageObject new];
        imageObj.shareImage = self.shareImage;
        messageObject.shareObject = imageObj;
        
        
        [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:nil completion:^(id data, NSError *error) {
            if (error) {
                NSLog(@"************Share fail with error %@*********",error);
            } else {
                NSLog(@"response data is %@",data);
            }
        }];
        
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
- (void)show {
      self.bgView.transform = CGAffineTransformMakeTranslation(0, SCREEN_HEIGHT);
    WeakSelf;
    [UIView animateWithDuration:0.3f animations:^{
        weakSelf.bgView.transform = CGAffineTransformIdentity;

    }];
}
- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
    }
    return _bgView;
}

@end
