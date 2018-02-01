//
//  RepoTableVC.m
//  Github Repos
//
//  Created by Aaron Chong on 2/1/18.
//  Copyright © 2018 Aaron Chong. All rights reserved.
//

#import "RepoTableVC.h"
#import "RepoTableViewCell.h"
#import "RepoData.h"

@interface RepoTableVC ()

@property (strong, nonatomic) NSArray *repos;
@property (strong, nonatomic) NSMutableArray <RepoData *> *objectsWithNameArray;

@end

@implementation RepoTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *url = [NSURL URLWithString:@"https://api.github.com/users/lighthouse-labs/repos"];
    
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:url];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error: %@", error.description);
            return;
        }
        
        NSError *jsonError = nil;
        self.repos = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if (jsonError) {
            NSLog(@"json error: %@", error.description);
            return;
        }
        
        for (NSDictionary *repo in self.repos) {
            
            NSString *repoName = repo[@"name"];
            NSLog(@"repo: %@", repoName);
            
            RepoData *repoObject = [[RepoData alloc] initWithRepoName:repoName];
            [self.objectsWithNameArray addObject:repoObject];
        }
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [self.tableView reloadData];
            
        }];
    }];
    
    [dataTask resume];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.repos.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    RepoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.repoLabel.text = self.objectsWithNameArray[indexPath.row].repoName;
    
    return cell;
}



@end
