//
//  JCNoNewTuijianView.m
//  Jingcai
//
//  Created by Administrator on 2019/2/27.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCNoNewTuijianView.h"

@implementation JCNoNewTuijianView
- (IBAction)moreBtnClick:(UIButton *)sender {
    if (self.moreClickBlock) {
        self.moreClickBlock();
    }
}
@end
