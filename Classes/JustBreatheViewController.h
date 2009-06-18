//
//  JustBreatheViewController.h
//  JustBreatheNew
//
//  Created by Neha Mittal on 6/9/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JustBreatheNewAppDelegate.h"

@interface JustBreatheViewController : UIViewController {	
	JustBreatheNewAppDelegate *theAppDelegate;
	IBOutlet UILabel *breatheLabel, *timeTodayLabel, *timeTotalLabel;
	IBOutlet UIImageView *breatheView;
	IBOutlet UIButton *startButton;
	CFAbsoluteTime myStartTime, myStopTime;
	NSTimer *firstTimer, *secondTimer, *thirdTimer, *fourthTimer;
	NSArray *imgNames;
	NSMutableArray *imgArray;
	BOOL continueAnimation;
	NSTimeInterval x;
}

@property (nonatomic, retain) JustBreatheNewAppDelegate *theAppDelegate;
@property (nonatomic, retain) IBOutlet UILabel *breatheLabel, *timeTodayLabel, *timeTotalLabel;
@property (nonatomic, retain) IBOutlet UIImageView *breatheView;
@property (nonatomic, retain) IBOutlet UIButton *startButton;
@property CFAbsoluteTime myStartTime, myStopTime;
@property (nonatomic, retain) NSTimer *firstTimer, *secondTimer, *thirdTimer, *fourthTimer;
@property (nonatomic, retain) NSArray *imgNames;
@property (nonatomic, retain) NSMutableArray *imgArray;
@property BOOL continueAnimation;
@property NSTimeInterval x;


-(IBAction) startBreathing;
-(IBAction) stopBreathing;
-(IBAction) showInfo;
-(void) startAnimations :(NSTimer*)theTimer;
@end
