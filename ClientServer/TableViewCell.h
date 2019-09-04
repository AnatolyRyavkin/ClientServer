//
//  TableViewCell.h
//  ClientServer
//
//  Created by Anatoly Ryavkin on 19/07/2019.
//  Copyright © 2019 AnatolyRyavkin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AVUser.h"

NS_ASSUME_NONNULL_BEGIN

@interface TableViewCell : UITableViewCell<NSURLConnectionDelegate>

@property NSData*imageData;
@property UIImage*imageFoto;

-(TableViewCell*)configurationCell:(NSIndexPath*)indexPath forUser:(AVUser*)user;

@end

NS_ASSUME_NONNULL_END
