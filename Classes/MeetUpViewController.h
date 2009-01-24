//
//  MeetUpViewController.h
//  MeetUp
//
//  Created by Christopher Burnett on 1/24/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CXMLDocument.h"
@interface MeetUpViewController : UIViewController {
 NSMutableData *requestedXML;
}
- (void)loadXMLData;
- (IBAction)loadTable;

@property (nonatomic,retain) NSMutableData *requestedXML;

@end

