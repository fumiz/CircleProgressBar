#import "CircleProgressBarView.h"

static inline float radians(double degrees) { return degrees * M_PI / 180.0; }

@interface CircleProgressBarView()
- (CGFloat)calcProgress;
- (CGFloat)calcEndAngle;
@end

@implementation CircleProgressBarView
@synthesize startAngle = _startAngle;
@synthesize maxAngle = _maxAngle;
@synthesize progressValueMax = _progressValueMax;
@synthesize progressValue = _progressValue;
@synthesize progressValueMin = _progressValueMin;
@synthesize width = _width;
@synthesize radius = _radius;
@synthesize centerPoint = _centerPoint;
@synthesize borderColor = _borderColor;
@synthesize borderWidth = _borderWidth;
@synthesize fillColor = _fillColor;

- (void)dealloc
{
    self.borderColor = nil;
    self.fillColor = nil;
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        self.startAngle = -90;
        self.maxAngle = 180;
        self.progressValueMin = 0;
        self.progressValueMax = 100;
        self.progressValue = 50;
        
        self.width = 20.0f;
        self.radius = 100.0f;
        self.centerPoint = CGPointMake(CGRectGetWidth(self.bounds) / 2.0, CGRectGetHeight(self.bounds) / 2.0);
        
        self.borderColor = [UIColor grayColor];
        self.borderWidth = 5.0f;
        self.fillColor = [UIColor greenColor];
    }
    return self;
}

-(void)animate:(CGFloat)value finishValue:(CGFloat)finishValue {
    [UIView animateWithDuration:10.0f
                          delay:1.0f
                        options:UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionCurveLinear
                     animations:^{
                         if (value > finishValue) {
                             return;
                         } else {
                             [self setProgressValue:value];
                             [self animate:value+1 finishValue:finishValue];
                         }
                     }
                     completion:^(BOOL finished) {
                         NSLog(@"こーるどc");
                     }];
}

-(void)setProgressValue:(CGFloat)progressValue withAnimation:(BOOL)animation {
    if (!animation) {
        self.progressValue = progressValue;
        return;
    }
    [self animate:self.progressValue finishValue:progressValue];
}

-(void)setProgressValue:(CGFloat)progressValue {
    _progressValue = progressValue;
    [self setNeedsDisplay];
}

- (CGFloat)calcProgress {
    // 基準値の計算
    CGFloat baseValue = self.progressValueMax - self.progressValueMin;
    // 基準現在値の計算
    CGFloat baseCurrentValue = self.progressValue - self.progressValueMin;
    // 現在の進捗を計算
    CGFloat progress = baseCurrentValue / baseValue;

    return progress;
}

- (CGFloat)calcEndAngle {
    CGFloat progress = [self calcProgress];
    return self.startAngle + (progress * self.maxAngle);
}

- (void)drawRect:(CGRect)rect
{
    // 基本属性
    // 外径
    CGFloat radius = self.radius;
    // 内側に向かう太さ
    CGFloat width = self.width;
    
    // 中心座標
    CGFloat centerX = self.centerPoint.x;
    CGFloat centerY = self.centerPoint.y;
    
    // 角度設定(radian)
    // 開始角
    CGFloat startAngleR = radians(self.startAngle);
    // 終了角
    CGFloat endAngleR = radians([self calcEndAngle]);
    
    // コンテキストの取得
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 現在のコンテキストを保持
    CGContextSaveGState(context);
    
    //##### 描画属性を設定
    // 線の太さ
    CGContextSetLineWidth(context, self.borderWidth);
    /*
    // 線の色
    CGContextSetRGBStrokeColor(context, 0.4,0.4,0.4,0.9);
    // 塗りつぶしの色
    CGContextSetRGBFillColor(context, 1, 0.5, 0.5, 1.0);
    */
    [self.borderColor set];
    [self.fillColor setFill];
    
    //##### パスを作る
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddArc(path, NULL, centerX, centerY, radius, startAngleR, endAngleR, 0);
    CGPathAddArc(path, NULL, centerX, centerY, radius - width, endAngleR, startAngleR, 1);
    CGPathCloseSubpath(path);
    
    // 描画する
    CGContextAddPath(context, path);
    CGContextDrawPath(context, kCGPathFillStroke);
    
    // 解放処理
    CGPathRelease(path);
    CGContextRestoreGState(context);
}
@end
