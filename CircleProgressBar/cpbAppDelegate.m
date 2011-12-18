#import "cpbAppDelegate.h"
#import "CircleProgressBarView.h"

@implementation cpbAppDelegate
@synthesize cpb = _cpb;
@synthesize window = _window;

- (void)dealloc
{
    self.cpb = nil;
    [_window release];
    [super dealloc];
}

-(void)click:(id)arg
{
    [self.cpb setProgressValue:100 withAnimation:YES];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    self.window.backgroundColor = [UIColor whiteColor];
    
    CircleProgressBarView *cpb = [[[CircleProgressBarView alloc] initWithFrame:self.window.frame] autorelease];
    [self.window addSubview:cpb];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(0, 20, 100, 30);
    [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"push to start" forState:UIControlStateNormal];
    [self.window addSubview:button];
    self.cpb = cpb;
    
    [self.window makeKeyAndVisible];
    return YES;
}
@end
