//
//  SettingsRepository.cs
//  ChaiOneCodeChallenge
//
//  Created by Christopher Spence on 1/16/14.
//  Copyright (c) 2014 Christopher Spence. All rights reserved.
//

#import "SettingsRepository.h"

@interface SettingsRepository()

@property (nonatomic, strong) NSDictionary *settingsContents;

@end

@implementation SettingsRepository

static SettingsRepository* _sharedSettingsRepository;

+ (SettingsRepository *)sharedSettingsRepository
{
    if (!_sharedSettingsRepository)
        _sharedSettingsRepository = [[SettingsRepository alloc] init];
    
    return _sharedSettingsRepository;
}

- (id)objectForKey:(NSString *)key
{
    if (self.settingsContents.count == 0) {
        NSBundle *bundle = [NSBundle mainBundle];
        NSURL *plistURL = [bundle URLForResource:@"Settings" withExtension:@"plist"];
        
        self.settingsContents = [NSDictionary dictionaryWithContentsOfURL:plistURL];
    }
    
    return [self.settingsContents objectForKey:key];
    
}

- (NSString *)stringForKey:(NSString *)key
{
    return (NSString *)[self objectForKey:key];
}

- (NSString *)serviceUrl
{
    return [self stringForKey:@"ServiceUrl"];
}

@end
