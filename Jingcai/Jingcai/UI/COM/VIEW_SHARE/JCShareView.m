//
//  JCShareView.m
//  Jingcai
//
//  Created by Administrator on 2019/2/1.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCShareView.h"
#import <UMShare/UMShare.h>
#import "JCShareItemCell.h"
#import "JCWToastTool.h"

@interface JCShareView () <UICollectionViewDelegate, UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UIView             * backView;
@property (weak, nonatomic) IBOutlet UIView             * alertView;
@property (weak, nonatomic) IBOutlet UIView             * alertBackView;
@property (weak, nonatomic) IBOutlet UIButton           * cancelButton;
@property (weak, nonatomic) IBOutlet UICollectionView   * collectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout * flowLayout;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;

@property (strong, nonatomic) NSMutableArray * shareArray;
@end

@implementation JCShareView
- (void)awakeFromNib {
    [super awakeFromNib];
    [self.collectionView registerNib:[UINib nibWithNibName:@"JCShareItemCell" bundle:nil] forCellWithReuseIdentifier:@"JCShareItemCell"];
    UITapGestureRecognizer * backTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backViewTap)];
    [self.backView addGestureRecognizer:backTap];
    
    [self.cancelButton setTitleColor:COLOR_2F2F2F forState:0];
    self.cancelButton.backgroundColor = JCWhiteColor;//COLOR_F4F4F8
    self.alertBackView.backgroundColor = JCWhiteColor;
    self.alertView.backgroundColor = COLOR_F4F4F8;
    self.titleLab.font = [UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(16)];
    
    self.cancelButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(16)];
    self.titleLab.textColor = COLOR_333333;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat collectionW = self.collectionView.bounds.size.width;
    CGFloat collectionH = self.collectionView.bounds.size.height;
    self.flowLayout.itemSize = CGSizeMake((collectionW-40)/self.shareArray.count, collectionH);
    self.flowLayout.sectionInset = UIEdgeInsetsMake(0, 20, 0, 20);
}
- (void)backViewTap {
    [self hide];
}

- (void)show {
    UIWindow * window = [UIApplication sharedApplication].delegate.window;
    for (UIView *view in window.subviews) {
        if ([view isKindOfClass:[self class]]) {
            return ;
        }
    }
    self.frame = [UIScreen mainScreen].bounds;
    [self layoutIfNeeded];
    [window addSubview:self];
    
    WeakSelf;
    self.alertView.transform = CGAffineTransformMakeTranslation(0, self.alertView.bounds.size.height);
    self.alertBackView.transform = CGAffineTransformMakeTranslation(0, self.alertBackView.bounds.size.height);
    self.backView.alpha = 0;
    [UIView animateWithDuration:0.3f animations:^{
        weakSelf.alertView.transform = CGAffineTransformIdentity;
        weakSelf.alertBackView.transform = CGAffineTransformIdentity;
        weakSelf.backView.alpha = 1;
    }];
}
- (void)hide {
    WeakSelf;
    weakSelf.alertView.transform = CGAffineTransformIdentity;
    weakSelf.alertBackView.transform = CGAffineTransformIdentity;
    weakSelf.backView.alpha = 1;
    [UIView animateWithDuration:0.3f animations:^{
        self.alertView.transform = CGAffineTransformMakeTranslation(0, self.alertView.bounds.size.height);
        self.alertBackView.transform = CGAffineTransformMakeTranslation(0, self.alertBackView.bounds.size.height);
        self.backView.alpha = 0;
    } completion:^(BOOL finished) {
        [weakSelf removeFromSuperview];
    }];
}
- (IBAction)cancelBtnClick:(UIButton *)sender {
    [self hide];
}

#pragma mark - UICollectionViewDelegate, UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.shareArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    JCShareItemCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"JCShareItemCell" forIndexPath:indexPath];
    cell.shareType = [self.shareArray[indexPath.row] integerValue];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.webPageUrl.length == 0) {
        [JCWToastTool showHint:@"分享链接格式错误!"];
        [self hide];
        return ;
    }
    NSString *title = self.title;
    JCShareItemCell * cell = (JCShareItemCell *)[collectionView cellForItemAtIndexPath:indexPath];
    UMSocialPlatformType platformType = UMSocialPlatformType_UnKnown;
    if (cell.shareType == JCShareTypeEnumWeChatTimeLine) {
        platformType = UMSocialPlatformType_WechatTimeLine;
        if (self.content.length>0) {
            title =  [NSString stringWithFormat:@"[%@]%@",self.title,self.content];
        }

    }
    if (cell.shareType == JCShareTypeEnumWeChatSession) {

        platformType = UMSocialPlatformType_WechatSession;
    }
    if (cell.shareType == JCShareTypeEnumCopy) {
        UIPasteboard * pasteBoard = [UIPasteboard generalPasteboard];
        pasteBoard.string = self.webPageUrl;
        [JCWToastTool showHint:@"已复制"];
        if (self.allow_AllPlaformAnalyse==YES) {
            if (cell.shareType == JCShareTypeEnumCopy) {
                if (self.JCAllShareBlock) {
                    self.JCAllShareBlock(3);
                }
            }

        }

        return ;
    }
    
    if (![[UMSocialManager defaultManager] isInstall:platformType]) {
        [JCWToastTool showHint:@"未安装相应的客户端"];
        return ;
    }
    
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    //创建网页内容对象
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:title descr:self.desc thumImage:self.image];
    if (self.imageUrl) {
        shareObject = [UMShareWebpageObject shareObjectWithTitle:title descr:self.desc thumImage:self.imageUrl];
    }
    //设置网页地址
    shareObject.webpageUrl = self.webPageUrl;
    if (platformType == UMSocialPlatformType_WechatTimeLine) {
        shareObject.webpageUrl = self.friend_url;

    }
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    

    
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:nil completion:^(id data, NSError *error) {
        if (error) {
            NSLog(@"************Share fail with error %@*********",error);
        } else {
            NSLog(@"response data is %@",data);
    
            
        }
    }];
    


    if (cell.shareType != JCShareTypeEnumCopy) {
        if (self.JCShareBlock) {
            self.JCShareBlock();
        }
    }
    if (self.allow_AllPlaformAnalyse==YES) {
        if (cell.shareType == JCShareTypeEnumWeChatSession) {
            if (self.JCAllShareBlock) {
                self.JCAllShareBlock(1);
            }
        }
        if (cell.shareType == JCShareTypeEnumWeChatTimeLine) {
            if (self.JCAllShareBlock) {
                self.JCAllShareBlock(2);
            }
        }


    }
    if (cell.shareType == JCShareTypeEnumWeChatTimeLine||cell.shareType == JCShareTypeEnumWeChatSession) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"shareActivityToRefresh" object:nil];
    }
    
}

#pragma mark - Getter
- (NSArray *)shareArray {
    _shareArray = [NSMutableArray array];
    //微信好友
    if ([[UMSocialManager defaultManager] isInstall:UMSocialPlatformType_WechatSession]) {
        [_shareArray addObject:[NSNumber numberWithInteger:JCShareTypeEnumWeChatSession]];
    }
    //朋友圈
    if ([[UMSocialManager defaultManager] isInstall:UMSocialPlatformType_WechatTimeLine]) {
        [_shareArray addObject:[NSNumber numberWithInteger:JCShareTypeEnumWeChatTimeLine]];
    }

    //复制链接
    [_shareArray addObject:[NSNumber numberWithInteger:JCShareTypeEnumCopy]];
    return _shareArray;
}

- (void)setTitleString:(NSString *)titleString {
    _titleString = titleString;
    self.titleLab.text = @"";
}
@end
