//
//  ModelController.h
//  Video Test
//
//  Created by Jun Tao Luo on 2012-08-08.
//  Copyright (c) 2012 Jun Tao Luo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DataViewController;

@interface ModelController : NSObject <UIPageViewControllerDataSource>

- (DataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(DataViewController *)viewController;

@end
