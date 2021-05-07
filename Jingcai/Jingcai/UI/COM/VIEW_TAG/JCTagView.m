//
//  JCTagView.m
//  Jingcai
//
//  Created by Administrator on 2019/4/2.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCTagView.h"
#import "JCWStringTool.h"

@interface JCTagView ()
@property (weak, nonatomic) IBOutlet UILabel *nearLabel;
@property (weak, nonatomic) IBOutlet UILabel *hongLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint * nearWConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint * hongWConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint * hongLeadingConstraint;
@end

@implementation JCTagView
- (void)awakeFromNib {
    [super awakeFromNib];
    self.nearLabel.layer.borderColor = COLOR_5194E3.CGColor;
    self.nearLabel.textColor = COLOR_5194E3;
    self.nearLabel.layer.borderWidth = 1;
    self.hongLabel.textColor = JCBaseColor;
    self.hongLabel.layer.borderColor = JCBaseColor.CGColor;
    self.hongLabel.layer.borderWidth = 1;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    //添加圆角
    self.nearLabel.layer.cornerRadius = self.nearLabel.bounds.size.height/2;
    self.hongLabel.layer.cornerRadius = self.hongLabel.bounds.size.height/2;
    //是否隐藏
    BOOL hasNear = ![JCWStringTool isEmptyStr:self.near];
    BOOL hasHong = ![JCWStringTool isEmptyStr:self.hong];
    self.nearLabel.hidden = !hasNear;
    self.hongLabel.hidden = !hasHong;
    
    self.hongLeadingConstraint.constant = hasNear ? self.nearLabel.bounds.size.width+4 : 0;
    
    //若超过self宽度就隐藏
    CGFloat selfW = self.bounds.size.width;
    if (!self.nearLabel.hidden && CGRectGetMaxX(self.nearLabel.frame) > selfW) {
        self.nearLabel.hidden = YES;
    }
    if (!self.hongLabel.hidden && CGRectGetMaxX(self.hongLabel.frame) > selfW) {
        self.hongLabel.hidden = YES;
    }
}
- (void)setNear:(NSString *)near {
    _near = near;
    self.nearLabel.text = NonNil(near);
    CGSize nearSize = [near sizeWithAttributes:@{NSFontAttributeName:self.nearLabel.font}];
    self.nearWConstraint.constant = nearSize.width+14;
    [self setNeedsLayout];
}
- (void)setHong:(NSString *)hong {
    _hong = hong;
    self.hongLabel.text = NonNil(hong);
    CGSize hongSize = [hong sizeWithAttributes:@{NSFontAttributeName:self.hongLabel.font}];
    self.hongWConstraint.constant = hongSize.width+14;
    [self setNeedsLayout];
}
@end
