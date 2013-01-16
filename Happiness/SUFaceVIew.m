//
//  SUFaceView.m
//  Happiness
//
//  Created by SunnyUp on 13-1-16.
//  Copyright (c) 2013年 SunnyUp. All rights reserved.
//

#import "SUFaceView.h"

@implementation SUFaceView

- (void)setup
{
    self.contentMode = UIViewContentModeRedraw;
}

- (void)awakeFromNib
{
    [self setup];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)drawCircleAtPoint:(CGPoint)pt
               withRadius:(CGFloat) radius
                inContext:(CGContextRef) context
{
    UIGraphicsPushContext(context);
    CGContextBeginPath(context);
    CGContextAddArc(context, pt.x, pt.y, radius, 0, 2*M_PI, YES);
    CGContextStrokePath(context);
    
    UIGraphicsPopContext();
}

#define DEFAULT_SCALE 0.90

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGPoint midPoint;
    midPoint.x = self.bounds.origin.x + self.bounds.size.width/2;
    midPoint.y = self.bounds.origin.y + self.bounds.size.height/2;
    
    CGFloat size = self.bounds.size.width / 2;
    if(self.bounds.size.width > self.bounds.size.height)
        size = self.bounds.size.height / 2;
    size *= DEFAULT_SCALE;
    
    CGContextSetLineWidth(context, 5.0);
    [[UIColor blueColor] setStroke];
    
    // draw face (circle)
    [self drawCircleAtPoint:midPoint withRadius:size inContext:context];
    // draw eyse (2 circles)
    // no nose
    // draw mouth
}

@end
