//
//  Meta.h
//  ChaiOneCodeChallenge
//
//  Created by Christopher Spence on 1/16/14.
//  Copyright (c) 2014 Christopher Spence. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Meta : NSManagedObject

@property (nonatomic, retain) NSNumber *code;
@property (nonatomic, retain) NSString *maxId;
@property (nonatomic, retain) NSString *minId;
@property (nonatomic, retain) NSNumber *more;

@end
