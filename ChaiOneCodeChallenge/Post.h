//
//  Post.h
//  ChaiOneCodeChallenge
//
//  Created by Christopher Spence on 1/15/14.
//  Copyright (c) 2014 Christopher Spence. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Source, Entities, User;

@interface Post : NSObject

@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic) int numberOfStars;
@property (nonatomic) int numberOfReplies;
@property (nonatomic, strong) Source *source;
@property (nonatomic, strong) NSString *text;
@property (nonatomic) int numberOfReposts;
@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *canonicalUrl;
@property (nonatomic, strong) Entities *entities;
@property (nonatomic, strong) NSString *html;
@property (nonatomic) BOOL machineOnly;
@property (nonatomic, strong) User *user;
@property (nonatomic, strong) NSString *threadId;
@property (nonatomic, strong) NSString *paginationId;

@end
