//
//  JCPostImageModel.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/24.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCPostImageModel.h"

@implementation JCPostImageModel

- (CGSize)getImgSize {
    if (self.size.width>0) {
        return self.size;
    }
    self.size = CGSizeMake(AUTO(110), AUTO(110));
    if (self.width>0&&self.height>0) {

        if (self.width<=AUTO(85)&&self.height<=AUTO(110)) {
            self.size = CGSizeMake(self.width, self.height);
        }
            //高大于宽
        if (self.height>self.width) {
            float heightRate = AUTO(110)/self.height;
            self.size = CGSizeMake(self.width*heightRate, AUTO(110));
        }
        if (self.width>self.height) {
//            float widthRate = AUTO(85)/self.width;
//            self.size = CGSizeMake(AUTO(85), self.height*widthRate);
             float heightRate = AUTO(110)/self.height;
            float width = self.width*heightRate;
            if (width>SCREEN_WIDTH-AUTO(30)) {
                width = SCREEN_WIDTH-AUTO(30);
            }
            self.size = CGSizeMake(width, AUTO(110));
        }
        
    }
    return self.size;
}


@end
