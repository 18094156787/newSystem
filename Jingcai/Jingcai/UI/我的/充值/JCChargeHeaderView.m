//
//  JCChargeHeaderView.m
//  Jingcai
//
//  Created by Administrator on 2019/1/14.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCChargeHeaderView.h"
@interface JCChargeHeaderView ()
@property (weak, nonatomic) IBOutlet UILabel * titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subtitleLabel;
@property (weak, nonatomic) IBOutlet UILabel * descLabel;
@end
@implementation JCChargeHeaderView
- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = NonNil(title);
}
- (void)setSubtitle:(NSString *)subtitle {
    _subtitle = subtitle;
    self.subtitleLabel.text = NonNil(subtitle);
}
- (void)setDesc:(NSString *)desc {
    _desc = desc;
    self.descLabel.text = NonNil(desc);
}
@end
