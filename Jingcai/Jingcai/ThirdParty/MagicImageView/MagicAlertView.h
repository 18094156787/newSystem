//
//  MagicAlertView.h
//  Jingcai
//
//  Created by Rain on 2018/12/17.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCBaseView.h"
typedef void (^MagicSaveClickBlock) (void);
NS_ASSUME_NONNULL_BEGIN
@interface MagicAlertView : JCBaseView
@property (copy, nonatomic) MagicSaveClickBlock saveClickClickBlock;
- (void)show;
- (void)hide;
- (void)updateAlertMenu;
@end
NS_ASSUME_NONNULL_END
