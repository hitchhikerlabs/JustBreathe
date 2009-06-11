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
	IBOutlet UIButton *dontShowButton;
    IBOutlet UITextView *tipTextView;
    IBOutlet UILabel *tipLabel;
    IBOutlet UIImageView *quoteImage, * didYouKnowImage;
    BOOL shouldShowVideoButton;
	JustBreatheNewAppDelegate *theAppDelegate;
}

@property (nonatomic, retain) IBOutlet UIButton *closeButton;
@property (nonatomic, retain) IBOutlet UIButton *dontShowButton;
@property (nonatomic, retain) IBOutlet UITextView *tipTextView;
@property (nonatomic, retain) IBOutlet UILabel *tipLabel;
@property (nonatomic, retain) IBOutlet UIImageView *quoteImage, * didYouKnowImage;
@property (nonatomic, retain) JustBreatheNewAppDelegate *theAppDelegate;

-(IBAction)close;
-(IBAction)dontShow;

@end
