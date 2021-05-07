//
//  JCYCRuleViewController.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/13.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCYCRuleViewController.h"
#import "JCYCRuleContentCell.h"
#import "JCYCRuleTitleView.h"
#import "JCJingCaiRuleModel.h"
#import "JCDakaBuyPayWayTopView.h"
@interface JCYCRuleViewController ()



@end

@implementation JCYCRuleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = JCWhiteColor;
    [self initViews];
}



- (void)initViews {
    UIView *colorView = [UIView new];
    colorView.backgroundColor = COLOR_F0F0F0;
    colorView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(8));
    self.tableView.tableHeaderView = colorView;
    
    [self.view hg_setAllCornerWithCornerRadius:AUTO(5)];
//    self.tableView.backgroundColor = COLOR_F0F0F0;
    self.tableView.separatorStyle = 0;
    self.tableView.estimatedRowHeight = 100;
    [self.tableView registerClass:[JCYCRuleContentCell class] forCellReuseIdentifier:@"JCYCRuleContentCell"];


}

#pragma mark <UITableViewDelegate>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    JCJingCaiRuleModel *model = self.dataArray[indexPath.section];
//    return model.contentHeight;
    return UITableViewAutomaticDimension;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {


    JCYCRuleContentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCYCRuleContentCell"];
    JCJingCaiRuleModel *model = self.dataArray[indexPath.section];
    cell.model = model;
    WeakSelf;
    cell.JCRefreshBlock = ^{
        
        [weakSelf.tableView reloadRow:indexPath.row inSection:indexPath.section withRowAnimation:0];
    };
    return cell;

}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {

    JCJingCaiRuleModel *model = self.dataArray[section];
    JCDakaBuyPayWayTopView *headView = [JCDakaBuyPayWayTopView new];
    headView.lineView.hidden = YES;
    headView.titleLab.text = model.title;
    return headView;;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return AUTO(50);;
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.0001;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *backView= [UIView new];
    return backView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // 判断webView所在的cell是否可见，如果可见就layout
    NSArray *cells = self.tableView.visibleCells;
    for (UITableViewCell *cell in cells) {
        if ([cell isKindOfClass:[JCYCRuleContentCell class]]) {
            JCYCRuleContentCell *webCell = (JCYCRuleContentCell *)cell;
            
            [webCell.webView setNeedsLayout];
        }
    }
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
