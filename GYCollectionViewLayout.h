//
//  GYCollectionViewLayout.h
//  CollectionDemo
//
//  Created by 李梦珠 on 15/10/29.
//  Copyright (c) 2015年 guangyu2144. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, MZCarouselAnim){
  
    MZCarouselAnimDefault,
    MZCarouselAnimLinear,

};

@interface GYCollectionViewLayout : UICollectionViewLayout
-(instancetype)initWithAnim:(MZCarouselAnim)anim;

@property(readonly)  MZCarouselAnim caiouselAnim;

@property(nonatomic) CGSize itemSize;
@property(nonatomic) CGFloat lineSpace;
@property(nonatomic) NSInteger visibleCount;
@property(nonatomic) UICollectionViewScrollDirection scrollDirection;

@end
