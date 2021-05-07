//
//  UIView+NoData.m
//  Jingcai
//
//  Created by Rain on 2018/11/21.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "UIView+NoData.h"
#import "Masonry.h"
#import "JCNoDataView.h"
#import "JCNoNetworkView.h"
#import "JCNoSubscribeView.h"
#import "JCNoTuijianView.h"
#import "JCNoNewTuijianView.h"
#import "JCNoMatchSKView.h"

#define NODATA_VIEW_TAG 10000
#define NODATA_MASK_TAG 10001

@implementation UIView (NoData)

- (UIView *)getNoDataView {
    UIView * noDataView = [self viewWithTag:NODATA_VIEW_TAG];
    return noDataView;
}
- (void)showData {
    UIView * noDataView = [self viewWithTag:NODATA_VIEW_TAG];
    UIView * noDataMaskView = [self viewWithTag:NODATA_MASK_TAG];
    [noDataView removeFromSuperview];
    [noDataMaskView removeFromSuperview];
}
- (void)showNoData {
    [self showNoDataView];
}
- (void)clearColor {
    UIView * noDataView = [self viewWithTag:NODATA_VIEW_TAG];
    noDataView.backgroundColor = JCClearColor;
}


- (void)showNoDataWithRetryBlock:(NoDataRetryBlock)retryBlock {
    [self showNoDataView];
    JCNoDataView * noDataView = [self viewWithTag:NODATA_VIEW_TAG];
    noDataView.noDataClickBlock = ^{
        if (retryBlock) {
            retryBlock();
        }
    };
}
- (void)showNoNetwork {
    [self showNoNetworkView];
}
- (void)showNoNetworkWithRetryBlock:(NoDataRetryBlock)retryBlock {
    [self showNoNetworkView];
    JCNoNetworkView * noNetworkView = [self viewWithTag:NODATA_VIEW_TAG];
    noNetworkView.noNetworkClickBlock = ^{
        if (retryBlock) {
            retryBlock();
        }
    };
}
- (void)showBlank {
    [self showNoDataWithMsg:@""];
}

#pragma mark - Extend

- (void)showNoSubscribeDataWithClickBlock:(void(^)(void))clickBlock {
    JCNoSubscribeView * noSubscribeView = [JCNoSubscribeView viewFromXib];
    noSubscribeView.addSubscribeClickBlock = ^{
        if (clickBlock) {
            clickBlock();
        }
    };
    [self showNoDataWithView:noSubscribeView];
}
- (void)showNoTuijianData {
    JCNoTuijianView * noTuijianView = [JCNoTuijianView viewFromXib];
    [self showNoDataWithView:noTuijianView];
}
- (void)showNoNewTuijianDataWithClickBlock:(NoDataClickBlock)clickBlock {
    JCNoNewTuijianView * newTuijianView = [JCNoNewTuijianView viewFromXib];
    newTuijianView.moreClickBlock = ^{
        if (clickBlock) {
            clickBlock();
        }
    };
    [self showNoDataWithView:newTuijianView];
}
- (void)showNoMatchSKData {
    JCNoMatchSKView * noMatchSKView = [JCNoMatchSKView viewFromXib];
    [self showNoDataWithView:noMatchSKView];
}


#pragma mark - Based
- (void)showNoDataWithMsg:(NSString *)msg {
    UIView * noDataView = [self viewWithTag:NODATA_VIEW_TAG];
    if (noDataView) {
        [noDataView removeFromSuperview];
    }
    
    UIColor * backColor = self.backgroundColor ?: self.superview.backgroundColor ?: [UIColor whiteColor];
    
    //展示Label
    UILabel * label = [[UILabel alloc] init];
    label.backgroundColor = backColor;
    //label.backgroundColor = [UIColor orangeColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor lightGrayColor];
    label.text = msg;
    label.tag = NODATA_VIEW_TAG;
    [self addSubview:label];
    //add constraints
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        //make.center.equalTo(self);
        make.width.equalTo(self);
        make.height.equalTo(self);
    }];
}

//- (void)addRetryAction {
//    UIView * view = [self viewWithTag:NODATA_TAG];
//    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(retry)];
//    [view addGestureRecognizer:tap];
//}
//- (void)retry {
//    //
//}

- (void)showNoDataWithView:(UIView *)view {
    UIView * oldView = [self viewWithTag:NODATA_VIEW_TAG];
    if (oldView) {
        [oldView removeFromSuperview];
    }
    view.tag = NODATA_VIEW_TAG;
    [self addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.width.equalTo(self);
        make.height.equalTo(self);
    }];
}
- (void)showNoDataTopWithView:(UIView *)view  {
    UIView * oldView = [self viewWithTag:NODATA_VIEW_TAG];
    if (oldView) {
        [oldView removeFromSuperview];
    }
    view.tag = NODATA_VIEW_TAG;
    [self addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self);
        make.height.mas_equalTo(200);
    }];
}

