//
//  CourseView.m
//  iEarlyLearn
//
//  Created by Sathish Jayapal on 6/19/11.
//  Copyright 2011 SKMINFOTECH. All rights reserved.
//

#import "CourseView.h"


@implementation CourseView
@synthesize picture1=_picture1;
@synthesize picture2=_picture2;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)dealloc
{
    [super dealloc];
}

@end
