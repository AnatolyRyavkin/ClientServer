//
//  TableViewController.m
//  ClientServer
//
//  Created by Anatoly Ryavkin on 19/07/2019.
//  Copyright © 2019 AnatolyRyavkin. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 9;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"idCell" forIndexPath:indexPath];
    [cell configurationCell:indexPath forUser:self.user];
    return cell;
}

@end
