//
//  MainViewController.m
//  OnyxiaSoundboard
//
//  Created by Vipul Delwadia on 11/02/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import "MainViewController.h"
#import <AVFoundation/AVFoundation.h>

@implementation MainViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
	self.view.backgroundColor = [UIColor colorWithPatternImage: [UIImage imageNamed:@"onyxia.jpg"]];
//	self.view.indicatorStyle = UIScrollViewIndicatorStyleWhite;
//	self.view.scrollEnabled = YES;
//	self.view.clipsToBounds = NO;
}



- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller {
    
	[self dismissModalViewControllerAnimated:YES];
}


- (IBAction)showInfo {    
	
	FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
	controller.delegate = self;
	
	controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:controller animated:YES];
	
	[controller release];
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (void)playSound:(NSString *)filename {
	NSURL *fileURL = [[NSURL alloc] initFileURLWithPath: [[NSBundle mainBundle] pathForResource:filename ofType:@"m4a"]];
	AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
	if (player) {
		if ([player play]) {
			player.delegate = self;
		}
		else {
			NSLog(@"Could not play %@\n", player.url);
		}
	}
}

#pragma mark Interface 
- (IBAction)fiftyDKP {
	[self playSound:@"ony_50_dkp"];
}

- (IBAction) leftRight {
	[self playSound:@"ony_1357_left_2468_right"];
}

- (IBAction)sevenEight {
	[self playSound:@"ony_7_8_whelp_groups"];
}
	
- (IBAction)doNotStand {
	[self playSound:@"ony_do_not_stand_next_..."];
}

- (IBAction)goAway {
	[self playSound:@"ony_go_away"];
}

- (IBAction)hitItMeanIt {
	[self playSound:@"ony_hit_it_like_you_mean_it"];
}

- (IBAction)hitItFast {
	[self playSound:@"ony_hit_it_very_hard_fast"];
}
- (IBAction)aggroLose {
	[self playSound:@"ony_if_agro_lose_50dkp"];
}
- (IBAction)whelpsLose {
	[self playSound:@"ony_if_whelps_lose_50dkp"];
}
- (IBAction)standPlace {
	[self playSound:@"ony_stand_in_right_place"];
}

#pragma mark AVAudioPlayer delegate methods

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
	if (flag == NO)
		NSLog(@"Playback finished unsuccessfully");
	[player release];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


- (void)dealloc {
    [super dealloc];
}


@end
