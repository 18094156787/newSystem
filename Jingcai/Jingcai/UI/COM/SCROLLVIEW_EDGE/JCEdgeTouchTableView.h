//
//  JCEdgeTouchTableView.h
//  Jingcai
//
//  Created by Administrator on 2019/2/22.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^JCEdgeTouchTableViewEdgeDownBlock)(void);
typedef void(^JCEdgeTouchTableViewAnyUpBlock)(void);

NS_ASSUME_NONNULL_BEGIN
@interface JCEdgeTouchTableView : UITableView
@property (nonatomic, strong) JCEdgeTouchTableViewEdgeDownBlock edgeDownBlock;
@property (nonatomic, strong) JCEdgeTouchTableViewAnyUpBlock anyUpBlock;
@end
NS_ASSUME_NONNULL_END
