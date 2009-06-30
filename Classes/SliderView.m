//
//  SliderView.m
//  LiveHappy
//
//  Copyright 2009 Signal Match. All rights reserved.
//

#import "SliderView.h"
#import <QuartzCore/QuartzCore.h>


@implementation SliderView
@synthesize scrollView, activityTextLabel, activityTitleLabel, activityButton, videoButton;

- (void)dealloc {
    [scrollView release];
    [activityTextLabel release];
    [activityTitleLabel release];
    [activityButton release];
    [videoButton release];
    [super dealloc];
}

-(void) flipClicked {
	CGContextRef context = UIGraphicsGetCurrentContext();
    [UIView beginAnimations:nil context:context];
    [UIView setAnimationTransition: UIViewAnimationTransitionFlipFromLeft forView: self cache:YES];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:1.0];
    
    // Animations
    [self exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    
    // Commit Animation Block
    [UIView commitAnimations];
}

- (IBAction)flipButtonClicked:(id)sender{
    // Start Animation Block
    CGContextRef context = UIGraphicsGetCurrentContext();
    [UIView beginAnimations:nil context:context];
    [UIView setAnimationTransition: UIViewAnimationTransitionFlipFromLeft forView: self cache:YES];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:1.0];
    
    // Animations
    [self exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    
    // Commit Animation Block
    [UIView commitAnimations];
}



@end