- (void)showNoDataView {
    UIColor * backColor = self.backgroundColor ?: self.superview.backgroundColor ?: [UIColor whiteColor];
    //maskView
    if ([self isKindOfClass:[UIScrollView class]]) {
        //禁止上滑
        UIScrollView * scrollView = (UIScrollView *)self;
        scrollView.contentSize = CGSizeZero;
        //移除旧的View
        UIView * oldMaskView = [self viewWithTag:NODATA_MASK_TAG];
        if (oldMaskView) {
            [oldMaskView removeFromSuperview];
        }
        //遮住多余内容
        UIView * maskView = [[UIView alloc] init];
        maskView.backgroundColor = [UIColor whiteColor];
        maskView.tag = NODATA_MASK_TAG;
        maskView.backgroundColor = backColor;
        [self addSubview:maskView];
        [maskView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(self.bounds.size.width));
            make.height.equalTo(@(self.bounds.size.height*3/2));
        }];
    }
    
    //noDataView
    JCNoDataView * oldView = [self viewWithTag:NODATA_VIEW_TAG];
    if (oldView) {
        [oldView removeFromSuperview];
    }
    JCNoDataView * noDataView = [JCNoDataView viewFromXib];
    noDataView.tag = NODATA_VIEW_TAG;
    noDataView.backgroundColor = backColor;
    [self addSubview:noDataView];
    [self bringSubviewToFront:noDataView];
    [noDataView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.width.equalTo(self);
        make.height.equalTo(self);
    }];
}

- (void)showNoDataViewClearColor {
    UIColor * backColor = self.backgroundColor ?: self.superview.backgroundColor ?: [UIColor whiteColor];
    //maskView
    if ([self isKindOfClass:[UIScrollView class]]) {
        //禁止上滑
        UIScrollView * scrollView = (UIScrollView *)self;
        scrollView.contentSize = CGSizeZero;
        //移除旧的View
        UIView * oldMaskView = [self viewWithTag:NODATA_MASK_TAG];
        if (oldMaskView) {
            [oldMaskView removeFromSuperview];
        }
        //遮住多余内容
        UIView * maskView = [[UIView alloc] init];
        maskView.backgroundColor = [UIColor whiteColor];
        maskView.tag = NODATA_MASK_TAG;
        maskView.backgroundColor = backColor;
        [self addSubview:maskView];
        [maskView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(self.bounds.size.width));
            make.height.equalTo(@(self.bounds.size.height*3/2));
        }];
    }
    
    //noDataView
    JCNoDataView * oldView = [self viewWithTag:NODATA_VIEW_TAG];
    if (oldView) {
        [oldView removeFromSuperview];
    }
    JCNoDataView * noDataView = [JCNoDataView viewFromXib];
    noDataView.tag = NODATA_VIEW_TAG;
    noDataView.backgroundColor = JCClearColor;
    [self addSubview:noDataView];
    [self bringSubviewToFront:noDataView];
    [noDataView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.width.equalTo(self);
        make.height.equalTo(self);
    }];
}

- (void)showNoNetworkView {
    UIColor * backColor = self.backgroundColor ?: self.superview.backgroundColor ?: [UIColor whiteColor];
    JCNoNetworkView * oldView = [self viewWithTag:NODATA_VIEW_TAG];
    if (oldView) {
        [oldView removeFromSuperview];
    }
    JCNoNetworkView * noNetworkView = [JCNoNetworkView viewFromXib];
    noNetworkView.tag = NODATA_VIEW_TAG;
    noNetworkView.backgroundColor = backColor;
    [self addSubview:noNetworkView];
    [noNetworkView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.width.equalTo(self);
        make.height.equalTo(self);
    }];
}
//- (void)storageContentHeight {
//    CGFloat h = 0;
//    if ([self isKindOfClass:[UIScrollView class]]) {
//        UIScrollView * scrollView = (UIScrollView *)self;
//        h = scrollView.contentSize.height;
//    } else {
//        [self layoutIfNeeded];
//        h = self.bounds.size.height;
//    }
//    //iPhone 5s+均为64位
//    [[NSUserDefaults standardUserDefaults] setDouble:h forKey:NODATA_MASK_KEY];
//}
//- (CGFloat)cachedContentHeight {
//    return [[NSUserDefaults standardUserDefaults] doubleForKey:NODATA_MASK_KEY];
//}
@end
