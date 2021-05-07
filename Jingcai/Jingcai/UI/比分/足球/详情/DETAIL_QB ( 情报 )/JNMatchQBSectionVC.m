//
//  JNMatchQBSectionVC.m
//  Jingcai
//
//  Created by Administrator on 2019/6/12.
//  Copyright © 2019 jingcai. All rights reserved.
//

#import "JNMatchQBSectionVC.h"
#import "RNNoData.h"
#import "UILabel+JNHtml.h"
#import "JCWStringTool.h"

@interface JNMatchQBSectionVC ()
@property (weak, nonatomic) IBOutlet UILabel * goodLabel;
@property (weak, nonatomic) IBOutlet UILabel * badLabel;
@property (weak, nonatomic) IBOutlet UILabel * neutralLabel;
@property (weak, nonatomic) IBOutlet UIView *goodView;
@property (weak, nonatomic) IBOutlet UIView *badView;
@property (weak, nonatomic) IBOutlet UIView *neutralView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *goodHConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *badHConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *neutralHConstraint;
@end

@implementation JNMatchQBSectionVC
- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    //无数据时
    self.goodHConstraint.constant = 100;
    [self.goodView showNoQingbaoData];
    self.goodHConstraint.constant = 100;
    [self.badView showNoQingbaoData];
    self.goodHConstraint.constant = 100;
    [self.neutralView showNoQingbaoData];
    
    //有数据时
    if (![JCWStringTool isEmptyStr:self.qingbaoBall.good]) {
        self.goodHConstraint.constant = CGRectGetMaxY(self.goodLabel.frame)+16;
        [self.goodView hideNoData];
    }
    if (![JCWStringTool isEmptyStr:self.qingbaoBall.bad]) {
        self.badHConstraint.constant = CGRectGetMaxY(self.badLabel.frame)+16;
        [self.badView hideNoData];
    }
    if (![JCWStringTool isEmptyStr:self.neutralBall.good]) {
        self.neutralHConstraint.constant = CGRectGetMaxY(self.neutralLabel.frame)+16;
        [self.neutralView hideNoData];
    }
}
- (void)setQingbaoBall:(JNMatchQingbaoBall *)qingbaoBall {
    _qingbaoBall = qingbaoBall;
    [self.goodLabel loadHtmlString:NonNil(qingbaoBall.good)];
    [self.badLabel loadHtmlString:NonNil(qingbaoBall.bad)];
    [self.view setNeedsLayout];
    if (self.needReturnHeightBlock) {
        self.needReturnHeightBlock([self contentH]);
    }
}
- (void)setNeutralBall:(JNMatchQingbaoBall *)neutralBall {
    _neutralBall = neutralBall;
    [self.neutralLabel loadHtmlString:NonNil(neutralBall.good)];
    [self.view setNeedsLayout];
    if (self.needReturnHeightBlock) {
        self.needReturnHeightBlock([self contentH]);
    }
}

#pragma mark - OVERRIDE
- (CGFloat)contentH {
    return CGRectGetMaxY(self.neutralView.frame);
}
@end
