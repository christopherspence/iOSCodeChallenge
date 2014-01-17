//
//  AvatarImage.h
//  ChaiOneCodeChallenge
//
//  Created by Christopher Spence on 1/16/14.
//  Copyright (c) 2014 Christopher Spence. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class User;

@interface AvatarImage : NSManagedObject

@property (nonatomic, retain) NSNumber *height;
@property (nonatomic, retain) NSString *isDefault;
@property (nonatomic, retain) NSNumber *url;
@property (nonatomic, retain) NSNumber *width;
@property (nonatomic, retain) User *user;

@end
