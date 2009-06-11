//
//  GratitudeStreamViewController.m
//  GratitudeStream
//
//  Created by Garrett Snider on 5/29/09.
//  Copyright Signal Match 2009. All rights reserved.
//

#import "JustBreatheViewController.h"

@implementation JustBreatheViewController

@synthesize tipViewController, theAppDelegate;
@synthesize breatheLabel, timeTodayLabel, timeTotalLabel;
@synthesize breatheView;
@synthesize startButton, stopButton;
@synthesize myStartTime, myStopTime;
/*
 // The designated initializer. Override to perform setup that is required before the view is loaded.
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
 // Custom initialization
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
    [super viewDidLoad];
	
    theAppDelegate = (JustBreatheNewAppDelegate *) [[UIApplication sharedApplication] delegate];
	//if([(NSString*)[theAppDelegate objectFromAppSettingsPlistForKey:@"tip_screen"] isEqualToString:@"yes"]) {
//        tipViewController.view.frame = CGRectMake(0, -460, 320, 460);
//        //tipViewController.theAppDelegate = delegate;
//        [UIView beginAnimations:nil context:NULL];
//        [UIView setAnimationDuration:0.5];
//        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
//        [tipViewController viewWillAppear:YES];
//        [self.view addSubview:tipViewController.view];
//        tipViewController.view.frame = [[UIScreen mainScreen] bounds];	
//        [UIView commitAnimations];
//	}
//	
	//UIView *lhAdView = [[UIView alloc] initWithFrame:CGRectMake(0, 384, 320, 80)];
	//	UIColor *backgroundColor = [UIColor colorWithRed:(((float)191)/255.0) green:(((float)30)/255.0) blue:(((float)46)/255.0) alpha:1.0];
	//	UILabel *testLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 384, 120, 40)];
	//	[testLabel setText:@"LH ad"];
	//	[testLabel setBackgroundColor:[UIColor whiteColor]];
	//	[lhAdView addSubview:testLabel];
	//	lhAdView.backgroundColor = backgroundColor;
	//	[self.view addSubview:lhAdView];
	//	[lhAdView release];
	
//	UIButton *sigpatAd = [[UIButton alloc] initWithFrame:CGRectMake(0, 405, 320, 48)];
//	UIColor *backgroundColor = [UIColor colorWithRed:(((float)191)/255.0) green:(((float)30)/255.0) blue:(((float)46)/255.0) alpha:1.0];
//	[sigpatAd setBackgroundColor:backgroundColor];
//	[sigpatAd setImage:[UIImage imageNamed:@"lh_ad.png"] forState:UIControlStateNormal];
//	
//	[sigpatAd addTarget:self action:@selector(lhAppUrl) forControlEvents:UIControlEventTouchUpInside];
//	[self.view addSubview:sigpatAd];
}

#pragma mark Other stuff methods


/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */
-(IBAction) startBreathing {
	myStartTime = CFAbsoluteTimeGetCurrent();
	NSArray *imgNames = [NSArray arrayWithObjects:@"breathe_background_plain.jpg",@"breathe_background_step1.jpg",@"breathe_background_step2.jpg",@"breathe_background_step3.jpg",@"breathe_background_step4.jpg",@"breathe_background_step5.jpg",@"breathe_background_step6.jpg",@"breathe_background_step7.jpg",@"breathe_background_step8.jpg",@"breathe_background_step9.jpg",@"breathe_background_step10.jpg",@"breathe_background_step11.jpg",@"breathe_background_step12.jpg",@"breathe_background_step13.jpg",@"breathe_background_step14.jpg",@"breathe_background_step15.jpg",@"breathe_background_step16.jpg",@"breathe_background_step17.jpg",@"breathe_background_step18.jpg",@"breathe_background_step19.jpg",nil];
	NSMutableArray *myImages = [[NSMutableArray alloc] init];
	for(int i=0;i< [imgNames count]; i++) {
		[myImages addObject:[UIImage imageNamed:[imgNames objectAtIndex:i]] ];
	}
	for(int i=0;i< [imgNames count]; i++) {
		int index = [imgNames count] - i -1;
		[myImages addObject:[UIImage imageNamed:[imgNames objectAtIndex:index]] ];
	}
	breatheView.animationImages = myImages; 
	breatheView.animationDuration = 5.00; 
	// seconds 
	breatheView.animationRepeatCount = 0; // 0 = loops forever 
	[breatheView startAnimating];
	stopButton.hidden = NO;
	startButton.hidden = YES;
	timeTodayLabel.text = [NSString stringWithFormat:@"Time spent today %f",[self.theAppDelegate getFromStats:@"time_today"]];
	timeTotalLabel.text = [NSString stringWithFormat:@"Total time spent %f",[self.theAppDelegate getFromStats:@"time_total"]];
}

-(IBAction) stopBreathing {
	myStopTime = CFAbsoluteTimeGetCurrent(); 
	float currentTime = myStopTime - myStartTime;
	float total_time = [self.theAppDelegate getFromStats:@"time_total"];
	float total_today = [self.theAppDelegate getFromStats:@"time_today"];
	[self.theAppDelegate writeToStats:@"time_total" value:[NSNumber numberWithFloat:(currentTime+total_time)]];
	[self.theAppDelegate writeToStats:@"time_today" value:[NSNumber numberWithFloat:(currentTime+total_today)]];
	[breatheView stopAnimating];
	stopButton.hidden = YES;
	startButton.hidden = NO;
	timeTodayLabel.text = [NSString stringWithFormat:@"Time spent today %f",[self.theAppDelegate getFromStats:@"time_today"]];
	timeTotalLabel.text = [NSString stringWithFormat:@"Total time spent %f",[self.theAppDelegate getFromStats:@"time_total"]];
}

-(IBAction) showInfo {
	tipViewController.view.frame = CGRectMake(0, -460, 320, 460);
	//theAppDelegate//tipViewController.theAppDelegate = delegate;
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationCurve:UIViewAnimationCurveLinear];
	[tipViewController viewWillAppear:YES];
	[self.view addSubview:tipViewController.view];
	tipViewController.view.frame = [[UIScreen mainScreen] bounds];	
	[UIView commitAnimations];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}

- (void)dealloc {
	[tipViewController release];
	[theAppDelegate release];
	[breatheLabel release];
	[timeTotalLabel release];
	[timeTodayLabel release];
	[breatheView release];
	[startButton release];
	[stopButton release];
	[super dealloc];
}

@end
