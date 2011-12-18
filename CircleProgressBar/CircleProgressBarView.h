//
//  CircleProgressBarView.h
//  CircleProgressBar
//
//  Created by 和史 大谷 on 11/12/18.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleProgressBarView : UIView {
    // 0%時点の角度
    CGFloat _startAngle;
    // 100%時点のstartAngleからの角度
    CGFloat _maxAngle;
    
    // 0%時点の値
    CGFloat _progressValueMin;
    // 100%時点の値
    CGFloat _progressValueMax;
    // 現時点の値
    CGFloat _progressValue;
    
    
    // プログレスバーの太さ(外径から内側にかけての長さ)
    CGFloat _width;
    // 外径
    CGFloat _radius;
    // 中心座標
    CGPoint _centerPoint;
    
    // 輪郭線の色
    UIColor *_borderColor;
    // 輪郭線の太さ
    CGFloat _borderWidth;
    // 塗り潰しの色
    UIColor *_fillColor;
}
@property (nonatomic, assign) CGFloat startAngle;
@property (nonatomic, assign) CGFloat maxAngle;
@property (nonatomic, assign) CGFloat progressValueMax;
@property (nonatomic, assign) CGFloat progressValueMin;
@property (nonatomic, assign) CGFloat progressValue;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat radius;
@property (nonatomic, assign) CGPoint centerPoint;
@property (nonatomic, retain) UIColor *borderColor;
@property (nonatomic, assign) CGFloat borderWidth;
@property (nonatomic, retain) UIColor *fillColor;

-(void)setProgressValue:(CGFloat)progressValue withAnimation:(BOOL)animation;
@end
