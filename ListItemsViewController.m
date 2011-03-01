//
//  ListItemsViewController.m
//  UmDiaEuCompro
//
//  Created by Luiz Aguiar on 2/23/11.
//  Copyright 2011 Betterbrains Studio. All rights reserved.
//

#import "ListItemsViewController.h"
#import "NewItemViewController.h"

@implementation ListItemsViewController

@synthesize	selectedList, listas;


- (void)saveFile
{
	// grava no disco
	NSString *path = [NSHomeDirectory() stringByAppendingString:@"/Documents/udec.plist"];
	[listas writeToFile:path atomically:TRUE];
}


- (void)addNewItem
{
	NewItemViewController *newItemVC = [[NewItemViewController alloc] init];
	
	[newItemVC setTitle:@"Novo Item"];
	
	newItemVC.listas = listas;
	newItemVC.itemsDaLista = itemsDaLista;
	
	[self presentModalViewController:newItemVC animated:TRUE];
	
	[newItemVC release];
}


- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Background.jpg"]];
	
	tabela.rowHeight = 48.0;
	
	itemsDaLista = [selectedList objectForKey:@"itemsDaLista"];
	
	// verifica se a lista esta zerada (existe)
	if (! itemsDaLista) {
		itemsDaLista = [[NSMutableArray alloc] init];
		
		[selectedList setObject:itemsDaLista forKey:@"itemsDaLista"];
	}
	
    self.navigationItem.rightBarButtonItem = [self editButtonItem];	
}


- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	
	[tabela reloadData];	
}


- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
	[tabela setEditing:!tabela.editing animated:TRUE];
	
	if ([tabela isEditing]) {
		self.navigationItem.rightBarButtonItem.title = @"Done";
		
	} else {
		
		self.navigationItem.rightBarButtonItem.title = @"Edit";
	}
	
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [itemsDaLista count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
	NSMutableDictionary *produto = [itemsDaLista objectAtIndex:indexPath.row];
	
    // Configure the cell
	cell.textLabel.text = [produto objectForKey:@"itemName"];
	cell.detailTextLabel.text = [NSString stringWithFormat:@"R$ %@", [produto objectForKey:@"price"]];
    
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) 
	{
		[itemsDaLista removeObjectAtIndex:indexPath.row]; // remove a linha da fonte de dados
		
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) 
	{
		//
    }  
	
	// grava o arquivo
	[self saveFile];
}


- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath 
{
	// reposiciona o elemento no array de dados
	NSString *tmp = [[itemsDaLista objectAtIndex:fromIndexPath.row] copy];
	[itemsDaLista removeObjectAtIndex:fromIndexPath.row];
	[itemsDaLista insertObject:tmp atIndex:toIndexPath.row];
	
	// grava o arquivo
	[self saveFile];	
	
	[tmp release];
	tmp = nil;
}


- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
