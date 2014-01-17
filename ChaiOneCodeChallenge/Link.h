//
//  Link.h
//  ChaiOneCodeChallenge
//
//  Created by Christopher Spence on 1/16/14.
//  Copyright (c) 2014 Christopher Spence. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Entities;

@interface Link : NSManagedObject

@property (nonatomic, retain) NSNumber *length;
@property (nonatomic, retain) NSNumber *position;
@property (nonatomic, retain) NSString *text;
@property (nonatomic, retain) NSString *url;
@property (nonatomic, retain) Entities *entities;

@end
