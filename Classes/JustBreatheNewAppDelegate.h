//
//  JustBreatheNewAppDelegate.h
//  JustBreatheNew
//
//  Created by Neha Mittal on 6/9/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JustBreatheViewController;

@interface JustBreatheNewAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	JustBreatheViewController *viewController;
	NSString *stats_plist_path;
	NSMutableDictionary *file_contents;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain)  JustBreatheViewController *viewController;
@property (nonatomic, retain) NSString *stats_plist_path;
@property (nonatomic, retain) NSMutableDictionary *file_contents;

-(void) initializeStats;
-(void) writeToStats:(NSString*)key value:(NSNumber*)value;
-(float) getFromStats:(NSString*)key;
@end

