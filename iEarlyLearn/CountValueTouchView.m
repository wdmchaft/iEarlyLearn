//
//  CountValueTouchView.m
//  iEarlyLearn
//
//  Created by Sathish Jayapal on 6/14/11.
//  Copyright 2011 SKMINFOTECH. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "CountValueTouchView.h"
#import "RootViewController.h"


@implementation CountValueTouchView
#define GROW_ANIMATION_DURATION_SECONDS 0.15    // Determines how fast a piece 
                                                //size grows when it is moved.
#define SHRINK_ANIMATION_DURATION_SECONDS 0.15  // Determines how fast a piece 
                                    //size shrinks when a piece stops moving.
@synthesize nameField=_nameField;
@synthesize moveOn=_moveOn;
@synthesize rootView=_rootView;
@synthesize picture1=_picture1;
@synthesize picture2=_picture2;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}
-(IBAction)pushAnotherView{
    _rootView=[[RootViewController alloc]init];
    [[self navigationController ] pushViewController:_rootView animated:YES];
    [_rootView release];
    
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [_nameField release];
    [_moveOn release];
    [_picture1 release];
    [_picture2 release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma Touch Event Code

//Everything starts by touching. Method is called when something is touched
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //   NSUInteger numTaps = [[touches anyObject] tapCount];
    _nameField.text =@"Comming here";
    NSUInteger touchCount = 0;
    for (UITouch *touch in touches) {
        // Send to the dispatch method, which will make sure the appropriate 
        //subview is acted upon
        [self dispatchFirstTouchAtPoint:[touch locationInView:self.view] 
                               forEvent:nil];
        touchCount++;  
    }   
}
//Dispatch First Event- Invoked when a Picture is touched.
-(void)dispatchFirstTouchAtPoint:(CGPoint)touchPoint forEvent:(UIEvent *)event
{
    if (CGRectContainsPoint([_picture1 frame], touchPoint)) {
        _nameField.text =@"1";
         [self animateFirstTouchAtPoint:touchPoint forView:_picture1];
    }
    if (CGRectContainsPoint([_picture2 frame], touchPoint)) {
        _nameField.text =@"2";
        [self animateFirstTouchAtPoint:touchPoint forView:_picture2];
    }
}

//Dispatch touch Event- TBD when to be called.

-(void)dispatchTouchEvent:(UIView *)theView toPosition:(CGPoint)position
{
    // Check to see which view, or views,  the point is in and then move 
    // to that position.
    if (CGRectContainsPoint([picture1 frame], position)) {
        _nameField.text =@"Touched picture1";
        picture1.center = position;
    } 
    
}
// Handles the end of a touch event.
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    // Enumerates through all touch object
    for (UITouch *touch in touches) {
        // Sends to the dispatch method, which will make sure the appropriate subview is acted upon
        [self dispatchTouchEndEvent:[touch view] toPosition:[touch locationInView:self.view]];
    }
}

// Scales up a view slightly which makes the piece slightly larger, as if it is being picked up by the user.
-(void)animateFirstTouchAtPoint:(CGPoint)touchPoint forView:(UIImageView *)theView 
{
    // Pulse the view by scaling up, then move the view to under the finger.
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:GROW_ANIMATION_DURATION_SECONDS];
    theView.transform = CGAffineTransformMakeScale(2.1, 2.1);
    [UIView commitAnimations];
}
// Scales down the view and moves it to the new position. 
-(void)animateView:(UIView *)theView toPosition:(CGPoint)thePosition
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:SHRINK_ANIMATION_DURATION_SECONDS];
    // Set the center to the final postion
    //theView.center = thePosition;
    // Set the transform back to the identity, thus undoing the previous scaling effect.
    theView.transform = CGAffineTransformIdentity;
    [UIView commitAnimations];  
}
-(void)dispatchTouchEndEvent:(UIView *)theView toPosition:(CGPoint)position
{   
    // Check to see which view, or views,  the point is in and then animate to that position.
	//_nameField.text = @"Phase: End Event";
    if (CGRectContainsPoint([_picture1 frame], position)) {
        [self animateView:_picture1 toPosition: position];
    } 
    if (CGRectContainsPoint([_picture2 frame], position)) {
        [self animateView:_picture2 toPosition: position];
    } 
}
@end
