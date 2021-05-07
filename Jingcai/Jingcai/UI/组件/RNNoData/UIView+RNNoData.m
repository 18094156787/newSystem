//
//  UIView+RNNoData.m
//  NASA
//
//  Created by Administrator on 2019/7/9.
//  Copyright © 2019 rain. All rights reserved.
//

#import "UIView+RNNoData.h"
#import <objc/runtime.h>
#import "RNNoDataDIYView.h"


#pragma mark - 📌 RNNoDataView
@interface RNNoDataView : UIView

@property (nonatomic, strong) UILabel * msgLabel;

@property (nonatomic, assign) BOOL isTop;
@end

@implementation RNNoDataView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.msgLabel];
    }
    return self;
}
- (UILabel *)msgLabel {
    if (!_msgLabel) {
        _msgLabel = [[UILabel alloc] init];
        _msgLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        _msgLabel.textAlignment = NSTextAlignmentCenter;
        _msgLabel.textColor = COLOR_2F2F2F;
        _msgLabel.text = @"暂无数据";
    }
    return _msgLabel;
}
- (void)setIsTop:(BOOL)isTop {
    _isTop = isTop;
    [self setNeedsLayout];
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.msgLabel.frame = self.isTop ? CGRectMake(0, 0, self.bounds.size.width, 200) : self.bounds;
}
@end





#pragma mark - 📌 ****
static NSString * const RNNoDataViewKey;

@interface UIView ()
@property (nonatomic, strong) UIView * noDataView;
@end

@implementation UIView (RNNoData)
- (RNNoDataView *)noDataView {
    return objc_getAssociatedObject(self, &RNNoDataViewKey);
}
- (void)setNoDataView:(RNNoDataView *)noDataView {
    objc_setAssociatedObject(self, &RNNoDataViewKey, noDataView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)showNoData {
    [self.noDataView removeFromSuperview];
    if (!self.noDataView) {
        self.noDataView = [RNNoDataView new];
        self.noDataView.backgroundColor = self.backgroundColor;
    }
    
    //避免覆盖了LoadingView
    UIView * lastView = [self.subviews lastObject];
    if (lastView && [lastView isKindOfClass:NSClassFromString(@"RNLoadingView")]) {
        [self insertSubview:self.noDataView belowSubview:lastView];
    } else {
        [self addSubview:self.noDataView];
    }
    
    [self.noDataView removeConstraints:self.noDataView.constraints];
    [self addConstraintsForView:self.noDataView];
}
- (void)hideNoData {
    [self.noDataView removeFromSuperview];
}
- (void)showTopNoData {
    [self showNoData];
    ((RNNoDataView *)self.noDataView).isTop = YES;
}

- (void)addConstraintsForView:(UIView *)view {
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                     attribute:NSLayoutAttributeWidth
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeWidth
                                                    multiplier:1
                                                      constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeHeight
                                                    multiplier:1
                                                      constant:0]];
}

#pragma mark - 📌 扩展
- (void)showNoDataWithView:(UIView *)view {
    [self.noDataView removeFromSuperview];
    [self addSubview:view];
    view.backgroundColor = self.backgroundColor;
    [self addConstraintsForView:view];
    self.noDataView = view;
}
- (void)showNoDataClearViewWithTitle:(NSString *)title {
    UIView *view = [RNNoDataDIYView noDataClearViewWithTitle:title];
  
    self.backgroundColor = JCClearColor;
    [self showNoDataWithView:view];
}

- (void)showNoDataClearViewWithTitle:(NSString *)title isTop:(BOOL)isTop{
    UIView *view = [RNNoDataDIYView noDataClearViewWithTitle:title];
    self.backgroundColor = JCClearColor;
//    [self showNoDataTopWithView]
    [self showNoDataWithView:view];

  }


- (void)showNoQingbaoData {
    [self showNoDataWithView:[RNNoDataDIYView noQingbaoDataView]];
}
- (void)showNoCommentData {
    [self showNoDataWithView:[RNNoDataDIYView noCommentDataView]];
}
- (void)showNoZhiBoData {
    [self showNoDataWithView:[RNNoDataDIYView noZhiBoDataView]];
}
@end
