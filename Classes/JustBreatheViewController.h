//
//  JustBreatheViewController.h
//  JustBreatheNew
//
//  Created by Neha Mittal on 6/9/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JustBreatheNewAppDelegate.h"
#import "TipViewController.h"
#import "SliderView.h"

@interface JustBreatheViewController : UIViewController {	
	IBOutlet TipViewController *tipVC;
	JustBreatheNewAppDelegate *theAppDelegate;
	IBOutlet UILabel *breatheLabel, *timeTodayLabel, *timeTotalLabel;
	IBOutlet UIImageView *breatheView;
	IBOutlet UIButton *startButton;
	CFAbsoluteTime myStartTime, myStopTime;
	NSTimer *firstTimer, *secondTimer, *thirdTimer, *fourthTimer, *mainTimer;
	NSArray *imgNames;
	NSMutableArray *imgArray;
	BOOL continueAnimation;
	NSTimeInterval x;
	IBOutlet UIWebView *infoWebView;
	IBOutlet SliderView *sliderView;
}

@property (nonatomic, retain) IBOutlet TipViewController *tipVC;
@property (nonatomic, retain) JustBreatheNewAppDelegate *theAppDelegate;
@property (nonatomic, retain) IBOutlet UILabel *breatheLabel, *timeTodayLabel, *timeTotalLabel;
@property (nonatomic, retain) IBOutlet UIImageView *breatheView;
@property (nonatomic, retain) IBOutlet UIButton *startButton;
@property CFAbsoluteTime myStartTime, myStopTime;
@property (nonatomic, retain) NSTimer *firstTimer, *secondTimer, *thirdTimer, *fourthTimer, *mainTimer;
@property (nonatomic, retain) NSArray *imgNames;
@property (nonatomic, retain) NSMutableArray *imgArray;
@property BOOL continueAnimation;
@property NSTimeInterval x;
@property (nonatomic, retain) IBOutlet UIWebView *infoWebView;
@property (nonatomic, retain) IBOutlet SliderView *sliderView;


-(IBAction) startBreathing;
-(void) startAnimations;
@end
