//
//  DataViewController.h
//  Video Test
//
//  Created by Jun Tao Luo on 2012-08-08.
//  Copyright (c) 2012 Jun Tao Luo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface DataViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton * videoButton;
@property (strong, nonatomic) id dataObject;
@property (nonatomic, retain) NSDictionary *videos;

- (void)embedYouTube:(NSString *)urlString frame:(CGRect)frame;

@end
