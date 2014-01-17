//
//  Post.h
//  ChaiOneCodeChallenge
//
//  Created by Christopher Spence on 1/16/14.
//  Copyright (c) 2014 Christopher Spence. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Entities, Source, User;

@interface Post : NSManagedObject

@property (nonatomic, retain) NSString *canonicalUrl;
@property (nonatomic, retain) NSString *createdAt;
@property (nonatomic, retain) NSString *html;
@property (nonatomic, retain) NSString *id;
@property (nonatomic, retain) NSNumber *machineOnly;
@property (nonatomic, retain) NSNumber *numberOfReplies;
@property (nonatomic, retain) NSString *numberOfReposts;
@property (nonatomic, retain) NSNumber *numberOfStars;
@property (nonatomic, retain) NSString *paginationId;
@property (nonatomic, retain) NSString *text;
@property (nonatomic, retain) NSString *threadId;
@property (nonatomic, retain) Entities *entities;
@property (nonatomic, retain) Source *source;
@property (nonatomic, retain) User *user;

@end
