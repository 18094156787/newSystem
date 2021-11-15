//
//  JCJingCaiAIBigDataSearchView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/15.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCJingCaiAIBigDataSearchView.h"

@implementation JCJingCaiAIBigDataSearchView

- (void)initViews {
    self.backgroundColor = JCWhiteColor;
    [self setupSearchView];
}

- (void)setupSearchView {
    UIView *titleView = [[UIView alloc] init];
    titleView.frame = CGRectMake(AUTO(15), AUTO(8), SCREEN_WIDTH-AUTO(90), AUTO(32));
    titleView.backgroundColor = JCClearColor;
    [titleView hg_setAllCornerWithCornerRadius:4];
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:titleView.bounds];

    
    searchBar.layer.cornerRadius = AUTO(16);
    searchBar.layer.masksToBounds = YES;
    [searchBar setImage:JCIMAGE(@"icon_ser") forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
    [titleView addSubview:searchBar];
    [self addSubview:titleView];
    searchBar.delegate = self;
 
    searchBar.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    

        if (@available(iOS 13.0, *)) {

            UITextField *searchField = searchBar.searchTextField;
            searchField.backgroundColor = COLOR_F0F0F0;
//            searchField.textColor = COLOR_B2BACD;
            NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"搜索球队、赛事" attributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:13]}];//NSForegroundColorAttributeName:COLOR_B2BACD
            searchField.attributedPlaceholder = string;
              [searchBar setSearchFieldBackgroundImage:JCIMAGE(@"clearImage") forState:0];
//            searchBar.searchTextField.font = [UIFont systemFontOfSize:13];

        }else{
                for (UIView *subView in [[searchBar.subviews lastObject] subviews]) {
                     if([subView isKindOfClass:NSClassFromString(@"UISearchBarSearchFieldBackgroundView")]) {
                         subView.backgroundColor = COLOR_F0F0F0;
                     }
                    float systemVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
            
                    if (systemVersion <13.0) {
                        if([subView isKindOfClass:NSClassFromString(@"UISearchBarBackground")]) {
                            [subView removeFromSuperview];
                        }
                    }
            
            
                     if ([subView isKindOfClass:NSClassFromString(@"UISearchBarTextField")]) {
                         UITextField *textField = (UITextField *)subView;
                         textField.borderStyle = UITextBorderStyleNone;
                         textField.font = [UIFont systemFontOfSize:13];
                         textField.backgroundColor = JCWhiteColor;
                         textField.layer.cornerRadius= 16;
                         textField.layer.masksToBounds = YES;
                         NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"搜索球队、赛事" attributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:13]}];//NSForegroundColorAttributeName:COLOR_B2BACD
                         textField.attributedPlaceholder = string;
            //             textField.backgroundColor = [UIColor whiteColor];
            //             [textField hg_setAllCornerWithCornerRadius:22];
            
                     }
                 }
        }
//    [self.searchBar becomeFirstResponder];
    self.searchBar = searchBar;
}

#pragma mark UISearchBar Delegate
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    [[self getViewController].navigationController pushViewController:[UIViewController new] animated:YES];
    return NO;
}


@end
