//
//  AppDelegate.h
//  Jingcai
//
//  Created by Rain on 2018/10/7.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WXApi.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, WXApiDelegate>
@property (strong, nonatomic) UIWindow *window;
- (void)agreeConfigWithLaunchOptions;
- (void)configThirdConfig;
- (void)configUM;
@end

