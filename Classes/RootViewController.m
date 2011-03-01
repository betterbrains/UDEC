//
//  RootViewController.m
//  UmDiaEuCompro
//
//  Created by Luiz Aguiar on 1/18/11.
//  Copyright 2011 Betterbrains Studio. All rights reserved.
//

#import "RootViewController.h"
#import "CustomCell.h"
#import "ListItemsViewController.h"
#import "NewListViewController.h"

@implementation RootViewController

- (void)saveFile
{
	// grava no disco
	NSString *path = [NSHomeDirectory() stringByAppendingString:@"/Documents/udec.plist"];
	[listas writeToFile:path atomically:TRUE];
}


- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.title = @"Listas";
	
	// Mesmo valor da CustomCell
    self.tableView.rowHeight = 54.0;
	
	// pega o endereco fisico que podemos gravar no iPhone
	NSString *path= [NSHomeDirectory() stringByAppendingString:@"/Documents/udec.plist"];
	
	// le do disco o arquivo
	listas = [NSMutableArray arrayWithContentsOfFile:path];
	
	// se o arquivo de lista nao existir, cria um
	if ([listas count] > 0) {
		[listas retain];
		
	} else {
		
		listas = [[NSMutableArray alloc] init];
		
		[self saveFile];
	}
	
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
	
	// adiciona o botao (+) na navigationBar
	UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addItem)];
    self.navigationItem.rightBarButtonItem = addButton; 
	
	[addButton release]; addButton = nil;
}

- (void)addItem
{
	NewListViewController *newListView = [[NewListViewController alloc] initWithNibName:@"NewListViewController" bundle:nil];
	
	newListView.listas = listas;
	
	[self presentModalViewController:newListView animated:TRUE];
	
	[newListView release];
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
	
	[self.tableView reloadData];
}

/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}
*/


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [listas count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"CustomCell";
    
	// pego uma celula customizada do poll e forca o tipo customizado com casting
    CustomCell *cell = (CustomCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];

	if (cell == nil) {
		NSArray* nibFiles = [[NSBundle mainBundle] loadNibNamed:@"CustomCell" owner:nil options:nil];
		cell = [nibFiles objectAtIndex:0];
		//cell = [[[CustomCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
	
	NSMutableDictionary *info = [listas objectAtIndex:indexPath.row];
	
	// coloca texto na tabela
	cell.info = info;

    return cell;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//	return 50; // mesmo numero setado no tamanho da celula no interface builder
//}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
		[listas removeObjectAtIndex:indexPath.row]; // remove a linha da fonte de dados
		
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) 
	{
		
    }   
	
	// atualiza o arquivo que mantem os dados 
	[self saveFile];			
}


// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
	
	// reposiciona o elemento no array de dados
	NSString *tmp = [[listas objectAtIndex:fromIndexPath.row] copy];
	[listas removeObjectAtIndex:fromIndexPath.row];
	[listas insertObject:tmp atIndex:toIndexPath.row];

	// atualiza o arquivo que mantem os dados 
	[self saveFile];		
	
	[tmp release]; 
	tmp = nil;
}


- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // cria a nova view
	ListItemsViewController *detailViewController = [[ListItemsViewController alloc] initWithNibName:@"ListItemsViewController" bundle:nil];
	
	// pega a lista selecionada
	NSMutableDictionary *selectedList = [listas objectAtIndex:indexPath.row];
	
	// seta o titulo
	detailViewController.title = [selectedList objectForKey:@"listName"];
	
	// atribui a lista selecionada 
	detailViewController.selectedList = selectedList;
	
	// passa a lista principal
	detailViewController.listas = listas;
		
	[self.navigationController pushViewController:detailViewController animated:YES];
	
	[detailViewController release];
	
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
	
}


@end

