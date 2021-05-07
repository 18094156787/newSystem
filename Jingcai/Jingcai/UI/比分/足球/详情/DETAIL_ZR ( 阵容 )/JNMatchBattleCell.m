//
//  JNMatchBattleCell.m
//  Jingcai
//
//  Created by Administrator on 2019/7/5.
//  Copyright © 2019 jingcai. All rights reserved.
//

#import "JNMatchBattleCell.h"
#import "JNMatchBattleItemCell.h"
#import "UIImageView+WebCache.h"

@interface JNMatchBattleCell ()
@property (weak, nonatomic) IBOutlet UIImageView * homeLogoImageView;
@property (weak, nonatomic) IBOutlet UIImageView * awayLogoImageView;
@property (weak, nonatomic) IBOutlet UILabel * homeNameLabel;
@property (weak, nonatomic) IBOutlet UILabel * awayNameLabel;
@property (weak, nonatomic) IBOutlet UITableView * homeTableView;
@property (weak, nonatomic) IBOutlet UITableView * awayTableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *homeHConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *awayHConstraint;
@end

@implementation JNMatchBattleCell
- (void)awakeFromNib {
    [super awakeFromNib];
//    self.homeNameLabel.backgroundColor =  COLOR_F0F0F0;
//    self.awayTableView.backgroundColor =  COLOR_F0F0F0;
    [self.homeTableView registerNib:[UINib nibWithNibName:@"JNMatchBattleItemCell" bundle:nil] forCellReuseIdentifier:@"JNMatchBattleItemCell"];
    [self.awayTableView registerNib:[UINib nibWithNibName:@"JNMatchBattleItemCell" bundle:nil] forCellReuseIdentifier:@"JNMatchBattleItemCell"];
}
- (void)setHomeArr:(NSArray *)homeArr {
    _homeArr = homeArr;
    [self.homeTableView reloadData];
    self.homeHConstraint.constant = self.homeTableView.rowHeight * homeArr.count;
}
- (void)setAwayArr:(NSArray *)awayArr {
    _awayArr = awayArr;
    [self.awayTableView reloadData];
    self.awayHConstraint.constant = self.awayTableView.rowHeight * awayArr.count;
}
- (void)setMatchBall:(JCWMatchBall *)matchBall {
    _matchBall = matchBall;
    [self.homeLogoImageView sd_setImageWithURL:[NSURL URLWithString:matchBall.homeLogo]];
    [self.awayLogoImageView sd_setImageWithURL:[NSURL URLWithString:matchBall.awayLogo]];
    self.homeNameLabel.text = NonNil(matchBall.homeName);
    self.awayNameLabel.text = NonNil(matchBall.awayName);
}

#pragma mark - 📌 UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return tableView == self.homeTableView ? self.homeArr.count : self.awayArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JNMatchBattleItemCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JNMatchBattleItemCell"];
    cell.lineupBall = tableView == self.homeTableView ? self.homeArr[indexPath.item] : self.awayArr[indexPath.item];
    cell.isHomeTeam = tableView == self.homeTableView;
    return cell;
}
@end
