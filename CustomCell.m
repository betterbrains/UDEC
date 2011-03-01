	//
	//  CustomCell.m
	//  UmDiaEuCompro
	//
	//  Created by Luiz Aguiar on 1/18/11.
	//  Copyright 2011 Betterbrains Studio. All rights reserved.
	//

#import "CustomCell.h"


@implementation CustomCell
@synthesize info;

// vem de UIView
-(void)layoutSubviews
{
	[super layoutSubviews];
	
	listName.text = [info valueForKey:@"listName"];
	
	//NSLog(@"%@", [info description]);
	
	NSMutableArray *itemsDaLista = [info objectForKey:@"itemsDaLista"];
	
	totalItems.text = [NSString stringWithFormat:@"%d itens", [itemsDaLista count]];
	// setar o valor total da lista
	
	float valorTotal = 0;
	NSMutableDictionary *produto;
	
	for (int i = 0; i < [itemsDaLista count]; i++) 
	{
		produto = [itemsDaLista objectAtIndex:i];
		//NSLog(@"%f", [[produto objectForKey:@"price"]floatValue]);
		valorTotal += [[produto objectForKey:@"price"] floatValue];
		
	}
	
	totalPrice.text = [NSString stringWithFormat:@"R$ %.2f", valorTotal];
	
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
			// Initialization code.
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
    
		// Configure the view for the selected state.
}


- (void)dealloc {
    [super dealloc];
}


@end
