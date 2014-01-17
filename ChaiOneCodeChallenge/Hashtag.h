//
//  Hashtag.h
//  ChaiOneCodeChallenge
//
//  Created by Christopher Spence on 1/16/14.
//  Copyright (c) 2014 Christopher Spence. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Entities;

@interface Hashtag : NSManagedObject

@property (nonatomic, retain) NSNumber *length;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSNumber *position;
@property (nonatomic, retain) Entities *entities;

@end
