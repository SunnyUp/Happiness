//
//  SUViewController.m
//  Happiness
//
//  Created by SunnyUp on 13-1-16.
//  Copyright (c) 2013年 SunnyUp. All rights reserved.
//

#import "SUViewController.h"
#import "SUFaceView.h"

@interface SUViewController () <SUFaceViewDataSource>
@property (nonatomic, weak) IBOutlet SUFaceView *faceView; 
@end

@implementation SUViewController

@synthesize happiness = _happiness;
@synthesize faceView = _faceView;

- (void)setHappiness:(int)happiness
{
    _happiness = happiness;
    
    [self.faceView setNeedsDisplay];
}

- (void)setFaceView:(SUFaceView *)faceView
{
    _faceView = faceView;
    
    [self.faceView addGestureRecognizer:[[UIPinchGestureRecognizer alloc] initWithTarget:self.faceView action:@selector(pinch:)]];
    
    self.faceView.dataSource = self;
    [self.faceView addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(changeHappiness:)]];
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAllButUpsideDown;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return (toInterfaceOrientation != UIInterfaceOrientationMaskPortraitUpsideDown);
}

- (float)smileForFaceView:(SUFaceView *)sender
{
    return (self.happiness - 50) / 50.0; 
}

- (void)changeHappiness:(UIPanGestureRecognizer *)gesture
{
    if(gesture.state == UIGestureRecognizerStateChanged || gesture.state == UIGestureRecognizerStateEnded)
    {
        CGPoint transilation = [gesture translationInView:self.faceView];
        self.happiness -= transilation.y/3.5;
        [gesture setTranslation:CGPointZero inView:self.faceView];
    }
}

@end
