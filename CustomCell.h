//
//  CustomCell.h
//  UmDiaEuCompro
//
//  Created by Luiz Aguiar on 1/18/11.
//  Copyright 2011 Betterbrains Studio. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CustomCell : UITableViewCell 
{
	IBOutlet UILabel *listName;
	IBOutlet UILabel *totalItems;
	IBOutlet UILabel *totalPrice;
	NSMutableDictionary *info;
}

@property(nonatomic,retain)NSDictionary * info;
-(void)layoutSubviews;

@end
