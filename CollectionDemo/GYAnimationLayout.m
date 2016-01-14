//
//  GYAnimationLayout.m
//  CollectionDemo
//
//  Created by 李梦珠 on 15/10/29.
//  Copyright (c) 2015年 guangyu2144. All rights reserved.
//

#import "GYAnimationLayout.h"

@implementation GYAnimationLayout
-(CGSize)collectionViewContentSize
{
    NSInteger cellCount = [self.collectionView numberOfItemsInSection:0];

        return CGSizeMake(CGRectGetWidth(self.collectionView.frame), cellCount*80);

}
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
    //    第几个item
    NSInteger index = indexPath.item;

    NSLog(@"------index:%d",index);
    attrs.frame = CGRectMake(10, 50*index, self.collectionView.frame.size.width-20, 100);
    
   
    return attrs;
    
}
@end
