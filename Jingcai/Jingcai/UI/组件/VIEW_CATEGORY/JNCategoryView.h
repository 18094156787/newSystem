//
//  JNCategoryView.h
//  Jingcai
//
//  Created by Administrator on 2019/1/17.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JXCategoryTitleView.h"
//显示样式
typedef NS_ENUM(NSInteger, JNCategoryViewStyle) {
    JNCategoryViewStyleWhite,   //白字白线
    JNCategoryViewStyleBlack,   //黑字红线
    JNCategoryViewStyleShop     //商场样式,,oc
};

typedef void(^JCTabCategoryItemClickBlock)(NSInteger index);

NS_ASSUME_NONNULL_BEGIN
@interface JNCategoryView : JCBaseView
@property (nonatomic, strong) NSArray * titleArr;
@property (nonatomic, strong) UIScrollView * scrollView;
@property (nonatomic, assign) JNCategoryViewStyle style;
@property (nonatomic, copy) JCTabCategoryItemClickBlock tabItemClickBlock;
@property (nonatomic, readonly, assign) NSInteger selectedIndex;
@property (nonatomic, strong) JXCategoryTitleView * categoryView;
@end
NS_ASSUME_NONNULL_END
