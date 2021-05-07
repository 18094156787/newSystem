//
//  JCCommentCell.m
//  Jingcai
//
//  Created by Administrator on 2019/2/19.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCCommentCell.h"
#import "UIImageView+WebCache.h"
#import "JCWConvertTool.h"
#import "JCCommentMatchCell.h"
#import "JCDianPingMatchBall.h"
#import "JCTagView.h"

@interface JCCommentCell () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIImageView * avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel * nameLabel;
//@property (weak, nonatomic) IBOutlet UIView * tagPosView;
@property (weak, nonatomic) IBOutlet UILabel * descLabel;
@property (weak, nonatomic) IBOutlet UILabel * percentLabel;
@property (weak, nonatomic) IBOutlet UILabel * titleLabel;
@property (weak, nonatomic) IBOutlet UILabel * timeLabel;
@property (weak, nonatomic) IBOutlet UIView * percentView;
@property (weak, nonatomic) IBOutlet UITableView * matchTableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint * matchHConstraint;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tagPosHConstraint;
@property (weak, nonatomic) IBOutlet UIView *tagPosView;
//@property (weak, nonatomic) IBOutlet UIView *tagPosTopView;
//@property (weak, nonatomic) IBOutlet UIView *tagPosBottomView;
@property (weak, nonatomic) IBOutlet UIImageView *resultImageView;
@property (weak, nonatomic) IBOutlet UIView *userAreaView;
@property (strong, nonatomic) UILabel *resultLab;
@property (strong, nonatomic) JCTagView * tagView;
@property (strong, nonatomic) UIButton *shareBtn;
@property (strong, nonatomic) UIButton *likeBtn;
@property (strong, nonatomic) UIImageView *shareImgView;
@property (strong, nonatomic) UIImageView *likeImgView;
@property (strong, nonatomic) UILabel *shareLab;
@property (strong, nonatomic) UILabel *likeLab;
@property (nonatomic,strong) UIImageView *tagImgView;
@end

@implementation JCCommentCell
- (void)awakeFromNib {
    [super awakeFromNib];
    [self.matchTableView registerNib:[UINib nibWithNibName:@"JCCommentMatchCell" bundle:nil] forCellReuseIdentifier:@"JCCommentMatchCell"];
    self.tagPosView.backgroundColor = JCClearColor;
//    [self.tagPosView addSubview:self.tagView];
    [self initViews];
//     self.matchTableView.backgroundColor = JCClearColor;
//     self.backgroundColor = JCClearColor;
//    [self.tagPosBottomView addSubview:self.tagBottomView];
    
}

- (void)initViews {
    [self.contentView addSubview:self.tagImgView];
    [self.tagImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_right).offset(AUTO(5));
        make.centerY.equalTo(self.nameLabel);
        make.height.mas_equalTo(AUTO(18));
        make.width.mas_equalTo(AUTO(72));
        
    }];
    
    
    [self.contentView addSubview:self.shareBtn];
    [self.shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-5));
        make.centerY.equalTo(self.timeLabel);
        make.size.mas_equalTo(CGSizeMake(AUTO(60), AUTO(25)));
    }];
    
    [self.shareBtn addSubview:self.shareImgView];
    [self.shareImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.centerY.equalTo(self.shareBtn);
        make.size.mas_equalTo(CGSizeMake(AUTO(16), AUTO(16)));
    }];
    
    [self.shareBtn addSubview:self.shareLab];
    [self.shareLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.shareImgView.mas_right).offset(AUTO(5));
        make.centerY.equalTo(self.shareBtn);
        make.right.offset(0);
    }];
    
    [self.contentView addSubview:self.likeBtn];
    [self.likeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.shareBtn.mas_left).offset(AUTO(-20));
        make.centerY.equalTo(self.timeLabel);
        make.size.mas_equalTo(CGSizeMake(AUTO(60), AUTO(25)));
    }];
    
    [self.likeBtn addSubview:self.likeImgView];
    [self.likeImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.centerY.equalTo(self.likeBtn);
        make.size.mas_equalTo(CGSizeMake(AUTO(16), AUTO(16)));
    }];
    
    [self.likeBtn addSubview:self.likeLab];
    [self.likeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.likeImgView.mas_right).offset(AUTO(5));
        make.right.offset(0);
        make.centerY.equalTo(self.likeBtn);
    }];
    
    WeakSelf;
    [self.likeBtn bk_whenTapped:^{
        if (weakSelf.JCLikeBlock) {
            weakSelf.JCLikeBlock();
        }
    }];
    
    [self.shareBtn bk_whenTapped:^{
        if (weakSelf.JCShareBlock) {
            weakSelf.JCShareBlock();
        }
    }];
