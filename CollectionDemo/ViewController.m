//
//  ViewController.m
//  CollectionDemo
//
//  Created by 李梦珠 on 15/10/28.
//  Copyright (c) 2015年 guangyu2144. All rights reserved.
//

#import "ViewController.h"
#import "GYCollectionViewLayout.h"
#import "GYStackLayout.h"
#import "GYAnimationLayout.h"
#import "GYCollectionViewController.h"
@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic,strong)UICollectionView* collectionView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    
//    GYCollectionViewLayout * layout = [[GYCollectionViewLayout alloc] init];
//    UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc] init];
////    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//    layout.itemSize = CGSizeMake(self.view.bounds.size.width-20, 80);
//    
//    layout.sectionInset = UIEdgeInsetsMake(0.0, 0.0,0.0, 0.0);
//    layout.minimumLineSpacing = -10;
    
//    GYCollectionViewLayout* layout = [[GYCollectionViewLayout alloc] initWithAnim:MZCarouselAnimDefault];
    GYAnimationLayout* layout = [[GYAnimationLayout alloc] init];
    
    
    UICollectionView* collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor redColor];
    collectionView.delegate =self;
    collectionView.dataSource = self;
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.view addSubview:collectionView];
    self.collectionView =collectionView;
    
//    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
//    tapGesture.numberOfTapsRequired = 1; //点击次数
//    tapGesture.numberOfTouchesRequired = 1; //点击手指数
//    [collectionView addGestureRecognizer:tapGesture];
//    
    
}
//轻击手势触发方法
-(void)tapGesture:(UITapGestureRecognizer *)sender
{
    NSLog(@"-------");
//    if ([self.collectionView.collectionViewLayout isKindOfClass:[GYStackLayout class]])
//    {
//        [self.collectionView setCollectionViewLayout:[[GYCollectionViewLayout alloc] init] animated:YES];
//        
//    }else
//    {
//        [self.collectionView setCollectionViewLayout:[[GYStackLayout alloc] init] animated:YES];
//    }
}
//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    
//    NSLog(@"-------");
//    if ([self.collectionView.collectionViewLayout isKindOfClass:[GYStackLayout class]])
//    {
//        [self.collectionView setCollectionViewLayout:[[GYCollectionViewLayout alloc] init] animated:YES];
//        
//    }else
//    {
//        [self.collectionView setCollectionViewLayout:[[GYStackLayout alloc] init] animated:YES];
//    }
//}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.layer.borderWidth = 1.0f;
    cell.layer.cornerRadius = 5.0f;
    cell.layer.shadowColor = [UIColor blackColor].CGColor;
    cell.layer.shadowOpacity = 0.5f;
    cell.layer.shadowOffset = CGSizeMake(3, 0);
    cell.layer.shadowRadius = 3;
    cell.backgroundColor = [UIColor yellowColor];
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    GYCollectionViewLayout* layout = [[GYCollectionViewLayout alloc] initWithAnim:MZCarouselAnimDefault];
    layout.visibleCount = 3;
    layout.itemSize = CGSizeMake(250, 250);
//    UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc] init];
//    layout.itemSize = CGSizeMake(self.view.bounds.size.width-20, 100);
    
    GYCollectionViewController* gyCollectionVC = [[GYCollectionViewController alloc] initWithCollectionViewLayout:layout];
    [self presentViewController:gyCollectionVC animated:YES completion:^{
        
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
