//
//  User.h
//  ChaiOneCodeChallenge
//
//  Created by Christopher Spence on 1/16/14.
//  Copyright (c) 2014 Christopher Spence. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class AvatarImage, Counts, CoverImage, Description, Post;

@interface User : NSManagedObject

@property (nonatomic, retain) NSString *canonicalUrl;
@property (nonatomic, retain) NSDate *date;
@property (nonatomic, retain) NSString *id;
@property (nonatomic, retain) NSString *locale;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *timezone;
@property (nonatomic, retain) NSString *type;
@property (nonatomic, retain) NSString *username;

@property (nonatomic, retain) AvatarImage *avatarImage;
@property (nonatomic, retain) Counts *counts;
@property (nonatomic, retain) Description *desc;
@property (nonatomic, retain) Post *post;
@property (nonatomic, retain) CoverImage *coverImage;

@end
