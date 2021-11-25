//
//  JCMatchDetailWMStickVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/16.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "WMStickyPageController.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCMatchDetailWMStickVC : WMStickyPageController

@property (nonatomic, assign) CGFloat viewTop;

@property (nonatomic, strong) NSString * matchNum;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic,strong) NSString *model_id;

@property (nonatomic, assign) NSInteger show_odds;

@end

NS_ASSUME_NONNULL_END
