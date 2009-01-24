//
//  MeetUpViewController.m
//  MeetUp
//
//  Created by Christopher Burnett on 1/24/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "MeetUpViewController.h"
#import "DataTableViewController.h"

@implementation MeetUpViewController

@synthesize requestedXML;

- (IBAction)loadTable{
	DataTableViewController *dt = [[DataTableViewController alloc] initWithNibName:@"DataTable" 
																																					bundle:nil]; 
	[[self navigationController] pushViewController:dt animated:YES];
	[dt release];
}

- (void)loadXMLData{
	NSURL *requestUrl 		= [NSURL URLWithString:@"http://earthquake.usgs.gov/eqcenter/catalogs/7day-M2.5.xml"];
	NSURLRequest *request = [NSURLRequest requestWithURL:requestUrl 
																					 cachePolicy:(NSURLRequestCachePolicy)nil 
																			 timeoutInterval:(NSTimeInterval)10];
	self.requestedXML 		= [[NSMutableData data] retain];
	[NSURLConnection connectionWithRequest:request 
																delegate:self ];
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[self loadXMLData];
	
	[super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [super dealloc];
}



// NSURLConnection Delegate Methods //
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSMutableData *)data {
	NSLog(@"Recieving Data...");
	[self.requestedXML appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
	NSLog(@"Fininshed Loading...");
	
	NSError *theError = NULL;
	CXMLDocument *theXMLDocument = [[[CXMLDocument alloc] initWithData:self.requestedXML options:0 error:&theError] autorelease];
	
	
	NSArray *theNodes = NULL;
	
	theNodes = [theXMLDocument nodesForXPath:@"/entry" error:&theError];
	//NSLog(@"%@", theNodes);
	for (CXMLElement *theElement in theNodes)
	{
		theNodes = [theElement nodesForXPath:@"./title" error:NULL];
		NSLog(@"%@", theNodes);
	}
	
	
	
	
	
	//NSDictionary * jsonDictionary = [self parseJSON:requestedJSONData];
//	(void) [self.loadedDelegate performSelector:@selector(loadedData:)
//					withObject:jsonDictionary];
}
/*
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
	//UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Webservice Down" message:@"Unable to connect to missiozero.org. Please try again later."  delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
	
	
	UIAlertView *alert = [[UIAlertView alloc] 
												initWithTitle: [error localizedDescription] 
												message: [error localizedFailureReason] 
												delegate:nil 
												cancelButtonTitle:@"OK" 
												otherButtonTitles:nil]; 
	
	
	[alert show];
	[alert release];
	
	NSLog(@"Connection Error ::", error);
}
 */



@end
