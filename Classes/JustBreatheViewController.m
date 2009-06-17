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
@synthesize startButton;
@synthesize myStartTime, myStopTime;
@synthesize firstTimer, secondTimer, thirdTimer;
@synthesize imgNames, imgArray;
@synthesize continueAnimation;
@synthesize x;
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
	
	self.imgNames = [NSArray arrayWithObjects:@"breathe_background_with_frame2.jpg",@"breathe_background_step1.jpg",@"breathe_background_step2.jpg",@"breathe_background_step3.jpg",@"breathe_background_step4.jpg",@"breathe_background_step5.jpg",@"breathe_background_step6.jpg",@"breathe_background_step7.jpg",@"breathe_background_step8.jpg",@"breathe_background_step9.jpg",@"breathe_background_step10.jpg",@"breathe_background_step11.jpg",@"breathe_background_step12.jpg",@"breathe_background_step13.jpg",@"breathe_background_step14.jpg",@"breathe_background_step15.jpg",@"breathe_background_step16.jpg",@"breathe_background_step17.jpg",@"breathe_background_step18.jpg",@"breathe_background_step19.jpg",nil];
	//for (int i = 0;i < [imgNames count]; i++) {
//		[imgArray addObject:[UIImage imageNamed:[imgNames objectAtIndex:i]];
//	}
    theAppDelegate = (JustBreatheNewAppDelegate *) [[UIApplication sharedApplication] delegate];
	if([[theAppDelegate getStringFromStats:@"tip_screen"] isEqualToString:@"yes"]) {
        tipViewController.view.frame = CGRectMake(0, -460, 320, 460);
        //tipViewController.theAppDelegate = delegate;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        [tipViewController viewWillAppear:YES];
        [self.view addSubview:tipViewController.view];
        tipViewController.view.frame = [[UIScreen mainScreen] bounds];	
        [UIView commitAnimations];
	}
	
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
		self.continueAnimation = false;
	} else {
		self.continueAnimation = true;
		self.x = 0.0;
		[startButton setTitle:@"Stop" forState:UIControlStateNormal];
		[startButton setTitle:@"Stop" forState:UIControlStateSelected];
		[startButton setTitle:@"Stop" forState:UIControlStateHighlighted];
	}
	myStartTime = CFAbsoluteTimeGetCurrent();
	if (self.continueAnimation) {
		[NSTimer scheduledTimerWithTimeInterval:x target:self selector:@selector(startAnimations:) userInfo:nil repeats:NO];
	} else {
		if ([self.thirdTimer isValid]) {
			[self.thirdTimer invalidate];
		}
		if ([self.secondTimer isValid]) [self.secondTimer invalidate];
		if ([self.firstTimer isValid]) [self.firstTimer invalidate];
		breatheView.image = [UIImage imageNamed:@"breathe_background_with_frame2.jpg"];
		[breatheView stopAnimating];
		//myStopTime = CFAbsoluteTimeGetCurrent(); 
//		int currentTime = (myStopTime - myStartTime)/18;
	}
}

-(void) startAnimations :(NSTimer*)theTimer {
	while(self.x < 60) {
	self.firstTimer = [NSTimer scheduledTimerWithTimeInterval:x target:self selector:@selector(firstAnimation:) userInfo:nil repeats:NO];
	[self.firstTimer isValid];
	self.x = x+ 3;
	[breatheView stopAnimating];
	self.secondTimer =[NSTimer scheduledTimerWithTimeInterval:x target:self selector:@selector(secondAnimation:) userInfo:nil repeats:NO];
	[self.secondTimer isValid];
	self.x = x+ 3;
	self.thirdTimer = [NSTimer scheduledTimerWithTimeInterval:x target:self selector:@selector(thirdAnimation:) userInfo:nil repeats:NO];
	[self.thirdTimer isValid];
	self.x = x+ 4;
	[breatheView stopAnimating];
	}
}

- (void)firstAnimation:(NSTimer*)theTimer {
	NSMutableArray *myImages = [[NSMutableArray alloc] init];
	for(int i=0;i< [imgNames count]; i++) {
//		// Load the image
//		NSString *name = [imgNames objectAtIndex:i];
//    	
//		UIImage *image = [UIImage newImageFromResource:name];
//    
//		// Put it in the cache
//		[[ImageCache sharedImageCache] storeImage:image withKey:name];
//    
//		// Release the image
//		[image release];
//		image = nil;
//	
//		// Retrieve the image back
//		UIImage *savedImage = [[ImageCache sharedImageCache] imageForKey:name];
//		//imageView.image = savedImage;	
		[myImages addObject:[UIImage imageNamed:[imgNames objectAtIndex:i]] ];
	}
	[UIView beginAnimations:nil context:nil];
	breatheView.animationImages = myImages; 
	breatheView.animationDuration = 6.00; 
	// seconds 
	breatheView.animationRepeatCount = 0; // 0 = loops forever 
	[breatheView startAnimating];
	[UIView commitAnimations];
}

- (void)secondAnimation:(NSTimer*)theTimer {
	breatheView.image = [UIImage imageNamed:@"breathe_background_step19.jpg"];
}

- (void)thirdAnimation:(NSTimer*)theTimer {
	NSMutableArray *myImages = [[NSMutableArray alloc] init];
	for(int i=0;i< [imgNames count]; i++) {
		int index = [imgNames count] - i -1;
		[myImages addObject:[UIImage imageNamed:[imgNames objectAtIndex:index]] ];
	}
	[UIView beginAnimations:nil context:nil];
	breatheView.animationImages = myImages; 
	breatheView.animationDuration = 5.00; 
	// seconds 
	breatheView.animationRepeatCount = 0; // 0 = loops forever 
	[breatheView startAnimating];
	[UIView commitAnimations];
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
	[firstTimer release];
	[secondTimer release];
	[thirdTimer release];
	[imgNames release];
	[imgArray release];
	[super dealloc];
}

@end
