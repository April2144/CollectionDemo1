//
//  GYCollectionViewLayout.m
//  CollectionDemo
//
//  Created by 李梦珠 on 15/10/29.
//  Copyright (c) 2015年 guangyu2144. All rights reserved.
//
#define kCalcAngle(x) x*M_PI/180
#import "GYCollectionViewLayout.h"

@interface GYCollectionViewLayout ()
{
    CGFloat _viewHeight;
    CGFloat _itemHeight;
}
@property(nonatomic)  MZCarouselAnim carouselAnim;

@end

@implementation GYCollectionViewLayout
-(instancetype)initWithAnim:(MZCarouselAnim )anim
{
    self = [super init];
    if (self)
    {
        self.carouselAnim = anim;
    }
    return self;
}
//-(void)prepareLayout
//{
//    [super prepareLayout];
//    
//    if (self.visibleCount<1)
//    {
//        self.visibleCount = 5;
//    }
//  
//    if (self.scrollDirection == UICollectionViewScrollDirectionVertical)
//    {
//        _viewHeight = CGRectGetHeight(self.collectionView.frame);
//        
//        _itemHeight = self.itemSize.height;
//        
//        self.collectionView.contentInset = UIEdgeInsetsMake((_viewHeight-_itemHeight)/2, 0, (_viewHeight-_itemHeight)/2, 0);
//
//    }else
//    {
//        _viewHeight = CGRectGetWidth(self.collectionView.frame);
//        
//        _itemHeight = self.itemSize.width;
//        
//        self.collectionView.contentInset = UIEdgeInsetsMake(0, (_viewHeight-_itemHeight)/2, 0, (_viewHeight-_itemHeight)/2);
//    }
//}
//返回collectionView的内容尺寸
//-(CGSize)collectionViewContentSize
//{
//    NSInteger cellCount = [self.collectionView numberOfItemsInSection:0];
//    
//    if (self.scrollDirection == UICollectionViewScrollDirectionVertical)
//    {
//        return CGSizeMake(CGRectGetWidth(self.collectionView.frame), cellCount*_itemHeight);
//        
//    }else
//    {
//         return CGSizeMake(cellCount*_itemHeight,CGRectGetHeight(self.collectionView.frame) );
//    }
//}
//返回rect中的所有的元素的布局属性
//返回的时包含UICollrctionViewLayoutAttributes的NSArray
//UICollrctionViewLayoutAttributes可以是cell，追加视图或装饰视图的信息，通过不同的UICollrctionViewLayoutAttributes初始化不同类型的UICollrctionViewLayoutAttributes：
//+ (instancetype)layoutAttributesForCellWithIndexPath:(NSIndexPath *)indexPath;
//+ (instancetype)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind withIndexPath:(NSIndexPath *)indexPath;
//+ (instancetype)layoutAttributesForDecorationViewOfKind:(NSString *)decorationViewKind withIndexPath:(NSIndexPath*)indexPath;
-(NSArray*)layoutAttributesForElementsInRect:(CGRect)rect
{
     NSInteger cellCount = [self.collectionView numberOfItemsInSection:0];
     NSMutableArray* array = [NSMutableArray array];
//    CGFloat centerY = (self.scrollDirection == UICollectionViewScrollDirectionVertical?self.collectionView.contentOffset.y:self.collectionView.contentOffset.x)+_viewHeight/2;
//    
//    NSInteger index = centerY/_itemHeight;
//    NSInteger count = (self.visibleCount-1)/2;
//    
//    NSInteger minIndex = MAX(0, (index-count));
//    NSInteger maxIndex = MIN((cellCount-1), (index+count));
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
    attrs.size = CGSizeMake(60, 60);
//    第几个item
    NSInteger index = indexPath.item;
//    半径100
    CGFloat radius = 100;
//    圆心
    CGFloat cicleX = self.collectionView.frame.size.width*0.5;
    CGFloat cicleY = self.collectionView.frame.size.height*0.5;
    
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    CGFloat singleItemAngle = 360.0/count;
    attrs.center = CGPointMake(cicleX+radius*cosf(kCalcAngle(singleItemAngle*index)), cicleY-radius*sinf(kCalcAngle(singleItemAngle*index)));
    
    
    
    return attrs;
    
}
//返回对应于indexPath的位置的追加视图的布局属性，如果没有追加视图不可重载
//- (UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath
//{
//    
//}
//返回对应于indexPath的位置的装饰视图的布局属性，如果没有装饰视图不可重载
//- (UICollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString*)elementKind atIndexPath:(NSIndexPath *)indexPath
//{
//    
//}
//当边界发生改变时，是否应该刷新布局。如果YES则在边界变化（一般是scroll到其他地方）时，将重新计算需要的布局信息
//- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
//{
//    
//}

//另外需要了解的是，在初始化一个UICollectionViewLayout实例后，会有一系列准备方法被自动调用，以保证layout实例的正确性。
//首先，-(void)prepareLayout将被调用，默认下该方法什么没做，但是在自己的子类实现中，一般在该方法设定一些必要的layout的结构和初始需要的参数等。之后，-(CGSize)collectionViewContentSize将被调用，以确定collection应该占据的尺寸。注意这里的尺寸不是指可视部分的尺寸，而应该是所有内容所占的尺寸。collectionView的本质是一个scrollView，因此需要这个尺寸来配置滚动行为。接下来-(NSArray*)layoutAttributesForElementsInRect:(CGRect)rect被调用，这个没什么值得多说的。初始化的layout的外观将有该方法返回的UICollectionViewLayoutAttributes来决定。
//另外，在需要更新layout时，需要给当前layout发送-invalidateLayout，该消息会立即返回，并且预约在下一个loop的时候刷新当前layout，这一点和UIView的setNeedsLayout方法十分类似。在-invalidateLayout后的下一个collectionView的刷新loop中，又会从prepareLayout开始，一次再调用-collectionViewContentSize和-layoutAttributesForElementsInRect来生成更新后的布局。
























@end
