//
//  JCTabCategoryTitleView.m
//  Jingcai
//
//  Created by Administrator on 2019/3/6.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCTabCategoryTitleView.h"
#import "JXCategoryView.h"

@interface JCTabCategoryTitleView () <JXCategoryViewDelegate>
@property (nonatomic, strong) JXCategoryTitleView * categoryView;
@property (nonatomic, strong) UIView * lineView;
@end

@implementation JCTabCategoryTitleView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.categoryView];
        [self addSubview:self.lineView];
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    [self addSubview:self.categoryView];
    [self addSubview:self.lineView];
}
- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat selfW = self.bounds.size.width;
    CGFloat selfH = self.bounds.size.height;
    CGFloat minW = MIN(self.titleArr.count * self.categoryView.cellWidth, selfW);
    self.categoryView.frame = CGRectMake((selfW-minW)/2, 0, minW, selfH-2);
    self.lineView.frame = CGRectMake(0, selfH-2, selfW, 2);
    
    //item的宽度设定
    if (self.itemWidthStyle == JCTabCategoryTitleItemWidthStyleEqual) {
        self.categoryView.cellWidth = selfW / self.titleArr.count;
    }
    if (self.itemWidthStyle == JCTabCategoryTitleItemWidthStyleFixed) {
        self.categoryView.cellWidth = 100;
    }
}
- (JXCategoryTitleView *)categoryView {
    if (!_categoryView) {
        UIColor * normalColor = UIColorFromRGB(0x999999);
        UIColor * selColor = UIColorFromRGB(0xff0000);
        _categoryView = [[JXCategoryTitleView alloc] init];
        _categoryView.backgroundColor = [UIColor orangeColor];
        _categoryView.titleColor = normalColor;
        _categoryView.titleSelectedColor = selColor;
        _categoryView.titleFont = [UIFont systemFontOfSize:16.f];
        _categoryView.cellWidth = 100;
        _categoryView.delegate = self;
        _categoryView.cellSpacing = 0;
        
        JXCategoryIndicatorTriangleView * triangleView = [[JXCategoryIndicatorTriangleView alloc] init];
        triangleView.indicatorWidth = 10.f;
        triangleView.indicatorHeight = 6.f;
        triangleView.indicatorColor = selColor;
        _categoryView.indicators = @[triangleView];
        

    }
    return _categoryView;
}
- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = UIColorFromRGB(0xff0000);
    }
    return _lineView;
}
- (void)setTitleArr:(NSArray *)titleArr {
    _titleArr = titleArr;
    //    [self.categoryView removeFromSuperview];
    self.categoryView.titles = titleArr;
    [self.categoryView reloadData];
    //    [self addSubview:self.categoryView];
}
- (void)setScrollView:(UIScrollView *)scrollView {
    _scrollView = scrollView;
    //    [self.categoryView removeFromSuperview];
    self.categoryView.contentScrollView = scrollView;
    [self.categoryView reloadData];
    //    [self addSubview:self.categoryView];
}

#pragma mark - JXCategoryViewDelegate
- (void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index {
    if (self.tabTitleClickBlock) {
        self.tabTitleClickBlock(index);
    }
}
@end
