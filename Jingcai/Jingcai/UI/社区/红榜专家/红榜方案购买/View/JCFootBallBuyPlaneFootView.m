//
//  JCFootBallBuyPlaneFootView.m
//  Jingcai
//
//  Created by 陈继伟 on 2019/9/17.
//  Copyright © 2019年 blockstar. All rights reserved.
//

#import "JCFootBallBuyPlaneFootView.h"
#import "JCFootBallBuyUserImgView.h"
#import "NSArray+Sudoku.h"
#import <SDWebImage.h>
@implementation JCFootBallBuyPlaneFootView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = JCWhiteColor;
        [self initViews];
    }
    return self;
}
- (void)initViews {
    [self addSubview:self.countLab];
    [self.countLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.offset(AUTO(15));
        make.height.mas_equalTo(AUTO(30));
    }];
    
    [self addSubview:self.bottomView];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.offset(AUTO(60));
//        make.height.mas_equalTo(AUTO(1000));
        make.bottom.offset(AUTO(-60));
    }];
    
    [self addSubview:self.moreBtn];
    [self.moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.bottomView.mas_bottom).offset(AUTO(AUTO(15)));
        make.height.mas_equalTo(AUTO(45));
    }];
//    self.moreBtn.hidden = YES;
}

- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    [self.bottomView removeAllSubviews];
    NSMutableArray *array = [NSMutableArray array];
    float width = (SCREEN_WIDTH-AUTO(20))/8.0f;
//    float length = (SCREEN_WIDTH-width*8)/9.0f;
    int row = ceil(self.dataArray.count/8.0);
    for (int i=0; i<row; i++) {
        for (int j=0; j<8; j++) {
            
            NSInteger num = j+8*i;
            if (self.dataArray.count>num) {
                JCPlanBuyPersonModel *model = self.dataArray[num];
                JCFootBallBuyUserImgView *view = [JCFootBallBuyUserImgView new];
        //        view.backgroundColor = JCBaseColor;
                [self.bottomView addSubview:view];
                view.frame = CGRectMake(AUTO(10)+width*j, width*i, width, width);
                [array addObject:view];
                [view.imgView sd_setImageWithURL:[NSURL URLWithString:model.user_img] placeholderImage:JCIMAGE(@"userImg_default") completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {

                }];

                NSLog(@"%ld",num);
            }

        }
    }


}


-(UIImage *) getImageFromURL:(NSString *)fileURL {
    //NSLog(@"执行图片下载函数");
    UIImage * result;
    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:fileURL]];
    result = [UIImage imageWithData:data];
    return result;
}


- (void)moreBtnClick {
    if (self.JCMoreBlock) {
        self.JCMoreBlock();
    }
}

//- (UIImage *)clipImage
//{
//    // 1.开启位图上下文，跟图片尺寸一样大
//    float width = (SCREEN_WIDTH-AUTO(20))/8.0f;
//    CGSize imageSize = CGSizeMake(width, width);
//
//    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
//
//    // 2.设置圆形裁剪区域，正切与图片
//    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, imageSize.width, imageSize.height)];
//
//    // 2.2把路径设置为裁剪区域
//    [path addClip];
//
//    // 3.绘制图片
//    [self drawAtPoint:CGPointZero];
//
//    // 4.从上下文中获取图片
//    UIImage *clipImage = UIGraphicsGetImageFromCurrentImageContext();
//
//    // 5.关闭上下文
//    UIGraphicsEndImageContext();
//
//    return clipImage;
//}

- (UILabel *)countLab {
    if (!_countLab) {
        _countLab = [UILabel labelTitle:@"该文章已有1888人查看" andFont:AUTO(14) andWeight:0 andTextColor:COLOR_A9A9A9 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _countLab;
}

- (UIButton *)moreBtn {
    if (!_moreBtn) {
        _moreBtn = [UIButton initWithText:@"查看更多>" FontSize:AUTO(15) BackGroundColor:JCClearColor TextColors:COLOR_999999];
        [_moreBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, AUTO(15), 0)];
        [_moreBtn addTarget:self action:@selector(moreBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _moreBtn;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [UIView new];
    }
    return _bottomView;
}

@end
