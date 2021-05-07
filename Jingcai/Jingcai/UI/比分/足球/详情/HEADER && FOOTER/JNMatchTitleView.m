//
//  JNMatchTitleView.m
//  Jingcai
//
//  Created by Administrator on 2019/6/10.
//  Copyright © 2019 jingcai. All rights reserved.
//

#import "JNMatchTitleView.h"

@interface JNMatchTitleView ()
@property (weak, nonatomic) IBOutlet UILabel * titleLabel;
@end

@implementation JNMatchTitleView
- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = NonNil(title);
}
@end
