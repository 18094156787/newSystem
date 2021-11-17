//
//  JCPoissonDataModelDetailPredictCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/11.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCPoissonDataModelDetailPredictCell.h"

@implementation JCPoissonDataModelDetailPredictCell

- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    [self.contentView removeAllSubviews];
    NSMutableArray *array = [NSMutableArray array];
    float width = (SCREEN_WIDTH-AUTO(30))/6.0f;
    float height = AUTO(48);
    int row = ceil(self.dataArray.count/6.0);
    for (int i=0; i<row; i++) {
        for (int j=0; j<6; j++) {
            
            NSInteger num = j+6*i;
//            if (self.dataArray.count>num) {
                
                UILabel *titleLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
                titleLab.layer.borderWidth = 0.5;
                titleLab.layer.borderColor = COLOR_E8E8E8.CGColor;
                titleLab.numberOfLines = 2;
                titleLab.frame = CGRectMake(AUTO(15)+width*j, height*i, width, height);
                [self.contentView addSubview:titleLab];
            if (self.dataArray.count>num) {
                NSArray *array = self.dataArray[num];
                    if (array.count==2) {
                        NSString *value1 = array.firstObject;
                        NSString *value2 = array.lastObject;
                        titleLab.text = [NSString stringWithFormat:@"%@\n%@",value1,value2];
                    }else if(array.count==1){
                        NSString *value1 = array.firstObject;
                        titleLab.text = value1;
                    }else {
                        titleLab.text = @"";
                    }
            }else{
                titleLab.text = @"";
            }


                NSLog(@"%ld",num);
//            }

        }
    }
}

@end
