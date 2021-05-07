//
//  JCTabCategoryView.h
//  Jingcai
//
//  Created by Administrator on 2019/1/17.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCBaseView.h"

//item的宽度类型
//typedef NS_ENUM(NSInteger, JCTabCategoryItemWidthStyle) {
//    JCTabCategoryItemWidthStyleEqual,
//    JCTabCategoryItemWidthStyleFixed
//};

typedef void(^JCTabCategoryItemClickBlock)(NSInteger index);

NS_ASSUME_NONNULL_BEGIN
@interface JCTabCategoryView : JCBaseView
@property (nonatomic, strong) NSArray * titleArr;
@property (nonatomic, strong) UIScrollView * scrollView;
//@property (nonatomic, assign) JCTabCategoryItemWidthStyle itemWidthStyle;
@property (nonatomic, copy) JCTabCategoryItemClickBlock tabItemClickBlock;
@end
NS_ASSUME_NONNULL_END
