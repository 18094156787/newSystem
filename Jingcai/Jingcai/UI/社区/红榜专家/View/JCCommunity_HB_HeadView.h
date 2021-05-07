//
//  JCCommunity_HB_HeadView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/10/29.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "LMJTab.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCCommunity_HB_HeadView : JCBaseView<LMJTabDelegate>

@property (nonatomic,strong) UIScrollView *scrollowView;

@property (nonatomic,strong) LMJTab * tabSegment;

@property (nonatomic, strong) UIView *moreView;

@property (nonatomic,strong) NSArray *dataSource;

@property (nonatomic,copy) void(^JCSelectBlock)(NSInteger count);

- (void)reloadIndex;

@end

NS_ASSUME_NONNULL_END
