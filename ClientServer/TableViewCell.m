//
//  TableViewCell.m
//  ClientServer
//
//  Created by Anatoly Ryavkin on 19/07/2019.
//  Copyright © 2019 AnatolyRyavkin. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
 
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

-(TableViewCell*)configurationCell:(NSIndexPath*)indexPath forUser:(AVUser*)user{

    self.imageData = [NSData dataWithContentsOfURL:user.foto];
    self.imageFoto = [[UIImage alloc]initWithData:self.imageData];

    switch (indexPath.row) {
        case 0:
            self.imageView.image = self.imageFoto;
            self.textLabel.text = @"ID";
            self.detailTextLabel.text =user.ID;
            break;
        case 1:
            self.textLabel.text = @"token";
            self.detailTextLabel.text = user.token;
            break;
        case 2:
            self.textLabel.text = @"DateExpires";
            self.detailTextLabel.text = user.dateExpiresString;
            break;
        case 3:
            self.textLabel.text = @"FirstName";
            self.detailTextLabel.text = user.firstName;
            break;
        case 4:
            self.textLabel.text = @"LastName";
            self.detailTextLabel.text = user.lastName;
            break;
        case 5:
            self.textLabel.text = @"Is closed";
            self.detailTextLabel.text = (user.isCliosed)?@"YES":@"NO";
            break;
        case 6:
            self.textLabel.text = @"can access closed";
            self.detailTextLabel.text = (user.canAccessClosed)?@"YES":@"NO";
            break;
        case 7:
            self.textLabel.text = @"Date birth";
            self.detailTextLabel.text = user.dateBirthString;
            break;
        case 8:
            self.textLabel.text = @"City";
            self.detailTextLabel.text = [user.city objectForKey:@"title"];
            break;
        default:
            break;
    }


    return self;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    if (self.imageData)
        self.imageFoto = [[UIImage alloc]initWithData:self.imageData];        
}

@end
