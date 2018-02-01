//
//  RepoData.h
//  Github Repos
//
//  Created by Aaron Chong on 2/1/18.
//  Copyright © 2018 Aaron Chong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RepoData : NSObject

@property (strong, nonatomic) NSString *repoName;

- (instancetype) initWithRepoName:(NSString *)repoName;

@end
