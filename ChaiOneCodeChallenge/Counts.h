//
//  Counts.h
//  ChaiOneCodeChallenge
//
//  Created by Christopher Spence on 1/16/14.
//  Copyright (c) 2014 Christopher Spence. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class User;

@interface Counts : NSManagedObject

@property (nonatomic, retain) NSNumber *followers;
@property (nonatomic, retain) NSNumber *following;
@property (nonatomic, retain) NSNumber *posts;
@property (nonatomic, retain) NSNumber *stars;
@property (nonatomic, retain) User *user;

@end
