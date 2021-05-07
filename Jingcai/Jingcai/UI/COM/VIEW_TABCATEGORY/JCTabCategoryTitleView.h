//
//  JCTabCategoryTitleView.h
//  Jingcai
//
//  Created by Administrator on 2019/3/6.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCBaseView.h"

//item的宽度类型
typedef NS_ENUM(NSInteger, JCTabCategoryTitleItemWidthStyle) {
    JCTabCategoryTitleItemWidthStyleEqual,
    JCTabCategoryTitleItemWidthStyleFixed
};
typedef void(^JCTabCategoryTitleClickBlock)(NSInteger index);
NS_ASSUME_NONNULL_BEGIN
@interface JCTabCategoryTitleView : JCBaseView
@property (nonatomic, strong) NSArray * titleArr;
@property (nonatomic, strong) UIScrollView * scrollView;
@property (nonatomic, assign) JCTabCategoryTitleItemWidthStyle itemWidthStyle;
@property (nonatomic, copy) JCTabCategoryTitleClickBlock tabTitleClickBlock;
@end
NS_ASSUME_NONNULL_END
