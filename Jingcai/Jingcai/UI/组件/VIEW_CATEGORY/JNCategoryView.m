
//
//  JNCategoryView.m
//  Jingcai
//
//  Created by Administrator on 2019/1/17.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JNCategoryView.h"
#import "JXCategoryView.h"

@interface JNCategoryView () <JXCategoryViewDelegate>

@end

@implementation JNCategoryView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.categoryView];
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    [self addSubview:self.categoryView];
}
- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat selfW = self.bounds.size.width;
    CGFloat selfH = self.bounds.size.height;
    self.categoryView.frame = CGRectMake(0, 0, selfW, selfH-1);
    //均分item的宽度
    if (self.titleArr.count > 0) {
        self.categoryView.cellWidth = selfW / self.titleArr.count;
        [self.categoryView reloadData];
    }
}
- (JXCategoryTitleView *)categoryView {
    if (!_categoryView) {
        UIColor * normalColor = COLOR_999999;
        UIColor * selColor = UIColorFromRGB(0xFFFFFF);
        _categoryView = [[JXCategoryTitleView alloc] init];
        _categoryView.titleColor = normalColor;
        _categoryView.titleSelectedColor = selColor;
        _categoryView.titleFont = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        _categoryView.delegate = self;
        _categoryView.cellSpacing = 0;
        
        JXCategoryIndicatorLineView * lineView = [[JXCategoryIndicatorLineView alloc] init];
//        lineView.indicatorLineViewColor = UIColorFromRGB(0xFFFFFF);
        lineView.indicatorColor = JCBaseColor;
        lineView.lineStyle = JXCategoryIndicatorLineStyle_Normal;
        lineView.verticalMargin = 3;
        lineView.indicatorWidth = 28;
        lineView.indicatorHeight = 5;
        _categoryView.indicators = @[lineView];
 
    }
    return _categoryView;
}
- (void)setTitleArr:(NSArray *)titleArr {
    _titleArr = titleArr;
    self.categoryView.titles = titleArr;
    [self.categoryView reloadData];
    [self setNeedsLayout];
}
- (void)setScrollView:(UIScrollView *)scrollView {
    _scrollView = scrollView;
    self.categoryView.contentScrollView = scrollView;
    [self.categoryView reloadData];
    [self setNeedsLayout];
}
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView * hintView = [super hitTest:point withEvent:event];
    if ([hintView isKindOfClass:[JXCategoryCollectionView class]]) {
        return nil;
    }
    return hintView;
}
- (void)setStyle:(JNCategoryViewStyle)style {
    _style = style;
    if (style == JNCategoryViewStyleWhite) {
        self.categoryView.titleColor = UIColorFromRGB(0xFFFFFF);
        self.categoryView.titleSelectedColor = UIColorFromRGB(0xFFFFFF);
        JXCategoryIndicatorLineView * lineView = (JXCategoryIndicatorLineView *)[self.categoryView.indicators firstObject];
        lineView.indicatorColor = UIColorFromRGB(0xFFFFFF);
        lineView.indicatorWidth = 28;
        lineView.indicatorHeight = 1;
        return ;
    }
    if (style == JNCategoryViewStyleBlack) {
        self.categoryView.titleColor = COLOR_333333;
        self.categoryView.titleSelectedColor = JCBaseColor;
        JXCategoryIndicatorLineView * lineView = (JXCategoryIndicatorLineView *)[self.categoryView.indicators firstObject];
        lineView.indicatorColor = UIColorFromRGB(0xE4453D);
        lineView.indicatorWidth = 28;
        lineView.indicatorHeight = 1;
        return ;
    }
    if (style == JNCategoryViewStyleShop) {
        self.categoryView.titleColor = UIColorFromRGB(0x333333);
        self.categoryView.titleSelectedColor = UIColorFromRGB(0xE01212);
        JXCategoryIndicatorLineView * lineView = (JXCategoryIndicatorLineView *)[self.categoryView.indicators firstObject];
        lineView.indicatorColor = UIColorFromRGB(0xE01212);
        lineView.indicatorWidth = 48;
        lineView.indicatorHeight = 1;
        return ;
    }
    

}
- (NSInteger)selectedIndex {
    return self.categoryView.selectedIndex;
}

#pragma mark - JXCategoryViewDelegate
- (void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index {
    if (self.tabItemClickBlock) {
        self.tabItemClickBlock(index);
    }
}
@end
