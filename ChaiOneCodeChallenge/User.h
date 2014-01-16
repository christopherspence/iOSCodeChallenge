//
//  User.h
//  ChaiOneCodeChallenge
//
//  Created by Christopher Spence on 1/15/14.
//  Copyright (c) 2014 Christopher Spence. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AvatarImage, Description, CoverImage, Counts;

@interface User : NSObject

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) AvatarImage *avatarImage;
@property (nonatomic, strong) Description *description;
@property (nonatomic, strong) NSString *local;
@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic, strong) NSString *canonicalUrl;
@property (nonatomic, strong) CoverImage *coverImage;
@property (nonatomic, strong) NSString *timezone;
@property (nonatomic, strong) Counts *counts;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *name;

@end
