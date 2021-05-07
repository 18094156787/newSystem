//
//  JCTeamDetailWMStickVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/13.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "WMStickyPageController.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCTeamDetailWMStickVC : WMStickyPageController

@property (nonatomic, assign) CGFloat viewTop;

@property (nonatomic,strong) NSString *competition_id;

@property (nonatomic,strong) NSString *team_id;

@end

NS_ASSUME_NONNULL_END
