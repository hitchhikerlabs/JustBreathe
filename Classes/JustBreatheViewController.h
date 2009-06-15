//
//  JustBreatheViewController.h
//  JustBreatheNew
//
//  Created by Neha Mittal on 6/9/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TipViewController.h"
#import "JustBreatheNewAppDelegate.h"

@interface JustBreatheViewController : UIViewController {	
	IBOutlet TipViewController *tipViewController;
	JustBreatheNewAppDelegate *theAppDelegate;
	IBOutlet UILabel *breatheLabel, *timeTodayLabel, *timeTotalLabel;
	IBOutlet UIImageView *breatheView;
	IBOutlet UIButton *startButton;
	IBOutlet UIButton *stopButton;
	CFAbsoluteTime myStartTime, myStopTime;
	NSTimer *firstTimer, *secondTimer, *thirdTimer;
}

@property (nonatomic, retain) IBOutlet TipViewController *tipViewController;
@property (nonatomic, retain) JustBreatheNewAppDelegate *theAppDelegate;
@property (nonatomic, retain) IBOutlet UILabel *breatheLabel, *timeTodayLabel, *timeTotalLabel;
@property (nonatomic, retain) IBOutlet UIImageView *breatheView;
@property (nonatomic, retain) IBOutlet UIButton *startButton, *stopButton;
@property CFAbsoluteTime myStartTime, myStopTime;
@property (nonatomic, retain) NSTimer *firstTimer, *secondTimer, *thirdTimer;

-(IBAction) startBreathing;
-(IBAction) stopBreathing;
-(IBAction) showInfo;
@end
