//
//  JNMatchFooterView.m
//  Jingcai
//
//  Created by Administrator on 2019/7/3.
//  Copyright © 2019 jingcai. All rights reserved.
//

#import "JNMatchFooterView.h"

@interface JNMatchFooterView ()
@property (nonatomic, strong) UIView * whiteView;
@end

@implementation JNMatchFooterView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColorFromRGB(0xF4F4F4);
        [self addSubview:self.whiteView];
    }
    return self;
}
- (UIView *)whiteView {
    if (!_whiteView) {
        _whiteView = [[UIView alloc] init];
        _whiteView.backgroundColor = [UIColor whiteColor];
    }
    return _whiteView;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.whiteView.frame = CGRectMake(0, 0, self.bounds.size.width, 10);
}
@end
