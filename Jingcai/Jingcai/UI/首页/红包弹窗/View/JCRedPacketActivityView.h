//
//  JCRedPacketActivityVIEW.h
//  Jingcai
//
//  Created by 陈继伟 on 2019/9/26.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCActivityRedPacketListView.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCRedPacketActivityView : JCBaseView

@property (nonatomic,strong) UIImageView *bgImgView;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UIButton *saveBtn;

@property (nonatomic,strong) NSString *hbTitle;

@property (nonatomic,strong) JCActivityRedPacketListView *packetView;

@end

NS_ASSUME_NONNULL_END
