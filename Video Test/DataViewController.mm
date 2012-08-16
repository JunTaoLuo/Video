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
@synthesize videos;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.videos = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Video Data" ofType:@"plist"]];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.videoButton = nil;
    self.videos = nil;
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

#pragma mark - Table view data source


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.videos count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	return [[self.videos allKeys] objectAtIndex:section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	NSString *category = [self tableView:tableView titleForHeaderInSection:section];
	return [[self.videos valueForKey:category] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"VideoCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
	NSString *category = [self tableView:tableView titleForHeaderInSection:indexPath.section];
	NSString *video = [[self.videos valueForKey:category] objectAtIndex:indexPath.row];
	
	cell.textLabel.text = video;
	
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSString *categories = [self tableView:tableView titleForHeaderInSection:indexPath.section];
	NSString *video = [[self.videos valueForKey:categories] objectAtIndex:indexPath.row];
	
//	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
//													message:[NSString stringWithFormat:@"You selected %@!", video]
//												   delegate:nil
//										  cancelButtonTitle:@"OK"
//										  otherButtonTitles:nil];
//	[alert show];
	
//    NSURL *url = [NSURL URLWithString:video];
//    
//    MPMoviePlayerController * movie = [[MPMoviePlayerController alloc] initWithContentURL:url];
//    movie.scalingMode = MPMovieScalingModeAspectFill;
//    [movie prepareToPlay];
//    movie.view.frame = CGRectMake(0.0, 0.0, 320.0, 480.0);
//    [self.view addSubview:movie.view];
//    [self.view bringSubviewToFront:movie.view];
//    [movie play];
    
	//[tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self embedYouTube:video frame:CGRectMake(0.0, 0.0, 320.0, 480.0)];
    //[self embedYouTube:@"http://www.youtube.com/watch?feature=player_detailpage&v=7GoTB9MnFh8" frame:CGRectMake(20, 20, 70, 70)];
}

- (void)embedYouTube:(NSString *)urlString frame:(CGRect)frame {
	NSString *embedHTML = @"\
    <html><head>\
	<style type=\"text/css\">\
	body {\
	background-color: transparent;\
	color: transparent;\
	}\
	</style>\
	</head><body style=\"margin:0\">\
    <embed id=\"yt\" src=\"%@\" type=\"application/x-shockwave-flash\" \
	width=\"%0.0f\" height=\"%0.0f\"></embed>\
    </body></html>";
	NSString *html = [NSString stringWithFormat:embedHTML, urlString, frame.size.width, frame.size.height];
	UIWebView *videoView = [[UIWebView alloc] initWithFrame:frame];
	[videoView loadHTMLString:html baseURL:nil];
	[self.view addSubview:videoView];
}

@end
