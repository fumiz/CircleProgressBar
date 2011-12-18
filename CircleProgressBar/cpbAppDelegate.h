#import <UIKit/UIKit.h>

@class CircleProgressBarView;

@interface cpbAppDelegate : UIResponder <UIApplicationDelegate> {
    CircleProgressBarView *_cpb;
}
@property (nonatomic, retain) CircleProgressBarView *cpb;
@property (strong, nonatomic) UIWindow *window;
@end
