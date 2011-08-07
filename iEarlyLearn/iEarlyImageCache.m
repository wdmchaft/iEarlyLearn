//
//  iEarlyImageCache.m
//  iEarlyLearn
//
//  Created by Sathish Jayapal on 6/18/11.
//  Copyright 2011 SKMINFOTECH. All rights reserved.
//

#import "iEarlyImageCache.h"
static iEarlyImageCache *sharedImageCache;

@implementation iEarlyImageCache
-(id) init
{
    [super init];
    dictonary=[[NSMutableDictionary alloc ]init];
    return self;
}
-(void)setImage:(UIImage *)i forKey:(NSString *)s{
    [dictonary setObject:i forKey:s];
}
-(UIImage *)imageForKey:(NSString *)s{
    return [dictonary objectForKey:s];
    
}
-(void)deleteImageForKey:(NSString *)s{
    [dictonary removeObjectForKey:s];
}
#pragma mark singleton stuff
+(iEarlyImageCache *)sharedImageCache{
    if (!sharedImageCache) {
        sharedImageCache=[[iEarlyImageCache alloc]init];
    }
    return sharedImageCache;
    return nil;
}
+(id) allocWithZone:(NSZone *)zone{
    if (!sharedImageCache) {
        sharedImageCache=[super allocWithZone:zone];
        return sharedImageCache;
    }else{
        return nil;
    }
}
-(id)copyWithZone:(NSZone *)zone{
    return self;
}
-(void)release{
    //NO Operation Yet.
}
@end
