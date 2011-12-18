//
//  cpbAppDelegate.h
//  CircleProgressBar
//
//  Created by 和史 大谷 on 11/12/18.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CircleProgressBarView;

@interface cpbAppDelegate : UIResponder <UIApplicationDelegate> {
    CircleProgressBarView *_cpb;
}
@property (nonatomic, retain) CircleProgressBarView *cpb;
@property (strong, nonatomic) UIWindow *window;
@end
