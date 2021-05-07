//
//  JCMatchQBViewController.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/8.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewController.h"
#import "JNMatchQingbaoBall.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCMatchQBViewController : JCBaseTableViewController
@property (strong, nonatomic) NSArray *goodInfoArray;

@property (strong, nonatomic) NSArray *badInfoArray;

@property (strong, nonatomic) NSArray *natureInfoArray;
@end

NS_ASSUME_NONNULL_END
