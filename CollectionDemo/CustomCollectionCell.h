//
//  CustomCollectionCell.h
//  PhilipsDemo
//
//  Created by Vipin on 23/11/14.
//  Copyright (c) 2014 UST Global. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomCellDelegate <NSObject>

- (void) selectedNotification:(NSInteger)index;

@end

@interface CustomCollectionCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *cameraImage;
@property (weak, nonatomic) IBOutlet UILabel *dateTimeOutlet;
@property (weak, nonatomic) IBOutlet UILabel *deviceName;
@property (nonatomic, weak) id <CustomCellDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIButton *notificaitonOutlet;

- (IBAction)notificationAction:(id)sender;

@end
