//
//  JCKindMoreFootView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/5/31.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCKindMoreFootView : JCBaseView

@property (nonatomic,strong) UILabel *contentLab;

@property (nonatomic,strong) NSString *title;

@property (nonatomic,copy) void(^JCBlock)(void);

- (void)showMore;

- (void)showNoMore;
@end

NS_ASSUME_NONNULL_END
