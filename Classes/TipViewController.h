//
//  TipViewController.h
//  GratitudeStream
//
//  Created by Neha Mittal on 5/29/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JustBreatheNewAppDelegate.h"

@interface TipViewController : UIViewController {
	IBOutlet UIButton *closeButton;
	IBOutlet UILabel *tipLabel;
	JustBreatheNewAppDelegate *theAppDelegate;
}

@property (nonatomic, retain) IBOutlet UIButton *closeButton;
@property (nonatomic, retain) IBOutlet UILabel *tipLabel;
@property (nonatomic, retain) JustBreatheNewAppDelegate *theAppDelegate;

-(IBAction)close;

@end
