//
//  RootViewController.h
//  UmDiaEuCompro
//
//  Created by Luiz Aguiar on 1/18/11.
//  Copyright 2011 Betterbrains Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UITableViewController 
{
	IBOutlet UITableView *tabela;
	NSMutableArray *listas;
}

-(void)saveFile;

@end
