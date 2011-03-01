//
//  ListItemsViewController.h
//  UmDiaEuCompro
//
//  Created by Luiz Aguiar on 2/23/11.
//  Copyright 2011 Betterbrains Studio. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ListItemsViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
{
	IBOutlet UITableView *tabela;
	NSMutableDictionary *selectedList;
	NSMutableArray *itemsDaLista, *listas;
}

@property(nonatomic,retain)NSDictionary *selectedList;
@property(nonatomic,retain)NSMutableArray *listas;

- (void)saveFile;
- (IBAction)addNewItem;

@end
