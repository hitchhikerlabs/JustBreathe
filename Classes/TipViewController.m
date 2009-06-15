//
//  TipViewController.m
//  GratitudeStream
//
//  Created by Neha Mittal on 5/29/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TipViewController.h"


@implementation TipViewController
@synthesize closeButton, dontShowButton, tipTextView, tipLabel, theAppDelegate, quoteImage, didYouKnowImage;

-(IBAction)close
{	
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationCurve:UIViewAnimationCurveLinear];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(removeView:)];	
	self.view.frame = CGRectMake(0, -460, 320, 460);//[[UIScreen mainScreen] bounds];			
	[UIView commitAnimations];		
}

-(IBAction)dontShow
{
	[theAppDelegate writeToStats:@"tip_screen" value:@"no"];
	[self close];
}

-(void)removeView
{
	[self.view removeFromSuperview];
}


-(void) nextQuote {
    int randomNumber = (arc4random() % 2);
    //NSLog(@"randomNumber:%d", randomNumber);
	if (randomNumber == 1) {
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"quotes" ofType:@"plist"]; 
        NSArray * quotes =  [[[NSArray alloc] initWithContentsOfFile:plistPath] autorelease]; 
        
        randomNumber = (arc4random() % [quotes count]);
        NSArray * quoteArray = [quotes objectAtIndex:randomNumber];
		
        NSString * quote  = [quoteArray objectAtIndex:0];
        NSString * author = [quoteArray objectAtIndex:1];
        NSLog(@"%d: '%@' -- %@",randomNumber, quote, author);
        tipLabel.text = @"On Happiness";
        tipTextView.text = [NSString stringWithFormat:@"%@”\n-- %@",quote,author];
		
        quoteImage.hidden = NO;
        didYouKnowImage.hidden = YES;
		
    } else {
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"fun_facts" ofType:@"plist"]; 
        NSArray * facts =  [[[NSArray alloc] initWithContentsOfFile:plistPath] autorelease]; 
        
        randomNumber = (arc4random() % [facts count]);
        NSString * fact = [facts objectAtIndex:randomNumber];
        NSLog(@"%d: '%@'",randomNumber, fact);
        tipLabel.text = @"";
        tipTextView.text = [NSString stringWithFormat:@"%@",fact];
		
        quoteImage.hidden = YES;
        didYouKnowImage.hidden = NO;
		
    }
	
	
}

/* NOT CALLED
 // The designated initializer. Override to perform setup that is required before the view is loaded.
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
 }
 return self;
 }
 */

/*
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView {
 }
 */


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	theAppDelegate = (JustBreatheNewAppDelegate*)[[UIApplication sharedApplication] delegate];
	[super viewDidLoad];
}


/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
	[closeButton release];
	[dontShowButton release];
	[tipTextView release];
    [tipLabel release];
	[theAppDelegate release];
    [quoteImage release];
    [didYouKnowImage release];
    [super dealloc];
}


@end
