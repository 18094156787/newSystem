//
//  JNTabBar.m
//  Jingcai
//
//  Created by Administrator on 2019/6/4.
//  Copyright © 2019 jingcai. All rights reserved.
//

#import "JNTabBar.h"
#import "JNTabBarNormalButton.h"
#import "JNTabBarMainButton.h"
#import "UIView+JCBadge.h"
@interface JNTabBar ()
{
    UIEdgeInsets _oldSafeAreaInsets;
}
@property (strong, nonatomic) JNTabBarNormalButton * newsBtn;
@property (strong, nonatomic) JNTabBarNormalButton * matchBtn;
@property (strong, nonatomic) JNTabBarNormalButton * serviceBtn;
@property (strong, nonatomic) JNTabBarNormalButton * communityBtn;
@property (strong, nonatomic) JNTabBarNormalButton * mineBtn;
@property (strong, nonatomic) NSArray * btnArr;

@property (strong, nonatomic) UIImageView *backImgView;
@end

@implementation JNTabBar
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _oldSafeAreaInsets = UIEdgeInsetsZero;
        //设定bar背景色
        [self addSubview:self.backImgView];
        [self addSubview:self.newsBtn];
        [self addSubview:self.matchBtn];
        [self addSubview:self.serviceBtn];
        [self addSubview:self.communityBtn];
        [self addSubview:self.mineBtn];
//        self.btnArr = @[self.newsBtn, self.matchBtn, self.communityBtn, self.mineBtn];
        self.btnArr = @[self.newsBtn, self.matchBtn, self.serviceBtn, self.communityBtn, self.mineBtn];
        
        self.translucent = NO;
//        self.shadowImage = [UIImage new];
//        self.backgroundImage = [UIImage new];
//        self.barTintColor = [UIColor whiteColor];
        
        
        //给tabbar顶部添加阴影
//        self.layer.shadowOffset = CGSizeZero;
//        self.layer.shadowRadius = 5;
//        self.layer.shadowColor = [UIColor darkGrayColor].CGColor;
//        self.layer.shadowOpacity = 0.5;
//        [self startAmination];

    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    _oldSafeAreaInsets = UIEdgeInsetsZero;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat selfW = self.bounds.size.width;
    CGFloat selfH = self.bounds.size.height;
    CGFloat itemW = selfW/5;
    CGFloat itemH = selfH;
    //避开iPhoneX底部按钮
    if (@available(iOS 11.0, *)) {
        itemH -= self.safeAreaInsets.bottom;
    }
    

    self.backImgView.frame = CGRectMake(0, -10, selfW, itemH+10);
    //中间有加号按钮
    self.newsBtn.frame = CGRectMake(0, 0, itemW, itemH);
    self.matchBtn.frame = CGRectMake(itemW, 0, itemW, itemH);
//    self.serviceBtn.frame = CGRectMake(itemW*2, -itemH/2, itemW, itemH*1.5);
     self.serviceBtn.frame = CGRectMake(itemW*2, 0, itemW, itemH);
    self.communityBtn.frame = CGRectMake(itemW*3, 0, itemW, itemH);
    self.mineBtn.frame = CGRectMake(itemW*4, 0, itemW, itemH);
}


