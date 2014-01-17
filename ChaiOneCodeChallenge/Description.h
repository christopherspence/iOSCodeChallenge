//
//  Description.h
//  ChaiOneCodeChallenge
//
//  Created by Christopher Spence on 1/16/14.
//  Copyright (c) 2014 Christopher Spence. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Entities;

@interface Description : NSManagedObject

@property (nonatomic, retain) NSString *html;
@property (nonatomic, retain) NSString *text;
@property (nonatomic, retain) Entities *entities;

@end
