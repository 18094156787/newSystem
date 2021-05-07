//
//  MagicImageView.m
//  BigImage
//
//  Created by yangyunen on 2017/7/20.
//  Copyright © 2017年 yangyunen. All rights reserved.
//

#import "MagicImageView.h"
#import "MagicAlertView.h"
#import "JCWToastTool.h"
#import "JCWAppTool.h"
#import "WXApiManager.h"
#import "UIView+CurrentVC.h"
#import "JCBaseViewController.h"

#define MagicWeakSelf __weak typeof(self) weakSelf = self

@interface MagicImageView ()
@property (strong, nonatomic) UIView * backView;
@property (strong, nonatomic) UIImageView * actionImageView;
@property (assign, nonatomic) CGRect originFrame; //暂存frame
//@property (assign, nonatomic) BOOL statusBarHidden;
@end

@implementation MagicImageView
- (void)awakeFromNib {
    [super awakeFromNib];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(picTapAction:)]];
    //给self添加
    [self addGestureRecognizer:[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)]];
}
- (instancetype)initWithImage:(UIImage *)image {
    self = [super initWithImage:image];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(picTapAction:)]];
    return self;
}
//- (UIView *)backView {
//    if (!_backView) {
//        _backView = [[UIView alloc] init];
//    }
//    return _backView;
//}

#pragma mark - 手势事件
- (void)longPress:(UILongPressGestureRecognizer *)sender {
    NSLog(@"长按了图片。");
    //[self showMenu];
    MagicAlertView * magicAlertView = [MagicAlertView viewFromXib];
    [magicAlertView show];
    WeakSelf;
    magicAlertView.saveClickClickBlock = ^{
        [weakSelf saveAlbum];
    };
    //[self recognizeQRCodeWithImage:self.image];
}

#pragma mark - 二维码识别
- (void)recognizeQRCodeWithImage:(UIImage *)image {
    //图像识别类
    CIDetector * dectector = [CIDetector detectorOfType:CIDetectorTypeQRCode context:nil options:@{CIDetectorAccuracy:CIDetectorAccuracyLow}];
    CIImage * originImage = [CIImage imageWithCGImage:image.CGImage];
    NSArray * features = [dectector featuresInImage:originImage];
    
    for (CIQRCodeFeature * result in features) {
        NSString * urlStr = result.messageString;
        //NSLog(@"content == %@", content);
        //[JCWAppTool openUrl:urlStr];
        //NSString * str = [[urlStr componentsSeparatedByString:@"/"] lastObject];
        //NSArray * arr = [urlStr componentsSeparatedByString:@"/"];
        //NSString * str = @"gh_ac4568e928e7";
        //跳转微信公众号
        //[[WXApiManager sharedManager] jumpWXSubscribeWithUrl:str];
        //打开微信内置浏览器
        //[[WXApiManager sharedManager] openWebWithUrl:urlStr];
        //[[WXApiManager sharedManager] sendSubscribe];
        //[JCWAppTool openUrl:urlStr];
    }
    //NSLog(@"二维码识别完毕。");
}

#pragma mark - 点击放大缩小
- (CGRect)originFrame {
    return [self convertRect:self.bounds toView:nil];
}
- (void)picTapAction:(UIGestureRecognizer *)gr {
    self.hidden = YES;
    self.backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    self.backView.backgroundColor = [UIColor blackColor];
    [[UIApplication sharedApplication].delegate.window addSubview:_backView];
    //点击大图消失
    [self.backView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backTapAction)]];
    //长按弹出菜单
    [self.backView addGestureRecognizer:[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)]];
    
    MagicWeakSelf;
    self.actionImageView = [[UIImageView alloc] initWithImage:self.image];
    self.actionImageView.frame = self.originFrame;
    [[UIApplication sharedApplication].delegate.window addSubview:self.actionImageView];
    
    self.backView.alpha = 0;
    [UIView animateWithDuration:0.3 animations:^{
        self.backView.alpha = 1;
        CGFloat fixelW = CGImageGetWidth(weakSelf.actionImageView.image.CGImage);
        CGFloat fixelH = CGImageGetHeight(weakSelf.actionImageView.image.CGImage);
        if (fixelH > 0) {
            weakSelf.actionImageView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, fixelH * [UIScreen mainScreen].bounds.size.width / fixelW);
            weakSelf.actionImageView.center = weakSelf.backView.center;
        }
    } completion:^(BOOL finished) {
        //隐藏状态栏
        JCBaseViewController * currentVC = (JCBaseViewController *)[self getCurrentVC];
        currentVC.statusBarHidden = YES;
    }];
}
//
- (void)backTapAction {
    //显示状态栏
    JCBaseViewController * currentVC = (JCBaseViewController *)[self getCurrentVC];
    currentVC.statusBarHidden = NO;
    
    MagicWeakSelf;
    [UIView animateWithDuration:0.2 animations:^{
        weakSelf.actionImageView.frame = self.originFrame;
        weakSelf.backView.alpha = 0;
    } completion:^(BOOL finished) {
        [weakSelf.backView removeFromSuperview];
        [weakSelf.actionImageView removeFromSuperview];
        self.hidden = NO;
    }];
}

#pragma mark - 长按弹出菜单
//- (void)showMenu {
//    UIAlertController * alert =[UIAlertController alertControllerWithTitle:@"" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
//    UIAlertAction * saveAction = [UIAlertAction actionWithTitle:@"查看大图" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        //
//    }];
//    UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        //
//    }];
//    [alert addAction:saveAction];
//    [alert addAction:cancelAction];
////    UIViewController
//    UIWindow * window = [UIApplication sharedApplication].delegate.window;
//    [window.rootViewController presentViewController:alert animated:YES completion:^{
//        //
//    }];
//}

#pragma mark -
- (void)saveAlbum {
    UIImageWriteToSavedPhotosAlbum(self.image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    if (error) {
        [JCWToastTool showHint:@"保存失败"];
        return ;
    }
    [JCWToastTool showHint:@"保存成功"];
}

//#pragma mark - BASE
//- (void)setStatusBarHidden:(BOOL)statusBarHidden {
//    _statusBarHidden = statusBarHidden;
//    JCBaseViewController * currentVC = (JCBaseViewController *)[self getCurrentVC];
//    currentVC.statusBarHidden = statusBarHidden;
//}
@end
