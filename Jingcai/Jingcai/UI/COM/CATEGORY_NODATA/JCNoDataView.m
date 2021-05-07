//
//  JCNoDataView.m
//  Jingcai
//
//  Created by Rain on 2018/11/23.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCNoDataView.h"

@implementation JCNoDataView
- (void)awakeFromNib {
    [super awakeFromNib];
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewClick)];
    [self addGestureRecognizer:tap];
}
- (void)viewClick {
    if (self.noDataClickBlock) {
        self.noDataClickBlock();
    }
}
@end
