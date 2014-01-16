//
//  Mention.h
//  ChaiOneCodeChallenge
//
//  Created by Christopher Spence on 1/15/14.
//  Copyright (c) 2014 Christopher Spence. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Mention : NSObject

@property (nonatomic) BOOL isLeading;
@property (nonatomic) int position;
@property (nonatomic, strong) NSString *id;
@property (nonatomic) int length;
@property (nonatomic, strong) NSString *name;

@end
