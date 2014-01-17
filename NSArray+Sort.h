//
//  NSArray+Sort.h
//  ChaiOneCodeChallenge
//
//  Created by Christopher Spence on 1/17/14.
//  Copyright (c) 2014 Christopher Spence. All rights reserved.
//

#import "NSArray+Sort.h"

@interface NSArray (Sort)

- (NSArray *)sortedByProperty:(NSString *)property ascending:(BOOL)ascending;

@end
