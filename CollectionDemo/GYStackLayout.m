//
//  GYStackLayout.m
//  CollectionDemo
//
//  Created by 李梦珠 on 15/10/29.
//  Copyright (c) 2015年 guangyu2144. All rights reserved.
//
#define kCalcAngle(x) x*M_PI/180
#import "GYStackLayout.h"

@implementation GYStackLayout
-(NSArray*)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSInteger cellCount = [self.collectionView numberOfItemsInSection:0];
    NSMutableArray* array = [NSMutableArray array];
    
    for (int i = 0; i<cellCount; i++)
    {
        UICollectionViewLayoutAttributes* attrs = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        [array addObject:attrs];
    }
    return array;
}
//返回对应于indexPath的位置的cell的布局属性
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes* attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];

    attrs.size = CGSizeMake(150, 150);
    attrs.center = CGPointMake(self.collectionView.frame.size.width*0.5, self.collectionView.frame.size.height*0.5);
    
    //    第几个item
    NSInteger index = indexPath.item;
 
    CGFloat angle[]= {0,15,30,45,60};
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    if (index>=5)
    {
        attrs.hidden = YES;
    }else
    {
        attrs.transform = CGAffineTransformMakeRotation(kCalcAngle(angle[index]));
        attrs.zIndex = count-index;
    }
    return attrs;
    
}
@end
