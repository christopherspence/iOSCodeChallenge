//
//  Entities.h
//  ChaiOneCodeChallenge
//
//  Created by Christopher Spence on 1/15/14.
//  Copyright (c) 2014 Christopher Spence. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Entities : NSObject

@property (nonatomic, strong) NSArray *mentions;
@property (nonatomic, strong) NSArray *hashtags;
@property (nonatomic, strong) NSArray *links;

@end
