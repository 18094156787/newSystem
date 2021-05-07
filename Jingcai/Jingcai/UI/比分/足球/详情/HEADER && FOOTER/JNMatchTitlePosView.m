//
//  JNMatchTitlePosView.m
//  Jingcai
//
//  Created by Administrator on 2019/6/11.
//  Copyright © 2019 jingcai. All rights reserved.
//

#import "JNMatchTitlePosView.h"
#import "JNMatchTitleView.h"

@interface JNMatchTitlePosView ()
@property (nonatomic, strong) JNMatchTitleView * titleView;
@end

@implementation JNMatchTitlePosView
- (void)awakeFromNib {
    [super awakeFromNib];
    [self addSubview:self.titleView];
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.titleView.frame = self.bounds;
}
- (JNMatchTitleView *)titleView {
    if (!_titleView) {
        _titleView = [JNMatchTitleView viewFromXib];
    }
    return _titleView;
}
- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleView.title = title;
}
- (void)setIsTransparent:(BOOL)isTransparent {
    _isTransparent = isTransparent;
    if (isTransparent) {
        self.titleView.backgroundColor = [UIColor clearColor];
    }
}
@end
