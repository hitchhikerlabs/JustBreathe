//
//  SliderView.h
//  LiveHappy
//
//  Copyright 2009 Signal Match. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SliderView : UIView <UIScrollViewDelegate> {
    IBOutlet UIScrollView *scrollView;
    IBOutlet UILabel *activityTitleLabel;
    IBOutlet UILabel *activityTextLabel;
    IBOutlet UIButton *activityButton;
    IBOutlet UIButton *videoButton;
}

@property (nonatomic, retain) UIScrollView *scrollView;
@property (nonatomic, retain) UILabel *activityTitleLabel;
@property (nonatomic, retain) UILabel *activityTextLabel;
@property (nonatomic, retain) UIButton *activityButton;
@property (nonatomic, retain) UIButton *videoButton;

- (IBAction)flipButtonClicked:(id)sender;
-(void) flipClicked;
//-(void) flipLeft;

@end
