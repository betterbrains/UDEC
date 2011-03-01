//
//  NewItemViewController.m
//  UmDiaEuCompro
//
//  Created by Luiz Aguiar on 2/22/11.
//  Copyright 2011 Betterbrains Studio. All rights reserved.
//

#import "NewItemViewController.h"


@implementation NewItemViewController

@synthesize itemsDaLista, listas;

- (void)saveFile
{
	// grava no disco
	NSString *path = [NSHomeDirectory() stringByAppendingString:@"/Documents/udec.plist"];
	[listas writeToFile:path atomically:TRUE];
}

-(IBAction)cancel
{
	[self dismissModalViewControllerAnimated:TRUE];
}


-(IBAction)save
{
	if (! [itemName.text isEqualToString:@"" ] || ! [itemName.text isEqualToString:@"Novo item"] ) 
	{
		NSMutableDictionary *item = [[NSMutableDictionary alloc] init];
		[item setObject:itemName.text forKey:@"itemName"];
		[item setObject:itemPrice.text forKey:@"price"];		

		[itemsDaLista addObject:item];
				
		[self saveFile];
		
		[item release];
	}
	
	[self dismissModalViewControllerAnimated:TRUE];
	
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	if (textField == itemName) {
		[itemPrice setKeyboardType:UIKeyboardTypeNumberPad];
		[itemPrice becomeFirstResponder];
		
	} else {
		[textField resignFirstResponder];
	}
	
	return TRUE;
}


- (void)viewDidLoad {
    [super viewDidLoad];
	
	[itemName becomeFirstResponder];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

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
