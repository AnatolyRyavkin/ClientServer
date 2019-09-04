//
//  AVUser.m
//  ClientServer
//
//  Created by Anatoly Ryavkin on 19/07/2019.
//  Copyright © 2019 AnatolyRyavkin. All rights reserved.
//

#import "AVUser.h"

@implementation AVUser

-(id)initWithURL:(NSURL*)inputURL{
    self = [super init];
    if(self){

        NSMutableString*str = [NSMutableString stringWithFormat:@"%@",(NSString*)inputURL];

        NSRange range = [str rangeOfString:@"https://oauth.vk.com/blank.html#access_token="];

        [str deleteCharactersInRange:range];

        NSArray*arrayStr = [str componentsSeparatedByString:@"&expires_in="];

        self.token = [arrayStr firstObject];

        str = [arrayStr lastObject];

        arrayStr = [str componentsSeparatedByString:@"&user_id="];

        self.dateExpiresString = [arrayStr firstObject];

        str = [arrayStr lastObject];

        arrayStr = [str componentsSeparatedByString:@"&state="];

        self.ID = [arrayStr firstObject];
    }
    return self;
}

@end
