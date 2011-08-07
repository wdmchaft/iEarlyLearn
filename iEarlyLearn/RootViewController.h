//
//  RootViewController.h
//  iEarlyLearn
//
//  Created by Sathish Jayapal on 6/11/11.
//  Copyright 2011 SKMINFOTECH. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>
@class CountValueTouchView;
@class DragViews;
@interface RootViewController : UITableViewController <NSFetchedResultsControllerDelegate> {
   

}

@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain) NSArray *dataStr;
@property (nonatomic, retain) CountValueTouchView *detailViewController;
@property (nonatomic, retain) DragViews *dragView;
@end
