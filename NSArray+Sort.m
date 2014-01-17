//
//  NSArray+Sort.m
//  ChaiOneCodeChallenge
//
//  Created by Christopher Spence on 1/17/14.
//  Copyright (c) 2014 Christopher Spence. All rights reserved.
//

#import "NSArray+Sort.h"

@implementation NSArray (Sort)


- (NSArray *)sortedByProperty:(NSString *)property ascending:(BOOL)ascending
{
    NSSortDescriptor *dateDescriptor = [NSSortDescriptor
                                        sortDescriptorWithKey:property
                                        ascending:ascending];
    NSArray *sortDescriptors = [NSArray arrayWithObject:dateDescriptor];
    NSArray *sortedArray = [self sortedArrayUsingDescriptors:sortDescriptors];

    return sortedArray;
}

@end
