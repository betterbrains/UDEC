//
//  NewListViewController.m
//  UmDiaEuCompro
//
//  Created by Luiz Aguiar on 2/22/11.
//  Copyright 2011 Betterbrains Studio. All rights reserved.
//

#import "NewListViewController.h"


@implementation NewListViewController

@synthesize listas;

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


-(IBAction)saveNewList
{
	if (! [listName.text isEqualToString:@"" ] || ! [listName.text isEqualToString:@"Digite o nome da nova lista"] ) {
		NSMutableDictionary *newList = [[NSMutableDictionary alloc]init];
		[newList setObject:listName.text forKey:@"listName"];
		[listas addObject:newList];
		
		[self saveFile];
		
		[newList release];
		
	}
	
	[self dismissModalViewControllerAnimated:TRUE];
	
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	return TRUE;
}


// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Background.jpg"]];
	
	[listName becomeFirstResponder];
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
