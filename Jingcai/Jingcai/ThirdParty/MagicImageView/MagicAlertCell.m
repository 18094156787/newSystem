//
//  MagicAlertCell.m
//  Jingcai
//
//  Created by Rain on 2018/12/17.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "MagicAlertCell.h"

@interface MagicAlertCell ()
@property (weak, nonatomic) IBOutlet UILabel * titleLabel;
@end

@implementation MagicAlertCell

- (void)awakeFromNib {
    [super awakeFromNib];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = title;
}

@end