//
//    self.shareBtn.backgroundColor= JCBaseColor;
//    self.likeBtn.backgroundColor= JCBaseColor;
}

- (void)setUserClickBlock:(JCDianPingUserClickBlock)userClickBlock {
    _userClickBlock = userClickBlock;
    //添加点击事件
    UITapGestureRecognizer * userAreaTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userAreaViewTap)];
    [self.userAreaView addGestureRecognizer:userAreaTap];
//    UITapGestureRecognizer * nameTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userViewTap)];
//    [self.nameLabel addGestureRecognizer:nameTap];
//    UITapGestureRecognizer * descTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userViewTap)];
//    [self.descLabel addGestureRecognizer:descTap];
}
- (void)userAreaViewTap {
    if (self.userClickBlock) {
        self.userClickBlock(self.dianPingBall.user_id);
    }
}
- (void)layoutSubviews {
    [super layoutSubviews];
//    self.tagView.frame = self.tagPosView.bounds;
//    self.tagBottomView.frame = self.tagPosBottomView.bounds;
}
- (JCTagView *)tagView {
    if (!_tagView) {
        _tagView = [JCTagView viewFromXib];
    }
    return _tagView;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
- (void)setDianPingBall:(JCDianPingBall *)dianPingBall {
    _dianPingBall = dianPingBall;
    UIImage * placeImage = [JCWConvertTool imageWithColor:[UIColor groupTableViewBackgroundColor]];
    [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:dianPingBall.user_img] placeholderImage:placeImage];
    self.nameLabel.text = NonNil(dianPingBall.user_name);
    self.descLabel.text = NonNil(dianPingBall.user_desc);
    self.percentLabel.text = NonNil(dianPingBall.percent);
    self.timeLabel.text = NonNil(dianPingBall.time);
    self.likeLab.text = [dianPingBall.dz_number integerValue]>0?dianPingBall.dz_number:@"点赞";
    self.shareLab.text = [dianPingBall.fx_number integerValue]>0?dianPingBall.fx_number:@"分享";
    //self.priceLabel.text = NonNil(dianPingBall.wl_desc);
    
    NSString *title = [NSString stringWithFormat:@"%@%@",NonNil(dianPingBall.out_info),dianPingBall.title];
    NSMutableAttributedString *attrTitle = [[NSMutableAttributedString alloc] initWithString:title];
    NSRange range = [title rangeOfString:NonNil(dianPingBall.out_info)];
    [attrTitle addAttribute:NSForegroundColorAttributeName value:COLOR_E7221D range:range];
    self.titleLabel.attributedText = attrTitle;
//    self.titleLabel.text = NonNil(dianPingBall.title);
    
    
    //判断是否已购买
    self.priceLabel.text = dianPingBall.isbuy ? @"已购买":NonNil(dianPingBall.wl_desc);
    
    //显示价格还是红黑
    if ([dianPingBall isShowPrice]) {
        self.priceLabel.hidden = NO;
        self.resultImageView.hidden = YES;
        
    } else {
        self.priceLabel.hidden = YES;
        self.resultImageView.hidden = NO;
        self.resultImageView.image = [dianPingBall isShowHong] ? [UIImage imageNamed:@"tuijian_hong"] : [UIImage imageNamed:@"tuijian_hei"];
        if (dianPingBall.isShowZou) {
            self.resultImageView.image = JCIMAGE(@"tuijian_zou");
        }
    }
    //是否显示命中率
    self.percentView.hidden = !dianPingBall.has_percent;
    //赛事表格高度
    self.matchHConstraint.constant = 30 * dianPingBall.match_data.count;
    //标签显示逻辑
//    self.tagTopView.near = dianPingBall.near;
//    NSString * topHong = dianPingBall.has_lianhong ? dianPingBall.lianhong : dianPingBall.history_hong;
//    NSString * bottomHong = dianPingBall.has_lianhong ? dianPingBall.history_hong : @"";
//    self.tagTopView.hong = topHong;
//    self.tagBottomView.hong = bottomHong;
    NSString * near = dianPingBall.has_lianhong ? NonNil(dianPingBall.lianhong) : NonNil(dianPingBall.near);
    NSString * hong = dianPingBall.has_historyhong ? NonNil(dianPingBall.history_hong) : @"";
    self.tagView.near = near;
    self.tagView.hong = hong;
    
    
    self.tagImgView.hidden = dianPingBall.sign.length>0?NO:YES;
    if (dianPingBall.sign.length>0) {
        NSString *imgName = [NSString stringWithFormat:@"icon_lh_%ld",[dianPingBall.sign integerValue]+2];
        if ([dianPingBall.sign integerValue]>0&&[dianPingBall.sign integerValue]<=18) {
           self.tagImgView.image = JCIMAGE(imgName);
            [self.tagImgView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(AUTO(50));
            }];
        }
        if ([dianPingBall.sign integerValue]>18&&[dianPingBall.sign integerValue]<=22) {
           self.tagImgView.image = JCIMAGE(imgName);
            [self.tagImgView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(AUTO(98));
            }];
        }
        if ([dianPingBall.sign integerValue]>22&&[dianPingBall.sign integerValue]<=26) {
           self.tagImgView.image = JCIMAGE(imgName);
            [self.tagImgView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(AUTO(72));
            }];
        }
        self.tagImgView.image = JCIMAGE(imgName);
    }
    
    
    
    
    //不要忘记刷新列表
    [self.matchTableView reloadData];
    [self setNeedsLayout];
    
    //未结束的不能点击赛程
