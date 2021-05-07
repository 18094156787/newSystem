//
//  JNNewsTableViewCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/29.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JNNewsTableViewCell.h"

@implementation JNNewsTableViewCell

- (void)initViews {
    self.backgroundColor = COLOR_F0F0F0;
    
    UIView *bgView = [UIView new];
    bgView.backgroundColor = JCWhiteColor;
    [self.contentView addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.insets(UIEdgeInsetsMake(AUTO(8), AUTO(8), 0, AUTO(8)));
        make.left.top.offset(AUTO(8));
        make.right.offset(AUTO(-8));
        make.bottom.offset(0);
    }];
    
    [bgView addSubview:self.iconImgView];
    [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(12));
        make.centerY.equalTo(bgView);
        make.size.mas_equalTo(CGSizeMake(AUTO(110), AUTO(68)));
    }];
    
    [bgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconImgView);
        make.left.equalTo(self.iconImgView.mas_right).offset(AUTO(12));
        make.right.offset(AUTO(-12));
    }];
    
    [bgView addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLab);
        make.bottom.equalTo(self.iconImgView);
    }];
    
    [bgView addSubview:self.countLab];
    [self.countLab mas_makeConstraints:^(MASConstraintMaker *make) {
       make.right.equalTo(self.titleLab);
       make.bottom.equalTo(self.iconImgView);
    }];
    

}

- (void)setModel:(JCWNewsBall *)model {
    _model = model;
    if (model.is_top==1) {
        NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:model.title];
         NSTextAttachment *attch = [[NSTextAttachment alloc] init];
            // 表情图片
            attch.image = JCIMAGE(@"icon_zhiding");

            // 设置图片大小

            attch.bounds = CGRectMake(0, -3, 32, 16);

            // 创建带有图片的富文本

            NSAttributedString *string = [NSAttributedString attributedStringWithAttachment:attch];

    //    [attr appendAttributedString:string]; //在文字后面添加图片
         [attr insertAttributedString:string atIndex:0];
        self.titleLab.attributedText = attr;
    }else {
        self.titleLab.text = model.title;
    }

    self.timeLab.text = model.created_at;
    [self.iconImgView sd_setImageWithURL:[NSURL URLWithString:model.image.url] placeholderImage:JCIMAGE(@"ic_article_default")];
//    if (model.image.count>0) {
//        JCImageModel *imageModel = model.image.firstObject;
//        [self.iconImgView sd_setImageWithURL:[NSURL URLWithString:imageModel.url] placeholderImage:nil];
//    }
    
    self.countLab.text = [NSString stringWithFormat:@"%@人浏览",model.pageviews];
}


- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel labelTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentLeft];
        _titleLab.numberOfLines = 3;
    }
    return _titleLab;
}

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [UILabel labelTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:[COLOR_000000 colorWithAlphaComponent:0.6] andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentLeft];
    }
    return _timeLab;
}

- (UILabel *)countLab {
    if (!_countLab) {
        _countLab = [UILabel labelTitle:@"" andFont:AUTO(10) andWeight:0 andTextColor:[COLOR_000000 colorWithAlphaComponent:0.6] andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentLeft];
    }
    return _countLab;
}

- (UILabel *)zhidingLab {
    if (!_zhidingLab) {
        _zhidingLab = [UILabel labelTitle:@"置顶" andFont:AUTO(10) andWeight:0 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _zhidingLab.layer.borderColor = JCBaseColor.CGColor;
        _zhidingLab.layer.borderWidth = 1;
        _zhidingLab.layer.cornerRadius = AUTO(8);
        _zhidingLab.layer.masksToBounds = YES;
    }
    return _zhidingLab;
}

- (UIImageView *)iconImgView {
    if (!_iconImgView) {
        _iconImgView = [UIImageView new];
        [_iconImgView hg_setAllCornerWithCornerRadius:AUTO(3)];
    }
    return _iconImgView;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = COLOR_DDDDDD;
    }
    return _lineView;;
}

@end
