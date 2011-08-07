//
//  DragViews.m
//  iEarlyLearn
//
//  Created by Sathish Jayapal on 7/27/11.
//  Copyright 2011 SKMINFOTECH. All rights reserved.
//

#import "DragViews.h"

@implementation DragViews
#define GROW_ANIMATION_DURATION_SECONDS 0.15    // Determines how fast a piece size grows when it is moved.
#define SHRINK_ANIMATION_DURATION_SECONDS 0.15  // Determines how fast a piece size shrinks when a piece stops moving.
@synthesize picture1=_picture1,picture2=_picture2,picture3=_picture3,picture4
            =_picture4,picture5=_picture5,picture6=_picture6;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
#pragma mark -
#pragma mark === Touch handling  ===
#pragma mark
// Handles the start of a touch
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSUInteger touchCount = 0;
    startTouchPosition= _picture4.center;
//	NSUInteger numTaps = [[touches anyObject] tapCount];
    if (piecesOnTop) {
        if (_picture2.center.x == _picture4.center.x)
            _picture4.center = CGPointMake(_picture4.center.x - 50, _picture4.center.y - 50);	
    }
	for (UITouch *touch in touches) {
		[self dispatchFirstTouchAtPoint:[touch locationInView:self.view] forEvent:nil];
        touchCount++;
	}	
}


// Handles the continuation of a touch.
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{  
	
	NSUInteger touchCount = 0;
	// Enumerates through all touch objects
	for (UITouch *touch in touches) {
		// Send to the dispatch method, which will make sure the appropriate subview is acted upon
		[self dispatchTouchEvent:[touch view] toPosition:[touch locationInView:[self view]]
                    fromPosition:[touch locationInView:[self view]]];
		touchCount++;
	}

}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	// Enumerates through all touch object
	for (UITouch *touch in touches) 
        [self dispatchTouchEndEvent:[touch view] toPosition:[touch
                                locationInView:[self view]]fromPosition:
         [touch previousLocationInView
          :[self view]]];
}

// Checks to see which view, or views, the point is in and then sets the center of each moved view to the new postion.
// If views are directly on top of each other, they move together.
-(void)dispatchTouchEvent:(UIView *)theView toPosition:(CGPoint)position 
                    fromPosition:(CGPoint)fromposition
{
	// Check to see which view, or views,  the point is in and then move to that position.
	if (CGRectContainsPoint([_picture4 frame], position)) {
		_picture4.center = position;
	}
	
}

-(void)dispatchFirstTouchAtPoint:(CGPoint)touchPoint forEvent:(UIEvent *)event{
    if (CGRectContainsPoint([_picture4 frame], touchPoint)) {
		[self animateFirstTouchAtPoint:touchPoint forView:_picture4];
    }
//    if (CGRectContainsPoint([_picture2 frame], touchPoint)) {
//		[self animateFirstTouchAtPoint:touchPoint forView:_picture2];
//    }
}

-(void)dispatchTouchEndEvent:(UIView *)theView toPosition:(CGPoint)position
                                        fromPosition:(CGPoint)fromposition
{   
	// Check to see which view, or views,  the point is in and then animate to that position.
	if (CGRectContainsPoint([_picture4 frame], position)) {
		[self animateView:_picture4 toPosition: position];
	} 
    
	// If one piece obscures another, display a message so the user can move the pieces apart
	if (_picture4.center.x== _picture2.center.x) {
		NSLog(@"Double tap the background to move the pieces apart.");
		piecesOnTop = YES;
	} else {
        [self animateView:_picture4 toPosition: startTouchPosition];
		piecesOnTop = NO;
	}
}


-(void)animateFirstTouchAtPoint:(CGPoint)touchPoint forView:(UIImageView *)theView{
    [UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:GROW_ANIMATION_DURATION_SECONDS];
    theView.transform = CGAffineTransformMakeScale(1.5, 1.5);
    [UIView commitAnimations];
}
-(void)animateView:(UIView *)theView toPosition:(CGPoint) thePosition{
    [UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:SHRINK_ANIMATION_DURATION_SECONDS];
	// Set the center to the final postion
	theView.center = thePosition;
	// Set the transform back to the identity, thus undoing the previous scaling effect.
	theView.transform = CGAffineTransformIdentity;
	[UIView commitAnimations];
}

@end
