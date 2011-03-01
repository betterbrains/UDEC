//
//  NewListViewController.h
//  UmDiaEuCompro
//
//  Created by Luiz Aguiar on 2/22/11.
//  Copyright 2011 Betterbrains Studio. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NewListViewController : UIViewController {

	IBOutlet UITextField *listName;
	NSMutableArray *listas;
	
}

@property(nonatomic,retain)NSMutableArray *listas;

-(IBAction)cancel;
-(IBAction)saveNewList;
-(void)saveFile;

@end
