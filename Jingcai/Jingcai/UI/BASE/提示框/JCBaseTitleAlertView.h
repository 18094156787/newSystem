//
//  JCBaseTitleAlertView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/22.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"
typedef void(^JCActionHandler)(void);
NS_ASSUME_NONNULL_BEGIN

@interface JCBaseTitleAlertView : JCBaseView

@property (nonatomic,strong) UIView *bgView;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *contentLab;

@property (nonatomic,strong) UIView *lineView;

@property (nonatomic,strong) UIButton *sureBtn;

@property (nonatomic,strong) UIButton *cancelBtn;


-(void)alertTitle:(NSString *)title TitleColor:(UIColor *)titleColor Mesasge:(NSString *)message MessageColor:(UIColor *)msgColor
     ComfirmTitle:(NSString *)comfirmTitle ComfirmColor:(UIColor *)Comfirmcolor confirmHandler:(JCActionHandler)confirmActionHandler;
-(void)alertTitle:(NSString *)title TitleColor:(UIColor *)titleColor Mesasge:(NSString *)message MessageColor:(UIColor *)msgColor
        SureTitle:(NSString *)sureTitle SureColor:(UIColor *)sureColor SureHandler:(JCActionHandler)sureHandler  CancleTitle:(NSString *)cancleTitle CancleColor:(UIColor *)cancleColor CancelHandler:(JCActionHandler)cancelHandler;

@end

NS_ASSUME_NONNULL_END
