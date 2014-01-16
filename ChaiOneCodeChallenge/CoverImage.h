//
//  CoverImage.h
//  ChaiOneCodeChallenge
//
//  Created by Christopher Spence on 1/16/14.
//  Copyright (c) 2014 Christopher Spence. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoverImage : NSObject

@property (nonatomic, strong) NSString *url;
@property (nonatomic) int width;
@property (nonatomic) BOOL isDefault;
@property (nonatomic) int height;

@end
