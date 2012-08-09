//
//  DataViewController.m
//  Video Test
//
//  Created by Jun Tao Luo on 2012-08-08.
//  Copyright (c) 2012 Jun Tao Luo. All rights reserved.
//

#import "DataViewController.h"

@interface DataViewController ()

@end

@implementation DataViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.videoButton = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (IBAction)playVideo:(id)sender
{
    NSLog(@"clicked play video");
    NSString * videoURL= @"http://www.youtube.com/watch?v=oHg5SJYRHA0";
    NSLog(@"URL Address : %@",videoURL);
    
    //Create a URL object.
    NSURL *url = [NSURL URLWithString:videoURL];
    
    MPMoviePlayerController * movie = [[MPMoviePlayerController alloc] initWithContentURL:url];
    movie.scalingMode = MPMovieScalingModeAspectFill;
    [movie prepareToPlay];
    movie.view.frame = CGRectMake(10.0, 10.0, 100.0, 100.0);
    [self.view addSubview:movie.view];
    [self.view bringSubviewToFront:movie.view];
    [movie play];
}

@end
