//
//  PostRepository.h
//  ChaiOneCodeChallenge
//
//  Created by Christopher Spence on 1/17/14.
//  Copyright (c) 2014 Christopher Spence. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Post;

@interface PostRepository : NSObject

+ (PostRepository *)sharedPostRepository;

- (void)get:(NSString *)id complete:(void (^)(Post *post))complete;

- (void)getAll:(void (^)(NSArray *posts))complete;

- (void)add:(Post *)post complete:(void(^)(void))complete;

- (void)modify:(Post *)post complete:(void(^)(void))complete;

- (void)remove:(Post *)post complete:(void(^)(void))complete;

@end
