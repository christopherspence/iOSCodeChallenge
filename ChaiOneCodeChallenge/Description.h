//
//  Description.h
//  ChaiOneCodeChallenge
//
//  Created by Christopher Spence on 1/15/14.
//  Copyright (c) 2014 Christopher Spence. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Entities;

@interface Description : NSObject

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) Entities *entities;

@end
