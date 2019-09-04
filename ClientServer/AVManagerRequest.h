//
//  AVManagerRequest.h
//  ClientServer
//
//  Created by Anatoly Ryavkin on 18/07/2019.
//  Copyright © 2019 AnatolyRyavkin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import <WebKit/WebKit.h>
#import "AVUser.h"
#import "TableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface AVManagerRequest : NSObject<WKNavigationDelegate>

@property (nonatomic) AFHTTPSessionManager*sessionManager;

+(AVManagerRequest*)sharedManager;

-(NSURLSessionDataTask*)responseAtRequestOfString:(NSString*) nameRequest andDictionaryParametrs:(NSDictionary*)parametrs andTvc:(TableViewController*)tvc andUser:(AVUser*)user;


@end

NS_ASSUME_NONNULL_END
