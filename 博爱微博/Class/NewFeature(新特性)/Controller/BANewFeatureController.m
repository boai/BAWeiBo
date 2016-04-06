//
//  BANewFeatureController.m
//  博爱微博
//
//  Created by boai on 15/8/5.
//  Copyright (c) 2015年 boai. All rights reserved.
//

#import "BANewFeatureController.h"
#import "BANewFeatureCell.h"


@interface BANewFeatureController ()

@property (nonatomic, weak) UIPageControl *control;

@end

@implementation BANewFeatureController

static NSString *ID = @"cell";

- (instancetype)init
{
//    if (self = [super initWithCollectionViewLayout:<#(UICollectionViewLayout *)#>])
//    {
//        
//    }
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    // 注册cell的尺寸
    layout.itemSize= [UIScreen mainScreen].bounds.size;
    
    // 清空间距
    layout.minimumLineSpacing = 0;
    
    // 滚动方向
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    
    
    return [super initWithCollectionViewLayout:layout];
}

// self.collectionView != self.view
// 注意： self.collectionView 是 self.view的子控件

// 使用UICollectionViewController
// 1.初始化的时候设置布局参数
// 2.必须collectionView要注册cell
// 3.自定义cell
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.collectionView registerClass:[BANewFeatureCell class] forCellWithReuseIdentifier:ID];
    
    self.collectionView.backgroundColor = [UIColor greenColor];
    
    // 分页
    self.collectionView.pagingEnabled = YES;
    self.collectionView.bounces = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO; 
    
    // 添加pageController
    [self setUpPageControl];
}
// 添加pageController
- (void)setUpPageControl
{
    // 添加pageController,只需要设置位置，不需要管理尺寸
    UIPageControl *control = [[UIPageControl alloc] init];
    
    control.numberOfPages = 4;
    control.pageIndicatorTintColor = [UIColor blackColor];
    control.currentPageIndicatorTintColor = [UIColor redColor];
    
    // 设置center
    control.center = CGPointMake(self.view.width * 0.5, self.view.height);
    _control = control;
    [self.view addSubview:control];
}


#pragma mark - UIScrollView代理
// 只要一滚动就会调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 获取当前的偏移量，计算当前第几页
    int page = scrollView.contentOffset.x / scrollView.bounds.size.width + 0.5;
    
    // 设置页数
    _control.currentPage = page;
}
#pragma mark - UICollectionView代理和数据源
// 返回有多少组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
// 返回第section组有多少个cell
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}

// 返回cell长什么样子
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // dequeueReusableCellWithReuseIdentifier
    // 1.首先从缓存池里取cell
    // 2.看下当前是否有注册Cell,如果注册了cell，就会帮你创建cell
    // 3.没有注册，报错
    BANewFeatureCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    
    // 拼接图片名称 3.5 320 480
    CGFloat screenH = [UIScreen mainScreen].bounds.size.height;
    NSString *imageName = [NSString stringWithFormat:@"new_feature_%ld",indexPath.row + 1];
    if (screenH > 480) { // 5 , 6 , 6 plus
        imageName = [NSString stringWithFormat:@"new_feature_%ld-568h",indexPath.row + 1];
    }
    cell.image = [UIImage imageNamed:imageName];
    
    [cell setIndexPath:indexPath count:4];
    
    
    return cell;
    
}

@end
