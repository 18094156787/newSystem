//
//  JCAboutVC.m
//  Jingcai
//
//  Created by Rain on 2018/10/18.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCAboutVC.h"
#import "JCWInterfaceTool.h"

@interface JCAboutVC ()
@property (weak, nonatomic) IBOutlet UILabel *versionLabel;
@property (weak, nonatomic) IBOutlet UILabel *webLab;

@end

@implementation JCAboutVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
    [self setNavBackImg];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"关于我们";
    self.view.backgroundColor = JCWhiteColor;
    self.versionLabel.text = [NSString stringWithFormat:@"版本%@",[JCWInterfaceTool appVersion]];
    self.webLab.textColor = COLOR_2F2F2F;
//    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:@"官网网站：www.jingcai.com"];
//    NSRange range = [@"官网网站：www.jingcai.com" rangeOfString:@"www.jingcai.com"];
//    [attr addAttributes:@{NSForegroundColorAttributeName:COLOR_057AFF} range:range];
//    self.webLab.attributedText = attr;
    self.webLab.text = @"官网网站：www.jingcai.com";
    
}

@end
