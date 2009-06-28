//
//  GratitudeStreamViewController.m
//  GratitudeStream
//
//  Created by Garrett Snider on 5/29/09.
//  Copyright Signal Match 2009. All rights reserved.
//

#import "JustBreatheViewController.h"

@implementation JustBreatheViewController

@synthesize theAppDelegate;
@synthesize breatheLabel, timeTodayLabel, timeTotalLabel;
@synthesize breatheView;
@synthesize startButton;
@synthesize myStartTime, myStopTime;
@synthesize firstTimer, secondTimer, thirdTimer, fourthTimer, mainTimer;
@synthesize imgNames, imgArray;
@synthesize continueAnimation;
@synthesize x;
@synthesize infoWebView;
@synthesize tipVC;
@synthesize sliderView;
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
	theAppDelegate = (JustBreatheNewAppDelegate*)[[UIApplication sharedApplication] delegate];
	if([[theAppDelegate getStringFromStats:@"first_time"] isEqualToString:@"yes"]) {
		[sliderView flipClicked];
		[theAppDelegate writeToStats:@"first_time" value:@"no"];
	}
	
	self.imgNames = [NSArray arrayWithObjects:@"breathe_background_step1.jpg",@"breathe_background_step2.jpg",@"breathe_background_step3.jpg",@"breathe_background_step4.jpg",@"breathe_background_step5.jpg",@"breathe_background_step6.jpg",@"breathe_background_step7.jpg",@"breathe_background_step8.jpg",@"breathe_background_step9.jpg",@"breathe_background_step10.jpg",@"breathe_background_step11.jpg",@"breathe_background_step12.jpg",@"breathe_background_step13.jpg",@"breathe_background_step14.jpg",@"breathe_background_step15.jpg",@"breathe_background_step16.jpg",@"breathe_background_step17.jpg",@"breathe_background_step18.jpg",@"breathe_background_step19.jpg",nil];
	[infoWebView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"terms" ofType:@"html"]isDirectory:NO]]];

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
	if(self.continueAnimation) {
		myStopTime = CFAbsoluteTimeGetCurrent(); 
		int count = (myStopTime - myStartTime)/14;
		self.continueAnimation = false;
		[startButton setTitle:@"Start Again" forState:UIControlStateNormal];
		[startButton setTitle:@"Start Again" forState:UIControlStateSelected];
		[startButton setTitle:@"Start Again" forState:UIControlStateHighlighted];
		tipVC.view.frame = CGRectMake(0, -460, 320, 460);
		tipVC.tipLabel.text = [NSString stringWithFormat:@"You just completed %d breaths",count];
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        [tipVC viewWillAppear:YES];
        [self.view addSubview:tipVC.view];
        tipVC.view.frame = [[UIScreen mainScreen] bounds];	
        [UIView commitAnimations];
	} 
	else {
		myStartTime = CFAbsoluteTimeGetCurrent();
		self.continueAnimation = true;
		self.x = 0.0;
		[startButton setTitle:@"Stop" forState:UIControlStateNormal];
		[startButton setTitle:@"Stop" forState:UIControlStateSelected];
		[startButton setTitle:@"Stop" forState:UIControlStateHighlighted];
	}
	if (self.continueAnimation) {
		breatheView.hidden = NO;
		//self.mainTimer = [NSTimer scheduledTimerWithTimeInterval:x target:self selector:@selector(startAnimations:) userInfo:nil repeats:NO];
		[self startAnimations];
	} else {
		[self.mainTimer invalidate];
		if ([self.thirdTimer isValid]) {
			[self.thirdTimer invalidate];
		}
		if ([self.secondTimer isValid]) [self.secondTimer invalidate];
		if ([self.firstTimer isValid]) [self.firstTimer invalidate];
		breatheView.image = [UIImage imageNamed:@"breathe_background_step1.jpg"];
		[breatheView stopAnimating];
		breatheView.hidden = YES;
	}
}

-(void) startAnimations {
	while(self.x < 60) {
		self.firstTimer = [NSTimer scheduledTimerWithTimeInterval:x target:self selector:@selector(firstAnimation:) userInfo:nil repeats:NO];
		[self.firstTimer isValid];
		self.x = x+ 6;
		[breatheView stopAnimating];
		//self.secondTimer =[NSTimer scheduledTimerWithTimeInterval:x target:self selector:@selector(secondAnimation:) userInfo:nil repeats:NO];
//		[self.secondTimer isValid];
//		self.x = x+ 4;
		self.thirdTimer = [NSTimer scheduledTimerWithTimeInterval:x target:self selector:@selector(thirdAnimation:) userInfo:nil repeats:NO];
		[self.thirdTimer isValid];
		self.x = x+ 6;
		//self.fourthTimer = [NSTimer scheduledTimerWithTimeInterval:x target:self selector:@selector(fourthAnimation:) userInfo:nil repeats:NO];
//		[self.fourthTimer isValid];
//		self.x = x+ 4;
		[breatheView stopAnimating];
	}
}

- (void)firstAnimation:(NSTimer*)theTimer {
	NSMutableArray *myImages = [[NSMutableArray alloc] init];
	for(int i=0;i< [imgNames count]; i++) {	
		[myImages addObject:[UIImage imageNamed:[imgNames objectAtIndex:i]] ];
	}
	[UIView beginAnimations:nil context:nil];
	breatheView.animationImages = myImages; 
	breatheView.animationDuration = 6.0; 
	breatheView.animationRepeatCount = 1; // 0 = loops forever 
	[breatheView startAnimating];
	[UIView commitAnimations];
}

- (void)secondAnimation:(NSTimer*)theTimer {
	//breatheView.image = [UIImage imageNamed:@"breathe_background_step19.jpg"];
	UIImage *img =  [UIImage imageNamed:@"breathe_background_step19.jpg"];
	NSMutableArray *myImages = [[NSMutableArray alloc] init];
	for(int i=0;i< 7; i++) {	
		[myImages addObject:img ];
	}
	breatheView.animationImages = myImages;
	breatheView.animationDuration = 4.00;
	[breatheView startAnimating];
}

- (void)thirdAnimation:(NSTimer*)theTimer {
	NSMutableArray *myImages = [[NSMutableArray alloc] init];
	for(int i=0;i< [imgNames count]; i++) {
		int index = [imgNames count] - i -1;
		[myImages addObject:[UIImage imageNamed:[imgNames objectAtIndex:index]] ];
	}
	[UIView beginAnimations:nil context:nil];
	breatheView.animationImages = myImages; 
	breatheView.animationDuration = 6.00; 
	// seconds 
	breatheView.animationRepeatCount = 1; // 0 = loops forever 
	[breatheView startAnimating];
	[UIView commitAnimations];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}

- (void)dealloc {
	[theAppDelegate release];
	[breatheLabel release];
	[timeTotalLabel release];
	[timeTodayLabel release];
	[breatheView release];
	[startButton release];
	[firstTimer release];
	[secondTimer release];
	[thirdTimer release];
	[imgNames release];
	[imgArray release];
	[fourthTimer release];
	[infoWebView release];
	[mainTimer release];
	[tipVC release];
	[sliderView release];
	[super dealloc];
}

@end
