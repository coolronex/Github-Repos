//
//  RepoData.m
//  Github Repos
//
//  Created by Aaron Chong on 2/1/18.
//  Copyright © 2018 Aaron Chong. All rights reserved.
//

#import "RepoData.h"

@implementation RepoData

- (instancetype) initWithRepoName:(NSString *)repoName {
    
    self = [super init];
    if (self) {
        
        _repoName = repoName;
        
    }
    return self;
}

@end
