//
//  JustBreatheNewAppDelegate.m
//  JustBreatheNew
//
//  Created by Neha Mittal on 6/9/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "JustBreatheNewAppDelegate.h"
#import "JustBreatheViewController.h"

@implementation JustBreatheNewAppDelegate

@synthesize window, viewController, stats_plist_path, file_contents;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
	[self initializeStats];
	[window addSubview:viewController.view];
    [window makeKeyAndVisible];
}

//The method to create a file which will record the breathing done
-(void) initializeStats {
	NSArray *searchPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentFolderPath = [searchPaths objectAtIndex:0];
	self.stats_plist_path = [documentFolderPath stringByAppendingPathComponent:@"stats.plist"];    
	if (![[NSFileManager defaultManager] fileExistsAtPath:stats_plist_path]) 
	{
		//set dictionary to contents of file
		NSString *pathToDefaultPlist = [[NSBundle mainBundle] pathForResource:@"stats" ofType:@"plist"];
		NSFileManager *fileManager = [NSFileManager defaultManager];
		[fileManager copyItemAtPath:pathToDefaultPlist toPath: self.stats_plist_path error:NULL];
		
        self.file_contents = [[NSMutableDictionary alloc] initWithContentsOfFile:self.stats_plist_path];
		NSDate *d = [NSDate date];
        [self.file_contents setObject:d forKey:@"install_date"];
		[self.file_contents writeToFile:self.stats_plist_path atomically:YES];
    } else {
		self.file_contents = [[NSMutableDictionary alloc] initWithContentsOfFile:stats_plist_path];
	}
}

-(void) writeToStats:(NSString*)key value:(NSNumber*)value {
    [self.file_contents setValue:value forKey:key];
	
    [self.file_contents writeToFile:self.stats_plist_path atomically:YES];	
}

-(float) getFromStats:(NSString*)key {
    return([[self.file_contents objectForKey:key] floatValue]);
}

-(NSString*) getStringFromStats:(NSString*)key {
    return([self.file_contents objectForKey:key]);
}

- (void)dealloc {
    [window release];
	[viewController release];
	[stats_plist_path release];
	[stats_plist_path release];
    [super dealloc];
}


@end
