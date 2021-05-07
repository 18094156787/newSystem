//
//  JCHomeGanHuoHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/12.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCHomeGanHuoHeadView.h"
#import "JCBookeViewController.h"
@implementation JCHomeGanHuoHeadView

- (void)initViews {
    self.backgroundColor= COLOR_F0F0F0;
    [self addSubview:self.imgView];

    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(AUTO(8), AUTO(12), 0, AUTO(12)));
    }];
    
    


}

- (void)setUrl:(NSString *)url {
    _url = url;
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:url]];
}

- (UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [UIImageView new];
        _imgView.userInteractionEnabled = YES;
        [_imgView hg_setAllCornerWithCornerRadius:AUTO(5)];
    }
    return _imgView;
}

@end
