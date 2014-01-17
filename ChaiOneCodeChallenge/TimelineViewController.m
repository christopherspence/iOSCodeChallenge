//
//  TimelineViewController.m
//  ChaiOneCodeChallenge
//
//  Created by Christopher Spence on 1/15/14.
//  Copyright (c) 2014 Christopher Spence. All rights reserved.
//

#import "TimelineViewController.h"
#import "Post.h"
#import "User.h"
#import "AvatarImage.h"

#import <SDWebImage/UIImageView+WebCache.h>
#import <QuartzCore/QuartzCore.h>

#import "PostRepository.h"

@interface TimelineViewController ()

@property (nonatomic, strong) NSArray *posts;

- (void)refresh;

@end

@implementation TimelineViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(refresh) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refreshControl;
    
    [self refresh];
}

- (void)refresh
{
    [[PostRepository sharedPostRepository] getAll:^(NSArray *posts) {
        self.posts = posts;
        
        [self.tableView reloadData];
        
        [self.refreshControl endRefreshing];
    }];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.posts.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"PostCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    Post *post = [self.posts objectAtIndex:indexPath.row];

    [cell.imageView setImageWithURL:[NSURL URLWithString:post.user.avatarImage.url]
                  placeholderImage:[UIImage imageNamed:@"personIcon"]];

    // configure rounded coners
    cell.imageView.layer.cornerRadius = 5.f;
    cell.imageView.clipsToBounds = YES;
    
    cell.textLabel.text = post.user.name;
    cell.detailTextLabel.text = post.text;
    
    return cell;
}

@end
