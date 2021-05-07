//
//  JCWToastTool.m
//  AutumnFinance
//
//  Created by Rain on 2018/6/29.
//  Copyright © 2018年 rain. All rights reserved.
//

#import "JCWToastTool.h"
#import <UIKit/UIKit.h>
#import "Masonry.h"
#import <CoreMotion/CoreMotion.h>

#define HintShowDuration 3.0f
#define HintInsetsVer 14.f
#define HintInsetsHor 29.f

static JCWToastTool *shareInstance = nil;

#pragma mark - HintLabel
@interface HintLabel : UILabel
@end

@implementation HintLabel
- (void)drawTextInRect:(CGRect)rect {
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, UIEdgeInsetsMake(HintInsetsHor, HintInsetsVer, HintInsetsHor, HintInsetsVer))];
}
@end

#pragma mark - JCWToastTool
@interface JCWToastTool ()
@property (strong, nonatomic) NSMutableArray * hintLabelArr;
@property (nonatomic, strong) CMMotionManager * motionMgr;
@end

@implementation JCWToastTool
+ (instancetype)shareUtil {
    //创建单例
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[JCWToastTool alloc] init];
        [shareInstance initAcceler];
    });
    return shareInstance;
}
+ (void)showHint:(NSString *)hint {
    if (hint.length == 0) {
        return ;
    }
    HintLabel *hintLabel = [self createHintLabelWithText:hint];
    [self showLabel:hintLabel];
    [self performSelector:@selector(hideLabel:) withObject:hintLabel afterDelay:HintShowDuration];

    hintLabel.transform = CGAffineTransformScale(hintLabel.transform, 0, 0);
    [UIView animateWithDuration:0.2f animations:^{
        hintLabel.transform = CGAffineTransformIdentity;
        //第二个开始每个往上移动, 间距为12
        JCWToastTool *shareUtil = [JCWToastTool shareUtil];
        for (NSInteger i = shareUtil.hintLabelArr.count-2; i >= 0; i--) {
            UILabel *label = shareUtil.hintLabelArr[i];
            CGRect frame = label.frame;
            frame.origin.y -= (frame.size.height + 12);
            label.frame = frame;
            //状态栏：你挡到我了。
            if (frame.origin.y < [[UIApplication sharedApplication] statusBarFrame].size.height) {
                [label removeFromSuperview];
            }
        }
    }];
}
- (NSMutableArray *)hintLabelArr {
    if (!_hintLabelArr) {
        _hintLabelArr = [NSMutableArray array];
    }
    return _hintLabelArr;
}
+ (void)showLabel:(UILabel *)label {
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    label.center = window.center;
    [window addSubview:label];
    
    JCWToastTool *shareUtil = [JCWToastTool shareUtil];
    [shareUtil.hintLabelArr addObject:label];
}
+ (void)hideLabel:(UILabel *)label {
    [UIView animateWithDuration:0.3 animations:^{
        label.alpha = 0;
    } completion:^(BOOL finished) {
        [label removeFromSuperview];
        JCWToastTool *shareUtil = [JCWToastTool shareUtil];
        [shareUtil.hintLabelArr removeObject:label];
    }];
}
+ (HintLabel *)createHintLabelWithText:(NSString *)text {
    HintLabel *hintLabel = [[HintLabel alloc] init];
    hintLabel.font = [UIFont boldSystemFontOfSize:15];
    hintLabel.backgroundColor = COLOR(22, 21, 21, 0.72); //#161515
    hintLabel.textAlignment = NSTextAlignmentCenter;
    hintLabel.textColor = [UIColor whiteColor];
    hintLabel.layer.cornerRadius = 8;
    hintLabel.layer.masksToBounds = YES;
    hintLabel.numberOfLines = 0;
    hintLabel.text = text;
    
    CGFloat maxW = SCREEN_WIDTH - 84*2;
    CGFloat maxH = SCREEN_HEIGHT - 84*2;
    NSDictionary * dict = [NSDictionary dictionaryWithObject:hintLabel.font forKey:NSFontAttributeName];
    CGRect rect = [text boundingRectWithSize:CGSizeMake(maxW, maxH) options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    hintLabel.frame = CGRectMake(0, 0, maxW + HintInsetsVer*2, rect.size.height + HintInsetsHor*2);
    
    return hintLabel;
}
+ (void)showSysAlertWithMsg:(NSString *)msg confirm:(void(^)(void))confirmBlock cancel:(void(^)(void))cancelBlock {
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"温馨提示" message:msg preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (cancelBlock) {
            cancelBlock();
        }
    }];
    UIAlertAction * confirmAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (confirmBlock) {
            confirmBlock();
        }
    }];
    [alertController addAction:cancelAction];
    [alertController addAction:confirmAction];
    UIViewController * currentVC = [UIApplication sharedApplication].delegate.window.rootViewController;
    [currentVC presentViewController:alertController animated:YES completion:nil];
}
- (void)initAcceler {
    //加速度
    if (self.motionMgr.isAccelerometerAvailable) {
        NSOperationQueue * queue = [[NSOperationQueue alloc] init];
        [self.motionMgr startAccelerometerUpdatesToQueue:queue withHandler:^(CMAccelerometerData * _Nullable accelerometerData, NSError * _Nullable error) {
            if (error) {
                [self.motionMgr stopAccelerometerUpdates];
                NSLog(@"加速计发生错误!");
                return ;
            }
            CMAcceleration acceleration = accelerometerData.acceleration;
            //NSLog(@"x:%f y:%f z:%f", acceleration.x, acceleration.y, acceleration.z);
            //自身View跟随
            dispatch_async(dispatch_get_main_queue(), ^{
                for (UILabel * label in self.hintLabelArr) {
                    label.transform = CGAffineTransformMakeTranslation(10*acceleration.x, 10*acceleration.y);
                }
            });
        }];
    }
}
- (CMMotionManager *)motionMgr {
    if (!_motionMgr) {
        _motionMgr = [[CMMotionManager alloc] init];
    }
    return _motionMgr;
}
@end
