//
//  JCAcitvityTool.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/4/19.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JCActivityTipView.h"
#import "JCActivityGuessVC.h"
#import "JCActivityDetailCommomVC.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCAcitvityTool : NSObject

@property (nonatomic,strong) UIWindow *jcWindow;

@property (nonatomic,strong) UIViewController *viewController;

@property (nonatomic,strong) NSMutableArray *activtyArray;

- (void)showActivityPresentWithPosition:(NSString *)position ViewController:(UIViewController *)viewController;

@end

NS_ASSUME_NONNULL_END
