//
//  iEarlyImageCache.h
//  iEarlyLearn
//
//  Created by Sathish Jayapal on 6/18/11.
//  Copyright 2011 SKMINFOTECH. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface iEarlyImageCache : NSObject {
    NSMutableDictionary *dictonary;
}
+(iEarlyImageCache *)sharedImageCache;
-(void)setImage:(UIImage *)i forKey:(NSString *)s;
-(UIImage *)imageForKey:(NSString *)s;
-(void)deleteImageForKey:(NSString *)s;
@end
