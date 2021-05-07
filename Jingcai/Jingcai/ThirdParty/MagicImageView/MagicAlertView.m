//
//  MagicAlertView.m
//  Jingcai
//
//  Created by Rain on 2018/12/17.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "MagicAlertView.h"
#import "MagicAlertCell.h"

#define MagicMenuItemHeight 54.f

@interface MagicAlertView () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIView * maskView;
@property (weak, nonatomic) IBOutlet UIView * bgView;
@property (weak, nonatomic) IBOutlet UITableView * tableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint * tableHeightConstraint;
@property (strong, nonatomic) NSArray * titleArr;
@end

@implementation MagicAlertView
- (void)awakeFromNib {
    [super awakeFromNib];
    self.titleArr = @[@"保存至相册",@"取消"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"MagicAlertCell" bundle:nil] forCellReuseIdentifier:@"MagicAlertCell"];
    //点击空白消失
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)];
    [self.maskView addGestureRecognizer:tap];
}
- (void)layoutSubviews {
    [super layoutSubviews];
    //更新列表高度
    self.tableHeightConstraint.constant = MagicMenuItemHeight * self.titleArr.count;
}

#pragma mark -
- (void)show {
    UIWindow * window = [UIApplication sharedApplication].delegate.window;
    for (UIView * view in window.subviews) {
        if ([view isKindOfClass:[self class]]) {
            return ;
        }
    }
    
    self.frame = [UIScreen mainScreen].bounds;
    [window addSubview:self];
    //初始位置
    self.tableView.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 0);
    self.bgView.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 0);
    self.maskView.alpha = 0;
    
    WeakSelf;
    [UIView animateWithDuration:0.2f animations:^{
        CGFloat tableH = MagicMenuItemHeight * self.titleArr.count;
        weakSelf.tableView.frame = CGRectMake(0, SCREEN_HEIGHT-tableH, SCREEN_WIDTH, tableH);
        weakSelf.bgView.frame = CGRectMake(0, SCREEN_HEIGHT-tableH, SCREEN_WIDTH, tableH);
        weakSelf.maskView.alpha = 0.5f;
    }];
}
- (void)hide {
    [UIView animateWithDuration:0.2f animations:^{
        CGRect frame = self.tableView.frame;
        frame.origin.y = SCREEN_HEIGHT;
        self.tableView.frame = frame;
        self.bgView.frame = frame;
        self.maskView.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
- (void)updateAlertMenu {
    //添加二维码识别菜单
    NSString * title = @"识别图中二维码";
    if (![self.titleArr containsObject:title]) {
        self.titleArr = @[@"保存至相册",title,@"取消"];
        [self.tableView reloadData];
        [self setNeedsLayout];
    }
}

#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArr.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return MagicMenuItemHeight;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MagicAlertCell * cell = [tableView dequeueReusableCellWithIdentifier:@"MagicAlertCell"];
    cell.title = self.titleArr[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self hide];
    if (indexPath.row == 0) {
        if (self.saveClickClickBlock) {
            self.saveClickClickBlock();
        }
        return ;
    }
}
@end
