//
//  OrderCell.h
//  CoffeeOrder
//
//  Created by SDT-1 on 2014. 1. 15..
//  Copyright (c) 2014년 T. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OrderCell : UITableViewCell
@property (weak,nonatomic)IBOutlet UILabel *userName;
@property (weak,nonatomic)IBOutlet UILabel *coffeName;
@property (weak,nonatomic)IBOutlet UILabel *iceOrHot;
@property (weak,nonatomic)IBOutlet UIImageView *userImage;

@end
