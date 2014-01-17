//
//  SettingsRepository.h
//  ChaiOneCodeChallenge
//
//  Created by Christopher Spence on 1/16/14.
//  Copyright (c) 2014 Christopher Spence. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingsRepository : NSObject

+ (SettingsRepository *)sharedSettingsRepository;

- (NSString *)get:(NSString *)key;

@end
