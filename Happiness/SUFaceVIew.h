//
//  SUFaceView.h
//  Happiness
//
//  Created by SunnyUp on 13-1-16.
//  Copyright (c) 2013年 SunnyUp. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SUFaceView;

@protocol SUFaceViewDataSource

- (float)smileForFaceView:(SUFaceView *)sender;

@end


@interface SUFaceView : UIView

@property (nonatomic) CGFloat scale;
@property (nonatomic, weak) IBOutlet  id<SUFaceViewDataSource> dataSource;
- (void)pinch:(UIPinchGestureRecognizer *)gesture;

@end
