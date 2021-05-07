//
//  JCCustomLoadingView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/8.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCCustomLoadingView.h"

@implementation JCCustomLoadingView

- (void)initViews {
    [self addSubview:self.imgView];
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(self);
        make.width.height.mas_equalTo(135);
    }];
    
    NSArray *array = @[@"cjLoading-1",@"cjLoading-2",@"cjLoading-3",@"cjLoading-4",@"cjLoading-5",@"cjLoading-6",@"cjLoading-7"];
    NSMutableArray *imgArray = [NSMutableArray array];
    for (NSString *text in array) {
        
        UIImage *image = JCIMAGE(text);
        [imgArray addObject:image];
    }
    
    // 设置动画图片
     self.imgView.animationImages = imgArray;

     // 设置动画的播放次数
     self.imgView.animationRepeatCount = 0;

     // 设置播放时长
     // 1秒30帧, 一张图片的时间 = 1/30 = 0.03333 20 * 0.0333
     self.imgView.animationDuration = 1.2;
    [self.imgView startAnimating];
}

- (UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [UIImageView new];
    }
    return _imgView;
}


@end
