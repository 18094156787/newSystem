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
            UIView *bottomView = [UIView new];
            bottomView.layer.borderWidth = 0.5;
            bottomView.layer.borderColor = COLOR_E8E8E8.CGColor;
            bottomView.frame = CGRectMake(AUTO(15)+width*j, height*i, width, height);
            [self.contentView addSubview:bottomView];
                
                UILabel *titleLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
//                titleLab.layer.borderWidth = 0.5;
//                titleLab.layer.borderColor = COLOR_E8E8E8.CGColor;
//                titleLab.numberOfLines = 2;
                titleLab.frame = CGRectMake(AUTO(15)+width*j, AUTO(4)+height*i, width, AUTO(20));
                [self.contentView addSubview:titleLab];
                UILabel *bottomLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
//                bottomLab.layer.borderWidth = 0.5;
//                bottomLab.layer.borderColor = COLOR_E8E8E8.CGColor;
                bottomLab.frame = CGRectMake(AUTO(15)+width*j, AUTO(24)+height*i, width, AUTO(16));
                [self.contentView addSubview:bottomLab];
            if (self.dataArray.count>num) {
                NSArray *array = self.dataArray[num];
                    if (array.count==2) {
                        NSString *value1 = array.firstObject;
                        NSString *value2 = array.lastObject;
                        titleLab.text = value1;
                        bottomLab.text = value2;
//                        titleLab.text = [NSString stringWithFormat:@"%@\n%@",value1,value2];
                    }else if(array.count==1){
                        NSString *value1 = array.firstObject;
                        titleLab.text = value1;
                        bottomLab.text = @"";
                    }else {
                        titleLab.text = @"";
                        bottomLab.text = @"";
                    }
            }else{
                titleLab.text = @"";
                bottomLab.text = @"";
            }


                NSLog(@"%ld",num);
//            }

        }
    }
}

@end
