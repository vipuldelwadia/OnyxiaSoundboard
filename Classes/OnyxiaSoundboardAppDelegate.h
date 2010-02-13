//
//  OnyxiaSoundboardAppDelegate.h
//  OnyxiaSoundboard
//
//  Created by Vipul Delwadia on 11/02/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainViewController;

@interface OnyxiaSoundboardAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MainViewController *mainViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) MainViewController *mainViewController;

@end

