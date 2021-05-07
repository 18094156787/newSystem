//
//  JNDIYemptyView.h
//  Jingcai
//
//  Created by 陈继伟 on 2019/8/27.
//  Copyright © 2019年 jingcai. All rights reserved.
//

#import "LYEmptyView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JNDIYemptyView : LYEmptyView

+ (instancetype)diyNoDataEmpty;

+ (instancetype)diyNoNetworkEmptyWithBlock:(LYActionTapBlock)btnClickBlock;

+ (instancetype)diyNoDataEmptyViewWithBlock:(LYActionTapBlock)btnClickBlock;

- (void)chageImageStr:(NSString *)ImageStr Title:(NSString *)title BtnTitle:(NSString *)btnTtitle;
@end

NS_ASSUME_NONNULL_END
