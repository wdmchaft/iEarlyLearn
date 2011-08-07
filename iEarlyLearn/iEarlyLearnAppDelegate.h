//
//  iEarlyLearnAppDelegate.h
//  iEarlyLearn
//
//  Created by Sathish Jayapal on 6/11/11.
//  Copyright 2011 SKMINFOTECH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iEarlyLearnAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end
