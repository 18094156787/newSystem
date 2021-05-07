//
//  JCMatchFanganViewController.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/25.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewController.h"
#import "JCWMatchBall.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCMatchFanganViewController : JCBaseTableViewController

@property (nonatomic,strong) JCWMatchBall *matchBall;

@property (nonatomic,strong) NSString *matchNum;

@property (strong, nonatomic) NSArray * faDataArr;
- (void)loadFanganDataWithMatchNum:(NSString *)matchNum;

@end

NS_ASSUME_NONNULL_END
