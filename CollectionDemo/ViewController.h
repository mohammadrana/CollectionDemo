//
//  ViewController.h
//  CollectionDemo
//
//  Created by Vipin on 23/11/14.
//  Copyright (c) 2014 Coderzheaven. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCollectionCell.h"

@interface ViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, CustomCellDelegate>{
   
    NSArray *image_array, *label_array;
    
}

@property(nonatomic, weak) IBOutlet UICollectionView *collectionView;


@end

