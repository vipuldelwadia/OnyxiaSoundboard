//
//  OnyxiaSoundboardAppDelegate.m
//  OnyxiaSoundboard
//
//  Created by Vipul Delwadia on 11/02/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import "OnyxiaSoundboardAppDelegate.h"
#import "MainViewController.h"

@implementation OnyxiaSoundboardAppDelegate


@synthesize window;
@synthesize mainViewController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
	MainViewController *aController = [[MainViewController alloc] initWithNibName:@"MainView" bundle:nil];
	self.mainViewController = aController;
	[aController release];
	
    mainViewController.view.frame = [UIScreen mainScreen].applicationFrame;
	[window addSubview:[mainViewController view]];
    [window makeKeyAndVisible];
	
	return YES;
}


- (void)dealloc {
    [mainViewController release];
    [window release];
    [super dealloc];
}

@end
