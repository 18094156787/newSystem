//
//  JNMatchDetailZBTopCell.m
//  Jingcai
//
//  Created by Administrator on 2019/3/20.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JNMatchDetailZBTopCell.h"

@interface JNMatchDetailZBTopCell ()
@property (weak, nonatomic) IBOutlet UIView * nameView;
@property (weak, nonatomic) IBOutlet UILabel * msgLabel;
@end

@implementation JNMatchDetailZBTopCell
- (void)awakeFromNib {
    [super awakeFromNib];
    //设置View的背景图
    UIImage * backGroundImage = [UIImage imageNamed:@"match_live_top"];
    self.nameView.contentMode = UIViewContentModeScaleAspectFill;
    self.nameView.layer.contents = (__bridge id _Nullable)(backGroundImage.CGImage);
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
- (void)layoutSubviews {
    [super layoutSubviews];
    [self layoutIfNeeded];
}
- (void)setLiveBall:(JNMatchLiveBall *)liveBall {
    _liveBall = liveBall;
    self.msgLabel.text = NonNil(liveBall.data);
}
- (void)setContent:(NSString *)content {
    _content = content;
    self.msgLabel.text = NonNil(content);
}
@end
