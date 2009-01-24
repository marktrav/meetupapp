//
//  MeetUpAppDelegate.m
//  MeetUp
//
//  Created by Christopher Burnett on 1/24/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "MeetUpAppDelegate.h"
#import "MeetUpViewController.h"

@implementation MeetUpAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