#pragma mark - Setter Getter
- (JNTabBarNormalButton *)newsBtn {
    if (!_newsBtn) {
        _newsBtn = [JNTabBarNormalButton new];
        _newsBtn.title = @"首页";
        _newsBtn.normalImage = @"tabicon-zj-un";
        _newsBtn.selectImage = @"tabicon-zj";
        [_newsBtn addTarget:self action:@selector(tabBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _newsBtn;
}
- (JNTabBarNormalButton *)matchBtn {
    if (!_matchBtn) {
        _matchBtn = [JNTabBarNormalButton new];
        _matchBtn.title = @"比分";
        _matchBtn.normalImage = @"tabIcon-sc-un";
        _matchBtn.selectImage = @"tabicon-sc";
        [_matchBtn addTarget:self action:@selector(tabBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _matchBtn;
}
- (JNTabBarNormalButton *)serviceBtn {
    if (!_serviceBtn) {
        _serviceBtn = [JNTabBarNormalButton new];
        _serviceBtn.title = @"社区";
        _serviceBtn.normalImage = @"tabicon_sq-un";
        _serviceBtn.selectImage = @"tabicon_sq";
        [_serviceBtn addTarget:self action:@selector(tabBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _serviceBtn;
}
- (JNTabBarNormalButton *)communityBtn {
    if (!_communityBtn) {
        _communityBtn = [JNTabBarNormalButton new];
        _communityBtn.title = @"大数据";
        _communityBtn.normalImage = @"tabicon-sjk-un";
        _communityBtn.selectImage = @"tabicon-sjk";
        [_communityBtn addTarget:self action:@selector(tabBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _communityBtn;
}
- (JNTabBarNormalButton *)mineBtn {
    if (!_mineBtn) {
        _mineBtn = [JNTabBarNormalButton new];
        _mineBtn.title = @"我的";
        _mineBtn.normalImage = @"tabicon-wd-un";
        _mineBtn.selectImage = @"tabicon-wd";
        [_mineBtn addTarget:self action:@selector(tabBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _mineBtn;
}
- (void)setSelectedIndex:(NSUInteger)selectedIndex {
    _selectedIndex = selectedIndex;
    if (selectedIndex < self.btnArr.count) {
        UIButton * btn = self.btnArr[selectedIndex];
        [self tabBarButtonClick:btn];

    }
}
- (void)tabBarButtonClick:(UIButton *)button {
    for (UIButton * item in self.btnArr) {
        item.selected = NO;
    }
    button.selected = YES;
    if (self.btnClickBlock) {
        NSInteger index = [self.btnArr indexOfObject:button];
        self.btnClickBlock(index);

        if (index==4) {
            UIButton * mineitem = self.btnArr[4];
            [mineitem removeBadgeLabel];
        }else{
            
            if ([[JCWUserBall currentUser].info integerValue]>0) {
                UIButton * mineitem = self.btnArr[4];
                mineitem.badgeStr = [JCWUserBall currentUser].info;
            }
            

        }
    }
}


- (void)setMineBadge {
    UIButton * mineitem = self.btnArr[4];
    if ([JCWUserBall currentUser].info.length>0) {
        mineitem.badgeStr= [JCWUserBall currentUser].info;
    }

}
- (void)clearMineBadge {
    UIButton * Mineitem = self.btnArr[4];
    [Mineitem removeBadgeLabel];
}

- (void)startAmination {
//    if (self.selectedIndex!=2) {
//        if (self.serviceBtn.iconImageView.isAnimating) {
//            [self.serviceBtn.iconImageView stopAnimating];
//        }
//
//        [self.serviceBtn.iconImageView startAnimating];
//        self.isShake = YES;
//        [self performSelector:@selector(aminatioStop) withObject:nil afterDelay:1.5];
//
//    }

}

- (void)aminatioStop {
//    [self.serviceBtn.iconImageView stopAnimating];
//     [self performSelector:@selector(startAmination) withObject:nil afterDelay:3];
}

#pragma mark - Override
- (void)setItems:(NSArray<UITabBarItem *> *)items {
    // 这个比较重要
}
- (void)setItems:(NSArray<UITabBarItem *> *)items animated:(BOOL)animated {
    // 这个比较重要
}

#pragma mark - 凸出按钮的点击处理
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    CGPoint newPoint = [self convertPoint:point toView:self.serviceBtn];
    // 判断是否属于按钮范围+如果没显示TABBAR则不要响应
    if ([self.serviceBtn pointInside:newPoint withEvent:event] && !self.hidden) {
        return self.serviceBtn;
    }
    return [super hitTest:point withEvent:event];
}


#pragma mark - 📌 iPhoneX TABBAR push后的偏移问题
- (void)safeAreaInsetsDidChange {
    [super safeAreaInsetsDidChange];
    if (!UIEdgeInsetsEqualToEdgeInsets(_oldSafeAreaInsets, self.safeAreaInsets)) {
        [self invalidateIntrinsicContentSize];
        if (self.superview) {
            [self.superview setNeedsLayout];
            [self.superview layoutSubviews];
        }
    }
}
- (CGSize)sizeThatFits:(CGSize)size {
    size = [super sizeThatFits:size];
    if (@available(iOS 11.0, *)) {
        float bottomInset = self.safeAreaInsets.bottom;
        if (bottomInset > 0 && size.height < 50 && (size.height + bottomInset < 90)) {
            size.height += bottomInset;
        }
    }
    return size;
}
- (void)setFrame:(CGRect)frame {
    if (self.superview) {
        if (frame.origin.y + frame.size.height != self.superview.frame.size.height) {
            frame.origin.y = self.superview.frame.size.height - frame.size.height;
        }
    }
    [super setFrame:frame];
}

- (UIImageView *)backImgView {
    if (!_backImgView) {
        _backImgView = [UIImageView new];
        _backImgView.image = JCIMAGE(@"tabbar_bg");
//        _backImgView.backgroundColor = [UIColor redColor];
    }
    return _backImgView;
}


@end
