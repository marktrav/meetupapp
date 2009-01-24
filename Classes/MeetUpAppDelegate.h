//
//  MeetUpAppDelegate.h
//  MeetUp
//
//  Created by Christopher Burnett on 1/24/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MeetUpViewController;

@interface MeetUpAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MeetUpViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MeetUpViewController *viewController;

@end

