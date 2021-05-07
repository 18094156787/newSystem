//
//  JCHongbangDetail_MatchModel.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/2/2.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCHongbangDetail_MatchModel.h"

@implementation JCHongbangDetail_MatchModel

- (BOOL)isResultWin {
    return self.wl == 1 ||self.wl == 3;
}
- (BOOL)isResultLose {
    return self.wl == 2 || self.wl == 4;
}
- (BOOL)isResultWater {
    return self.wl == 5;
}
- (BOOL)isYanqi {
    return self.wl == 6;
}
- (BOOL)isQuXiao {
    return self.wl == 7;
}

@end
