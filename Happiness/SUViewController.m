//
//  SUViewController.m
//  Happiness
//
//  Created by SunnyUp on 13-1-16.
//  Copyright (c) 2013年 SunnyUp. All rights reserved.
//

#import "SUViewController.h"
#import "SUFaceView.h"

@interface SUViewController ()
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

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAllButUpsideDown;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return (toInterfaceOrientation != UIInterfaceOrientationMaskPortraitUpsideDown);
}

@end
