//
//  JCChargeAreaCell.m
//  Jingcai
//
//  Created by Administrator on 2019/1/14.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCChargeAreaCell.h"
#import "JCChargeItemCell.h"

@interface JCChargeAreaCell () <UICollectionViewDelegate, UICollectionViewDataSource, JCChargeItemCellDelegate>
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout * layout;
@property (weak, nonatomic) IBOutlet UICollectionView * collectionView;
@end

@implementation JCChargeAreaCell
- (void)awakeFromNib {
    [super awakeFromNib];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerNib:[UINib nibWithNibName:@"JCChargeItemCell" bundle:nil] forCellWithReuseIdentifier:@"JCChargeItemCell"];
    self.layout.minimumInteritemSpacing = 0.f;
    self.layout.minimumLineSpacing = 0.f;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat selfW = self.bounds.size.width;
    CGFloat selfH = self.bounds.size.height;
    self.layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    self.layout.itemSize = CGSizeMake((selfW-16-5)/3-1, (selfH-8-5)/2);
}

#pragma mark - UICollectionViewDelegate, UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 6;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    JCChargeItemCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"JCChargeItemCell" forIndexPath:indexPath];
    JCCaiyunBall * caiyunBall = self.chargeItemArray[indexPath.row];
    cell.caiyunBall = caiyunBall;
    cell.delegate = self;
    return cell;
}

#pragma mark - JCChargeItemCellDelegate
- (void)chargeItemClick:(UICollectionViewCell *)cell {
    for (JCCaiyunBall * itemBall in self.chargeItemArray) {
        itemBall.state_issel = NO;
    }
    NSIndexPath * indexPath = [self.collectionView indexPathForCell:cell];
    JCCaiyunBall * caiyunBall = self.chargeItemArray[indexPath.row];
    caiyunBall.state_issel = YES;
    [self.collectionView reloadData];
}

#pragma mark - Setter、getter
- (void)setChargeItemArray:(NSArray<JCCaiyunBall *> *)chargeItemArray {
    _chargeItemArray = chargeItemArray;
    [self.collectionView reloadData];
}
- (JCCaiyunBall *)selItemBall {
    JCCaiyunBall * selBall = nil;
    for (JCCaiyunBall * itemBall in self.chargeItemArray) {
        if (itemBall.state_issel) {
            selBall = itemBall;
            break;
        }
    }
    return selBall;
}
@end
