//
//  NewItemViewController.h
//  UmDiaEuCompro
//
//  Created by Luiz Aguiar on 2/22/11.
//  Copyright 2011 Betterbrains Studio. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NewItemViewController : UIViewController 
{
	IBOutlet UITextField *itemName, *itemPrice;
	NSMutableArray *itemsDaLista, *listas;
}

@property(nonatomic,retain)NSMutableArray *itemsDaLista, *listas;

-(IBAction)cancel;
-(IBAction)save;
-(void)saveFile;

@end
