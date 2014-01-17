//
//  PostRepository.m
//  ChaiOneCodeChallenge
//
//  Created by Christopher Spence on 1/17/14.
//  Copyright (c) 2014 Christopher Spence. All rights reserved.
//

#import "PostRepository.h"

#import "NSArray+Sort.h"

@implementation PostRepository

static PostRepository *_sharedPostRepository;

+ (PostRepository *)sharedPostRepository
{
    if (!_sharedPostRepository)
        _sharedPostRepository = [[PostRepository alloc] init];
    
    return _sharedPostRepository;
}

- (void)get:(NSString *)id complete:(void (^)(Post *post))complete
{
    [NSException exceptionWithName:@"NotImplemented" reason:@"Not Implemented Yet" userInfo:nil];
}

- (void)getAll:(void (^)(NSArray *posts))complete
{
    [[RKObjectManager sharedManager] getObjectsAtPath:@"posts/stream/global" parameters:nil success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        
        NSArray *sortedArray = [[mappingResult array] sortedByProperty:@"createdAt" ascending:NO];
        
        complete(sortedArray);
        
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
    }];
}

- (void)add:(Post *)post complete:(void (^)(void))complete
{
    [NSException exceptionWithName:@"NotImplemented" reason:@"Not Implemented Yet" userInfo:nil];
}

- (void)modify:(Post *)post complete:(void (^)(void))complete
{
    [NSException exceptionWithName:@"NotImplemented" reason:@"Not Implemented Yet" userInfo:nil];
}

- (void)remove:(Post *)post complete:(void (^)(void))complete
{
    [NSException exceptionWithName:@"NotImplemented" reason:@"Not Implemented Yet" userInfo:nil];
}

@end
