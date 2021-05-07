//
//  JNMatchTimeHeaderView.m
//  Jingcai
//
//  Created by Administrator on 2019/7/3.
//  Copyright © 2019 jingcai. All rights reserved.
//

#import "JNMatchTimeHeaderView.h"

@interface JNMatchTimeHeaderView ()
@property (nonatomic, strong) UILabel * timeLabel;
@end

@implementation JNMatchTimeHeaderView
- (void)awakeFromNib {
    [super awakeFromNib];
    [self addSubview:self.timeLabel];
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.timeLabel.frame = self.bounds;
}
- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.textAlignment = NSTextAlignmentCenter;
        _timeLabel.textColor = UIColorFromRGB(0x333333);
        _timeLabel.font = [UIFont fontWithName:@"PingHeiText" size:12];
    }
    return _timeLabel;
}
- (void)setTime:(NSString *)time {
    _time = time;
    self.timeLabel.text = NonNil(time);
}
@end
