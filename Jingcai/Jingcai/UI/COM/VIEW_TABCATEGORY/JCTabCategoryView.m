
//
//  JCTabCategoryView.m
//  Jingcai
//
//  Created by Administrator on 2019/1/17.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCTabCategoryView.h"
#import "JXCategoryView.h"

@interface JCTabCategoryView () <JXCategoryViewDelegate>
@property (nonatomic, strong) JXCategoryTitleView * categoryView;
@property (nonatomic, strong) UIView * lineView;
@end

@implementation JCTabCategoryView
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
//    CGFloat minW = MIN(self.titleArr.count * self.categoryView.cellWidth, selfW);
    self.categoryView.frame = CGRectMake(0, 0, selfW, selfH-1);
    self.lineView.frame = CGRectMake(0, selfH-1, selfW, 1);
    
    //item的宽度设定
    if (self.titleArr.count > 0) {
        self.categoryView.cellWidth = selfW / self.titleArr.count;
        [self.categoryView reloadData];
    }
}
- (JXCategoryTitleView *)categoryView {
    if (!_categoryView) {
        UIColor * normalColor = UIColorFromRGB(0x999999);
        UIColor * selColor = UIColorFromRGB(0xff0000);
        _categoryView = [[JXCategoryTitleView alloc] init];
        //_categoryView.backgroundColor = [UIColor orangeColor];
        _categoryView.titleColor = normalColor;
        _categoryView.titleSelectedColor = selColor;
        _categoryView.titleFont = [UIFont systemFontOfSize:16.f];
        _categoryView.delegate = self;
        _categoryView.cellSpacing = 0;
        
        JXCategoryIndicatorLineView * lineView = [[JXCategoryIndicatorLineView alloc] init];
        lineView.indicatorColor = UIColorFromRGB(0xEE2C2C);
        lineView.verticalMargin = 0;
        _categoryView.indicators = @[lineView];
        
    }
    return _categoryView;
}
- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        //_lineView.backgroundColor = UIColorFromRGB(0xff0000);
        _lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    return _lineView;
}
- (void)setTitleArr:(NSArray *)titleArr {
    _titleArr = titleArr;
//    [self.categoryView removeFromSuperview];
    self.categoryView.titles = titleArr;
    [self.categoryView reloadData];
    [self setNeedsLayout];
}
- (void)setScrollView:(UIScrollView *)scrollView {
    _scrollView = scrollView;
//    [self.categoryView removeFromSuperview];
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

#pragma mark - JXCategoryViewDelegate
- (void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index {
    if (self.tabItemClickBlock) {
        self.tabItemClickBlock(index);
    }
}
@end
