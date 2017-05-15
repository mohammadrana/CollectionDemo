//
//  ViewController.m
//  CollectionDemo
//
//  Created by Vipin on 23/11/14.
//  Copyright (c) 2014 Coderzheaven. All rights reserved.
//

#import "ViewController.h"
#import "CustomCollectionCell.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize collectionView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    image_array = [NSArray arrayWithObjects: @"apple.png", @"android.png", @"apple.png", @"android.png",@"apple.png", @"android.png",@"apple.png", @"android.png", nil ];
    label_array = [NSArray arrayWithObjects: @"APPLE", @"ANDROID",@"APPLE", @"ANDROID", @"APPLE", @"ANDROID",
                   @"APPLE", @"ANDROID", nil ];
    
    collectionView.delegate = self;
    collectionView.dataSource = self;
    
    CGRect rect = collectionView.frame;
    rect.origin.x = 0;
    //rect.origin.x = 5;
    rect.origin.y = 0;
    //rect.size.width = [[UIScreen mainScreen] bounds].size.width - 5;
    rect.size.width = [[UIScreen mainScreen] bounds].size.width;
    rect.size.height = [[UIScreen mainScreen] bounds].size.height;
    
    collectionView.frame = rect;
    
    collectionView.backgroundColor = [UIColor clearColor];
}


-(void) setBorder:(UIView *) theView withBGColor:(UIColor *) color withCornerRadius :(float) radius andBorderWidth :(float) borderWidth andBorderColor :(UIColor *) bgColor WithAlpha:(float) curAlpha
{
    theView.layer.borderWidth = borderWidth;
    theView.layer.cornerRadius = radius;
    theView.layer.borderColor = [color CGColor];
    UIColor *c = [color colorWithAlphaComponent:curAlpha];
    theView.layer.backgroundColor = [c CGColor];
}

#pragma mark - UICollectionView Datasource
// 1
- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    return [image_array count];
}
// 2
- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return 1;
}
// 3
- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *simpleTableIdentifier = @"CustomCollectionCell";
    static BOOL nibMyCellloaded = NO;
    
    if(!nibMyCellloaded)
    {
        UINib *nib = [UINib nibWithNibName:simpleTableIdentifier bundle: nil];
        [cv registerNib:nib forCellWithReuseIdentifier:simpleTableIdentifier];
        nibMyCellloaded = YES;
    }
    
    CustomCollectionCell *cell = (CustomCollectionCell*)[cv dequeueReusableCellWithReuseIdentifier:simpleTableIdentifier forIndexPath:indexPath];
    cell.delegate = self;
//    CustomCollectionCell *cell = [cv dequeueReusableCellWithReuseIdentifier:simpleTableIdentifier forIndexPath:indexPath];
    
    cell.dateTimeOutlet.text = [label_array objectAtIndex:indexPath.row];
    cell.deviceName.text = [NSString stringWithFormat:@"Device %ld", (long)indexPath.row];
    cell.cameraImage.image = [UIImage imageNamed: [image_array objectAtIndex:indexPath.row]];
    cell.notificaitonOutlet.tag = indexPath.row;
    
//    if(indexPath.row % 2 == 0)
//        [self setBorder:cell withBGColor:[UIColor greenColor] withCornerRadius:3.0 andBorderWidth:0.5 andBorderColor:[UIColor redColor] WithAlpha:1.0];
//    else
//        [self setBorder:cell withBGColor:[UIColor redColor] withCornerRadius:3.0 andBorderWidth:0.5 andBorderColor:[UIColor redColor] WithAlpha:1.0];

    return cell;
}

// 4
/*- (UICollectionReusableView *)collectionView:
 (UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
 {
 return [[UICollectionReusableView alloc] init];
 }*/

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Clicked %ld", (long)indexPath.row);
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {

}

#pragma mark – UICollectionViewDelegateFlowLayout

// 1
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize s = CGSizeMake([[UIScreen mainScreen] bounds].size.width/2 - 3, 200);
    return s;
}

// 3
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 1, 0);
}

- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
//    NSNumber *index = [image_array objectAtIndex:fromIndexPath.item];
//    [data removeObjectAtIndex:fromIndexPath.item];
//    [data insertObject:index atIndex:toIndexPath.item];
    
//    NSObject *objectToMove = [label_array objectAtIndex:fromIndexPath.row];
//    [label_array removeObjectAtIndex:flowLayout.draggedIndexPath.row];
//    [label_array insertObject:objectToMove atIndex:toIndexPath.row];
}

- (void) selectedNotification:(NSInteger)index{
    NSLog(@"selectedNotification tag  %ld", (long)index+1);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
