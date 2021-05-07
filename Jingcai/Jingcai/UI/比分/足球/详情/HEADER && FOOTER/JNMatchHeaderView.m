//
//  JNMatchHeaderView.m
//  Jingcai
//
//  Created by Administrator on 2019/7/3.
//  Copyright © 2019 jingcai. All rights reserved.
//

#import "JNMatchHeaderView.h"

#pragma mark - 📌 暂固定高度为 44 或 88

@interface JNMatchHeaderView ()
@property (nonatomic, strong) UILabel * quoteLabel;
@property (nonatomic, strong) UILabel * titleLabel;
@property (strong, nonatomic) IBOutlet UIView *spfView;
@property (strong, nonatomic) IBOutlet UIView *rqspfView;
@property (strong, nonatomic) IBOutlet UIView *rsfView;
@property (strong, nonatomic) IBOutlet UIView *sxpView;
@property (strong, nonatomic) IBOutlet UIView *timeView;
@property (strong, nonatomic) IBOutlet UIView *goalView;
@property (strong, nonatomic) IBOutlet UIView *tableView;
@property (strong, nonatomic) IBOutlet UIView *zjView;
@end

@implementation JNMatchHeaderView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupView];
}
- (void)setupView {
    [self addSubview:self.quoteLabel];
    [self addSubview:self.titleLabel];
}
- (void)layoutSubviews {
    [super layoutSubviews];
    //主Title
    self.quoteLabel.frame = CGRectMake(16, (44-16)/2, 4, 16);
    self.titleLabel.frame = CGRectMake(16+4+10, 0, self.bounds.size.width-(16+4+10+16), 44);
    //子Title
    CGRect subFrame = CGRectMake(0, 44, self.bounds.size.width, 44);
    self.spfView.frame = subFrame;
    self.rqspfView.frame = subFrame;
    self.rsfView.frame = subFrame;
    self.sxpView.frame = subFrame;
    self.timeView.frame = subFrame;
    self.goalView.frame = subFrame;
    self.tableView.frame = subFrame;
    self.zjView.frame = subFrame;
}

#pragma mark - 📌 GETTER
- (UILabel *)quoteLabel {
    if (!_quoteLabel) {
        _quoteLabel = [[UILabel alloc] init];
        _quoteLabel.backgroundColor = UIColorFromRGB(0xFF2500);
    }
    return _quoteLabel;
}
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        _titleLabel.textColor = UIColorFromRGB(0x333333);
    }
    return _titleLabel;
}
- (UIView *)spfView {
    if (!_spfView) {
        _spfView = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil][0];
    }
    return _spfView;
}
- (UIView *)rqspfView {
    if (!_rqspfView) {
        _rqspfView = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil][1];
    }
    return _rqspfView;
}
- (UIView *)rsfView {
    if (!_rsfView) {
        _rsfView = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil][2];
    }
    return _rsfView;
}
- (UIView *)sxpView {
    if (!_sxpView) {
        _sxpView = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil][3];
    }
    return _sxpView;
}
- (UIView *)timeView {
    if (!_timeView) {
        _timeView = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil][4];
    }
    return _timeView;
}
- (UIView *)goalView {
    if (!_goalView) {
        _goalView = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil][5];
    }
    return _goalView;
}
- (UIView *)tableView {
    if (!_tableView) {
        _tableView = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil][6];
    }
    return _tableView;
}
- (UIView *)zjView {
    if (!_zjView) {
        _zjView = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil][7];
    }
    return _zjView;
}

#pragma mark - 📌 SETTER
- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = NonNil(title);
}
- (void)setSubViewType:(JNMatchHeaderSubViewType)subViewType {
    _subViewType = subViewType;
    
    [self.spfView removeFromSuperview];
    [self.rqspfView removeFromSuperview];
    [self.rsfView removeFromSuperview];
    [self.sxpView removeFromSuperview];
    [self.timeView removeFromSuperview];
    [self.goalView removeFromSuperview];
    [self.tableView removeFromSuperview];
    [self.zjView removeFromSuperview];
    
    if (subViewType == JNMatchHeaderSubViewTypeSPF) {
        [self addSubview:self.spfView];
    }
    if (subViewType == JNMatchHeaderSubViewTypeRQSPF) {
        [self addSubview:self.rqspfView];
    }
    if (subViewType == JNMatchHeaderSubViewTypeRSF) {
        [self addSubview:self.rsfView];
    }
    if (subViewType == JNMatchHeaderSubViewTypeSXP) {
        [self addSubview:self.sxpView];
    }
    if (subViewType == JNMatchHeaderSubViewTypeTime) {
        [self addSubview:self.timeView];
    }
    if (subViewType == JNMatchHeaderSubViewTypeGoal) {
        [self addSubview:self.goalView];
    }
    if (subViewType == JNMatchHeaderSubViewTypeTable) {
        [self addSubview:self.tableView];
    }
    if (subViewType == JNMatchHeaderSubViewTypeZJ) {
        [self addSubview:self.zjView];
    }
    [self setNeedsLayout];
}
@end
