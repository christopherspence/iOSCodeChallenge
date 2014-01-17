//
//  Entities.h
//  ChaiOneCodeChallenge
//
//  Created by Christopher Spence on 1/16/14.
//  Copyright (c) 2014 Christopher Spence. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Description, Hashtag, Link, Mention, Post;

@interface Entities : NSManagedObject

@property (nonatomic, retain) NSSet *hashTags;
@property (nonatomic, retain) NSSet *links;
@property (nonatomic, retain) NSSet *mentions;
@property (nonatomic, retain) Post *post;
@property (nonatomic, retain) Description *desc;
@end

@interface Entities (CoreDataGeneratedAccessors)

- (void)addHashTagsObject:(Hashtag *)value;
- (void)removeHashTagsObject:(Hashtag *)value;
- (void)addHashTags:(NSSet *)values;
- (void)removeHashTags:(NSSet *)values;

- (void)addLinksObject:(Link *)value;
- (void)removeLinksObject:(Link *)value;
- (void)addLinks:(NSSet *)values;
- (void)removeLinks:(NSSet *)values;

- (void)addMentionsObject:(Mention *)value;
- (void)removeMentionsObject:(Mention *)value;
- (void)addMentions:(NSSet *)values;
- (void)removeMentions:(NSSet *)values;

@end
