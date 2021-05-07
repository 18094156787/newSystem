//
//  JCJingCaiReasonView.m
//  Jingcai
//
//  Created by 陈继伟 on 2019/11/29.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCJingCaiReasonView.h"

@interface JCJingCaiReasonView()
@property (nonatomic,assign) float position;
@property (nonatomic,assign) float height;
@end


@implementation JCJingCaiReasonView


- (void)initViews {
    self.position = AUTO(40)+kNavigationBarHeight;//contentTV的y坐标
    self.height = AUTO(350);//contentTV的高度
    self.backgroundColor = [JCBlackColor colorWithAlphaComponent:0.5];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
            UIButton *bottom = [UIButton new];
    //        bottom.backgroundColor = [UIColor redColor];
            [self addSubview:bottom];
            [bottom mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.insets(UIEdgeInsetsMake(5, 5, 5, 5));
    //            make.size.mas_equalTo(CGSizeMake(410, AUTO(200)));
            }];
    
    WeakSelf;
            [bottom bk_whenTapped:^{
                [weakSelf removeFromSuperview];
            }];


    [self addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(35));
        make.right.offset(AUTO(-35));
        make.top.offset(AUTO(40)+kNavigationBarHeight);
        make.height.mas_equalTo(AUTO(350));
    }];


    [self addSubview:self.topImgView];
    [self.topImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(30)+kNavigationBarHeight);
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(AUTO(164), AUTO(40)));
    }];

    [self.topImgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.topImgView);
        make.centerX.equalTo(self.topImgView);
        make.size.mas_equalTo(CGSizeMake(AUTO(164), AUTO(40)));
    }];
    

    [self.bgView addSubview:self.contentTV];
    [self.contentTV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.offset(AUTO(40));
        make.bottom.equalTo(self.bgView).offset(AUTO(-65));

    }];

    [self.bgView addSubview:self.sureBtn];
    [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.offset(AUTO(-15));
        make.size.mas_equalTo(CGSizeMake(AUTO(105), AUTO(35)));
    }];
    

    [self.sureBtn bk_whenTapped:^{
        if (weakSelf.JCReasonBlock) {
            weakSelf.JCReasonBlock(NonNil(weakSelf.contentTV.text));
        }
    }];

}

- (EMTextView *)contentTV {
    if (!_contentTV) {
        _contentTV = [EMTextView new];
        _contentTV.placeholder = @"50字及以上原创,从基本面、指数等方面分析";
        _contentTV.font = [UIFont systemFontOfSize:AUTO(13)];
    }
    return _contentTV;
}


- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"填写预测理由" andFont:AUTO(15) andWeight:UIFontWeightSemibold andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _titleLab;
}


- (UIImageView *)bottomImgView {
    if (!_bottomImgView) {
        _bottomImgView = [UIImageView new];
        _bottomImgView.image = JCIMAGE(@"xuline");
    }
    return _bottomImgView;
}

- (UIImageView *)topImgView {
    if (!_topImgView) {
        _topImgView = [UIImageView new];
        _topImgView.image = JCIMAGE(@"norule_title");
    }
    return _topImgView;
}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.backgroundColor = JCWhiteColor;
        [_bgView hg_setAllCornerWithCornerRadius:AUTO(10)];
    }
    return _bgView;
}

- (UIButton *)sureBtn {
    if (!_sureBtn) {
        _sureBtn = [UIButton initWithText:@"提交" FontSize:AUTO(12) BackGroundColor:JCBaseColor TextColors:JCWhiteColor];
        [_sureBtn hg_setAllCornerWithCornerRadius:AUTO(5)];
    }
    return _sureBtn;
}

- (void)keyboardWillShow:(NSNotification *)notification

{

    //获取键盘高度，在不同设备上，以及中英文下是不同的

    CGFloat kbHeight = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;

    // 取得键盘的动画时间，这样可以在视图上移的时候更连贯

    double duration = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];

    CGFloat offset = SCREEN_HEIGHT - (self.position+self.height+kbHeight);

    if(offset<=0)

    {

        [UIView animateWithDuration:duration animations:^{

            CGRect frame = self.frame;

            frame.origin.y = offset;

            self.frame = frame;

        }];

    }

}

/**

 *  键盘消失

 */

- (void)keyboardWillHide:(NSNotification *)notification

{

    // 键盘动画时间

    double duration = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];

    

    //视图下沉恢复原状

    [UIView animateWithDuration:duration animations:^{

        self.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);

    }];

}
@end
