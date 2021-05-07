//
//  JCBaseTableViewCell.m
//  Jingcai
//
//  Created by Rain on 2018/10/9.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell.h"

@implementation JCBaseTableViewCell
- (void)awakeFromNib {
    [super awakeFromNib];
//    self.backgroundColor = JCWhiteColor;
    UIView * selView = [[UIView alloc] init];
    selView.backgroundColor = UIColorFromRGB(0xEEEEEE);
    self.selectedBackgroundView = selView;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
- (CGFloat)cellH {
    NSLog(@"需要重写cellH方法");
    return 0;
}
- (CGFloat)maxTitleY {
    NSLog(@"需要重写maxTitleY方法");
    return 0;
}
@end
