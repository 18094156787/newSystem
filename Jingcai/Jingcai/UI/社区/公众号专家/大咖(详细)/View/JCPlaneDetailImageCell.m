//
//  JCPlaneDetailImageCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2019/8/13.
//  Copyright © 2019年 blockstar. All rights reserved.
//

#import "JCPlaneDetailImageCell.h"

@implementation JCPlaneDetailImageCell

- (void)initViews {
    [self.contentView addSubview:self.imgView];
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.offset(AUTO(0));
        make.size.mas_equalTo(CGSizeMake(AUTO(250), AUTO(250)));
//        make.height.mas_equalTo(AUTO(250));
        make.bottom.offset(AUTO(-10));
    }];

    
}

- (void)setImg:(NSString *)img {
    _img = img;
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:img] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        if (error) {
            return;
        }
        float rate = image.size.width/(SCREEN_WIDTH-AUTO(30));
        if (rate>1.0f) {
             [self.imgView mas_updateConstraints:^(MASConstraintMaker *make) {
               make.size.mas_equalTo(CGSizeMake(image.size.width/rate, image.size.height/rate));
//                 make.height.mas_equalTo(image.size.height/rate);

               }];
        }else{
            [self.imgView mas_updateConstraints:^(MASConstraintMaker *make) {
//                  make.size.mas_equalTo(CGSizeMake(image.size.width, image.size.height));
                make.size.mas_equalTo(CGSizeMake(image.size.width/rate, image.size.height/rate));
//                make.height.mas_equalTo(AUTO(250));

              }];
        }
        NSLog(@"图片大小%@",NSStringFromCGSize(image.size));
//        NSLog(@"高度=%.0f--%@",image.size.height,img);
    }];
}

- (UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [UIImageView new];
        _imgView.contentMode = UIViewContentModeScaleAspectFit;
        _imgView.clipsToBounds = YES;
    }
    return _imgView;
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
