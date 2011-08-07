//
//  CountValueTouchView.h
//  iEarlyLearn
//
//  Created by Sathish Jayapal on 6/14/11.
//  Copyright 2011 SKMINFOTECH. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;
@interface CountValueTouchView : UIViewController <UIGestureRecognizerDelegate>{
    
    IBOutlet UITextField *nameField;
    IBOutlet UIButton *moveOn;
    IBOutlet UIImageView *picture1;
    IBOutlet UIImageView *picture2;  
}
@property (nonatomic,retain) IBOutlet UIImageView *picture1;
@property (nonatomic,retain) IBOutlet UIImageView *picture2;
@property(nonatomic,retain) UITextField *nameField;
@property(nonatomic,retain) UIButton *moveOn;
@property(nonatomic,retain) RootViewController *rootView;
-(void)animateFirstTouchAtPoint:(CGPoint)touchPoint forView:(UIImageView *)theView;
-(void)animateView:(UIView *)theView toPosition:(CGPoint) thePosition;
-(void)dispatchFirstTouchAtPoint:(CGPoint)touchPoint forEvent:(UIEvent *)event;
-(void)dispatchTouchEvent:(UIView *)theView toPosition:(CGPoint)position;
-(void)dispatchTouchEndEvent:(UIView *)theView toPosition:(CGPoint)position;
-(IBAction)pushAnotherView;

@end
