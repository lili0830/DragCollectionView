//
//  ViewController.m
//  ALDragCollectionView
//
//  Created by 李丽 on 16/8/29.
//  Copyright © 2016年 LiLi. All rights reserved.
//

#import "ViewController.h"
#import "ALDragCollectionView.h"
#import "DragCell.h"

@interface ViewController ()<ALDragCollectionViewDelagate,ALDragCollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) ALDragCollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *picsArray;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self al_initPics];
    [self al_initCollection];
}


#pragma mark ALDragCollectionViewDataSource


- (NSArray *)dataSourceArrayOfCollectionView:(ALDragCollectionView *)collectionView
{
    return self.picsArray;
}

- (void) dragCellCollectionView:(ALDragCollectionView *)collectionView newDataArrayAfterMove:(NSMutableArray *)newDataArray
{
    [self.picsArray removeAllObjects];
    [self.picsArray addObjectsFromArray:newDataArray];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.picsArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DragCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DragCellViewCell" forIndexPath:indexPath];
    cell.showImageView.image = [UIImage imageNamed:self.picsArray[indexPath.row]];
    return cell;
}

#pragma mark --UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((self.collectionView.bounds.size.width - 40)/3, (self.collectionView.bounds.size.width - 40)/3);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}





- (void) al_initCollection
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    self.collectionView = [[ALDragCollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[DragCell class] forCellWithReuseIdentifier:@"DragCellViewCell"];
    [self.view addSubview:self.collectionView];
}

- (void) al_initPics
{
    self.picsArray = [NSMutableArray arrayWithObjects:@"IMG_1282.jpg",@"IMG_1284.jpg",@"IMG_1289.jpg",@"IMG_1290.jpg", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
