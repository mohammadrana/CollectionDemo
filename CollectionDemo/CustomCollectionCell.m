//
//  CustomCollectionCell.m
//  PhilipsDemo
//
//  Created by Vipin on 23/11/14.
//  Copyright (c) 2014 UST Global. All rights reserved.
//

#import "CustomCollectionCell.h"

@implementation CustomCollectionCell

- (IBAction)notificationAction:(UIButton*)sender {
    [self.delegate selectedNotification:sender.tag];
}

@end