//    self.matchTableView.userInteractionEnabled = [dianPingBall isMatchEnd];
}

#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dianPingBall.match_data.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JCCommentMatchCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCCommentMatchCell"];
    cell.matchDic = self.dianPingBall.match_data[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary * matchDic = self.dianPingBall.match_data[indexPath.row];
    if (self.matchClickBlock) {
        self.matchClickBlock(matchDic[@"match_num"]);
    }
}

- (UIButton *)shareBtn {
    if (!_shareBtn) {
        _shareBtn = [UIButton initWithText:@"" FontSize:AUTO(12) Weight:1 BackGroundColor:JCClearColor TextColors:COLOR_999999];
    }
    return _shareBtn;
}

- (UIButton *)likeBtn {
    if (!_likeBtn) {
        _likeBtn = [UIButton initWithText:@"" FontSize:AUTO(12) Weight:1 BackGroundColor:JCClearColor TextColors:COLOR_999999];
    }
    return _likeBtn;
}

- (UIImageView *)shareImgView {
    if (!_shareImgView) {
        _shareImgView = [UIImageView new];
        _shareImgView.image = JCIMAGE(@"icon_fx_s");
    }
    return _shareImgView;
}

- (UILabel *)shareLab {
    if (!_shareLab) {
        _shareLab = [UILabel initWithTitle:@"分享" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _shareLab;
}

- (UIImageView *)likeImgView {
    if (!_likeImgView) {
        _likeImgView = [UIImageView new];
        _likeImgView.image = JCIMAGE(@"icon_dz_s_un");
    }
    return _likeImgView;
}

- (UILabel *)likeLab {
    if (!_likeLab) {
        _likeLab = [UILabel initWithTitle:@"点赞" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _likeLab;
}

- (UIImageView *)tagImgView {
    if (!_tagImgView) {
        _tagImgView = [UIImageView new];
    }
    return _tagImgView;
}

- (UILabel *)resultLab {
    if (!_resultLab) {
        _resultLab = [UILabel initWithTitle:@"" andFont:12 andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _resultLab;
}

@end
