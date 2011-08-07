//
//  CourseView.h
//  iEarlyLearn
//
//  Created by Sathish Jayapal on 6/19/11.
//  Copyright 2011 SKMINFOTECH. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CourseView : UIView {
    IBOutlet UIImageView *picture1;
    IBOutlet UIImageView *picture2;  
}
@property (nonatomic,retain) IBOutlet UIImageView *picture1;
@property (nonatomic,retain) IBOutlet UIImageView *picture2;
@end
