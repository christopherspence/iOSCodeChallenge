//
//  RestKit.m
//  ChaiOneCodeChallenge
//
//  Created by Christopher Spence on 1/16/14.
//  Copyright (c) 2014 Christopher Spence. All rights reserved.
//

#import <RestKit/RestKit.h>


#import "RestKit.h"
#import "SettingsRepository.h"

#import "Meta.h"
#import "Post.h"
#import "Source.h"
#import "Entities.h"
#import "Mention.h"
#import "Hashtag.h"
#import "Link.h"
#import "User.h"
#import "AvatarImage.h"
#import "Description.h"
#import "CoverImage.h"
#import "Counts.h"

@interface RestKit ()

@property (nonatomic, strong) RKObjectManager *objectManager;

- (void)setupErrorMapping;

- (void)setupDataMapping;

- (RKEntityMapping *)metaMapping;
- (RKEntityMapping *)postMapping;

// Relationships to post
- (RKEntityMapping *)sourceMapping;
- (RKEntityMapping *)entitiesMapping;
- (RKEntityMapping *)userMapping;

// Relationships to entities
- (RKEntityMapping *)mentionsMapping;
- (RKEntityMapping *)hashtagsMapping;
- (RKEntityMapping *)linksMapping;

// Relationships to user
- (RKEntityMapping *)avatarImageMapping;
- (RKEntityMapping *)descriptionMapping;
- (RKEntityMapping *)coverImageMapping;
- (RKEntityMapping *)countsMapping;

@end

@implementation RestKit

static RestKit *_sharedRestKit;

+ (RestKit *)sharedRestKit
{
    if (!_sharedRestKit)
        _sharedRestKit = [[RestKit alloc] init];
    
    return _sharedRestKit;
}

- (void)setup
{
    // Get the service url from settings.plist
    NSString *serviceUrl = [[SettingsRepository sharedSettingsRepository] serviceUrl];
    
    self.objectManager = [RKObjectManager managerWithBaseURL:[NSURL URLWithString:serviceUrl]];
    
    NSManagedObjectModel *managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    RKManagedObjectStore *managedObjectStore = [[RKManagedObjectStore alloc] initWithManagedObjectModel:managedObjectModel];
    self.objectManager.managedObjectStore = managedObjectStore;
    
    [self setupErrorMapping];
    [self setupDataMapping];
    
    [self setupCoreData];
}


#pragma mark Mapping code

- (void)setupDataMapping
{
    [self.objectManager addResponseDescriptor:[RKResponseDescriptor responseDescriptorWithMapping:[self postMapping] method:RKRequestMethodGET pathPattern:@"0/posts/stream/global" keyPath:@"data" statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)]];
}

- (void)setupErrorMapping
{
    RKObjectMapping *errorMapping = [RKObjectMapping mappingForClass:[RKErrorMessage class]];
    
    [errorMapping addPropertyMapping:[RKAttributeMapping attributeMappingFromKeyPath:nil toKeyPath:@"errorMessage"]];
    RKResponseDescriptor *errorDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:errorMapping method:RKRequestMethodGET pathPattern:nil keyPath:@"meta.error_message" statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassClientError)];
    
    [self.objectManager addResponseDescriptor:errorDescriptor];
}

- (RKEntityMapping *)metaMapping
{
    RKEntityMapping *metaMapping = [RKEntityMapping mappingForEntityForName:NSStringFromClass([Meta class]) inManagedObjectStore:self.objectManager.managedObjectStore];
    
    metaMapping.identificationAttributes = @[ @"name" ]; // I'm guessing that this is the primary id.
    
    [metaMapping addAttributeMappingsFromDictionary:@{
        @"min_id" : @"minId",
        @"name": @"name",
        @"max_id": @"maxId",
        @"more": @"more"
    }];
    
    return metaMapping;
}

- (RKEntityMapping *)postMapping
{
    RKEntityMapping *postMapping = [RKEntityMapping mappingForEntityForName:NSStringFromClass([Post class]) inManagedObjectStore:self.objectManager.managedObjectStore];
    
    postMapping.identificationAttributes = @[ @"id" ];
    
    [postMapping addAttributeMappingsFromDictionary:@{
        @"created_at" : @"createdAt",
        @"num_stars" : @"numberOfStars",
        @"num_replies" : @"numberOfReplies",
        // source
        @"text" : @"text",
        @"num_reposts": @"numberOfReposts",
        @"id" : @"id",
        @"canonical_url" : @"canonicalUrl",
        // entities
        @"html" : @"html",
        @"machine_only" : @"machineOnly",
        // user
        @"thread_id" : @"threadId",
        @"pagination_id" : @"paginationId"
    }];
    
    [postMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"source" toKeyPath:@"source" withMapping:[self sourceMapping]]];
    
    [postMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"entities" toKeyPath:@"entities" withMapping:[self entitiesMapping]]];
    
    [postMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"user" toKeyPath:@"user" withMapping:[self userMapping]]];
    
    return postMapping;
}

#pragma mark Post

- (RKEntityMapping *)sourceMapping
{
    RKEntityMapping *sourceMapping = [RKEntityMapping mappingForEntityForName:NSStringFromClass(([Source class])) inManagedObjectStore:self.objectManager.managedObjectStore];
    
    sourceMapping.identificationAttributes = @[ @"client_id" ];
    
    [sourceMapping addAttributeMappingsFromDictionary:@{
        @"link" : @"link",
        @"name" : @"name",
        @"client_id" : @"client_id"
    }];
    
    return sourceMapping;
}

