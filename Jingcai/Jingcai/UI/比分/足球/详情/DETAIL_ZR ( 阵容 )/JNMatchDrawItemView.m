//
//  JNMatchDrawItemView.m
//  Jingcai
//
//  Created by Administrator on 2019/6/20.
//  Copyright © 2019 jingcai. All rights reserved.
//

#import "JNMatchDrawItemView.h"
#import "UIImageView+WebCache.h"

@interface JNMatchDrawItemView ()
@property (weak, nonatomic) IBOutlet UILabel * numLabel;
@property (weak, nonatomic) IBOutlet UIImageView * logoImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@end

@implementation JNMatchDrawItemView
- (void)setLineupBall:(JNMatchLineupBall *)lineupBall {
    _lineupBall = lineupBall;
    if ([lineupBall.name containsString:@"·"]) {
        NSArray *array = [lineupBall.name componentsSeparatedByString:@"·"];
        self.nameLabel.text = array.lastObject;
        
    }else {
        self.nameLabel.text = NonNil(lineupBall.name);
    }
    
    self.numLabel.text = NonNil(lineupBall.shirt_number);
    [self.logoImageView sd_setImageWithURL:[NSURL URLWithString:lineupBall.logo]];
}
- (void)setIsHomeTeam:(BOOL)isHomeTeam {
    _isHomeTeam = isHomeTeam;
    self.numLabel.backgroundColor = isHomeTeam ? UIColorFromRGB(0xFF2500) : UIColorFromRGB(0x4D5CE2);
}
@end
