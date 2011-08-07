//
//  DragViews.h
//  iEarlyLearn
//
//  Created by Sathish Jayapal on 7/27/11.
//  Copyright 2011 SKMINFOTECH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DragViews : UIViewController <UIGestureRecognizerDelegate> {

//    IBOutlet UIImageView *picture1;
    BOOL piecesOnTop;
    CGPoint startTouchPosition; 
    
}
    
@property (nonatomic, retain) IBOutlet UIImageView *picture1;
@property (nonatomic, retain) IBOutlet UIImageView *picture2;
@property (nonatomic, retain) IBOutlet UIImageView *picture3;
@property (nonatomic, retain) IBOutlet UIImageView *picture4;
@property (nonatomic, retain) IBOutlet UIImageView *picture5;
@property (nonatomic, retain) IBOutlet UIImageView *picture6;

-(void)animateFirstTouchAtPoint:(CGPoint)touchPoint forView:(UIImageView *)theView;
-(void)animateView:(UIView *)theView toPosition:(CGPoint) thePosition;
-(void)dispatchFirstTouchAtPoint:(CGPoint)touchPoint forEvent:(UIEvent *)event;
-(void)dispatchTouchEvent:(UIView *)theView toPosition:(CGPoint)position 
                                                fromPosition:(CGPoint)position;
-(void)dispatchTouchEndEvent:(UIView *)theView toPosition:(CGPoint)position
                                                fromPosition:(CGPoint)position;
@end