- (RKEntityMapping *)entitiesMapping
{
    RKEntityMapping *entitiesMapping = [RKEntityMapping mappingForEntityForName:NSStringFromClass(([Entities class])) inManagedObjectStore:self.objectManager.managedObjectStore];
    
    [entitiesMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"mentions" toKeyPath:@"mentions" withMapping:[self mentionsMapping]]];
    
    [entitiesMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"hashtags" toKeyPath:@"hashtags" withMapping:[self hashtagsMapping]]];
    
    [entitiesMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"links" toKeyPath:@"links" withMapping:[self linksMapping]]];
    
    return entitiesMapping;
}

#pragma mark Entities

- (RKEntityMapping *)mentionsMapping
{
    RKEntityMapping *mentionsMapping = [RKEntityMapping mappingForEntityForName:NSStringFromClass([Mention class]) inManagedObjectStore:self.objectManager.managedObjectStore];
    
    mentionsMapping.identificationAttributes = @[ @"id" ];
    
    [mentionsMapping addAttributeMappingsFromDictionary:@{
        @"is_leading" : @"isLeading",
        @"pos" : @"position",
        @"id" : @"id",
        @"len" : @"length",
        @"name" : @"name"
    }];
    
    return mentionsMapping;
}

- (RKEntityMapping *)hashtagsMapping
{
    RKEntityMapping *hashtagsMapping = [RKEntityMapping mappingForEntityForName:NSStringFromClass([Hashtag class]) inManagedObjectStore:self.objectManager.managedObjectStore];
    
    hashtagsMapping.identificationAttributes = @[ @"id" ];
    
    [hashtagsMapping addAttributeMappingsFromDictionary:@{
        @"name" : @"name",
        @"len" : @"length",
        @"pos" : @"position"
    }];
    
    return hashtagsMapping;
}

- (RKEntityMapping *)linksMapping
{
    RKEntityMapping *linksMapping = [RKEntityMapping mappingForEntityForName:NSStringFromClass([Link class]) inManagedObjectStore:self.objectManager.managedObjectStore];
    
    linksMapping.identificationAttributes = @[ @"url" ];
    
    [linksMapping addAttributeMappingsFromDictionary:@{
        @"url" : @"url",
        @"text" : @"text",
        @"pos" : @"position",
        @"len" : @"length"
    }];
    
    return linksMapping;
}


#pragma mark User 

- (RKEntityMapping *)userMapping
{
    RKEntityMapping *userMapping = [RKEntityMapping mappingForEntityForName:NSStringFromClass([User class]) inManagedObjectStore:self.objectManager.managedObjectStore];
    
    userMapping.identificationAttributes = @[ @"id" ];
    
    [userMapping addAttributeMappingsFromDictionary:@{
        @"username" : @"username",
        // avatarImage
        // description
        @"locale" : @"locale",
        @"createdAt" : @"createdAt",
        // coverImage
        @"timezone" : @"timeZone",
        // counts
        @"type" : @"type",
        @"id" : @"id",
        @"name" : @"name"
    }];
    
    [userMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"avatar_image" toKeyPath:@"avatarImage" withMapping:[self avatarImageMapping]]];
    
    [userMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"description" toKeyPath:@"description" withMapping:[self descriptionMapping]]];
    
    [userMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"cover_image" toKeyPath:@"coverImage" withMapping:[self coverImageMapping]]];
    
    [userMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"counts" toKeyPath:@"counts" withMapping:[self countsMapping]]];
    
    return userMapping;
}

#pragma mark User relationships

- (RKEntityMapping *)avatarImageMapping
{
    RKEntityMapping *avatarImageMapping = [RKEntityMapping mappingForEntityForName:NSStringFromClass([AvatarImage class]) inManagedObjectStore:self.objectManager.managedObjectStore];
    
    avatarImageMapping.identificationAttributes = @[ @"url"];
    
    [avatarImageMapping addAttributeMappingsFromDictionary:@{
        @"url" : @"url",
        @"width" : @"width",
        @"is_default" : @"isDefault",
        @"height" : @"height"
    }];
    
    return avatarImageMapping;
}

- (RKEntityMapping *)descriptionMapping
{
    RKEntityMapping *descriptionMapping = [RKEntityMapping mappingForEntityForName:NSStringFromClass([Description class]) inManagedObjectStore:self.objectManager.managedObjectStore];
    
    [descriptionMapping addAttributeMappingsFromDictionary:@{
        @"text" : @"text",
        @"html" : @"html"
        // entities
    }];
    
    [descriptionMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"entities" toKeyPath:@"entities" withMapping:[self entitiesMapping]]];
    
    return descriptionMapping;
}

- (RKEntityMapping *)coverImageMapping
{
    RKEntityMapping *coverImageMapping = [RKEntityMapping mappingForEntityForName:NSStringFromClass([CoverImage class]) inManagedObjectStore:self.objectManager.managedObjectStore];
    
    [coverImageMapping addAttributeMappingsFromDictionary:@{
        @"url" : @"url",
        @"width" : @"width",
        @"is_default" : @"isDefault",
        @"height" : @"height"
    }];
    
    return coverImageMapping;
}

- (RKEntityMapping *)countsMapping
{
    RKEntityMapping *countsMapping = [RKEntityMapping mappingForEntityForName:NSStringFromClass([Counts class]) inManagedObjectStore:self.objectManager.managedObjectStore];
    
    [countsMapping addAttributeMappingsFromDictionary:@{
        @"following" : @"following",
        @"posts" : @"posts",
        @"followers" : @"followers",
        @"stars" : @"stars"
    }];
    
    return countsMapping;
}


@end
