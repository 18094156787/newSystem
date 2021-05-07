//
//  JCBaseTableViewCell_New.m
//  Jingcai
//
//  Created by 陈继伟 on 2019/8/7.
//  Copyright © 2019年 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"

@implementation JCBaseTableViewCell_New

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = 0;
        [self initViews];
        [self data];
    }
    return self;
}

- (void)initViews {
    
}

- (void)data {
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
