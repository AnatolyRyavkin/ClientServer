//
//  AVManagerRequest.m
//  ClientServer
//
//  Created by Anatoly Ryavkin on 18/07/2019.
//  Copyright © 2019 AnatolyRyavkin. All rights reserved.
//

#import "AVManagerRequest.h"

@implementation AVManagerRequest

+(AVManagerRequest*)sharedManager{
    static AVManagerRequest*manager = nil;
    if(manager==nil){
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            manager=[[AVManagerRequest alloc]init];
        });
    }
    return manager;
}

-(id)init{
    self=[super init];
    if(self){
        NSURL*url = [[NSURL alloc]initWithString:@"https://api.vk.com/method/"];
        self.sessionManager = [[AFHTTPSessionManager alloc]initWithBaseURL:url];
        self.sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
        self.sessionManager.responseSerializer = [AFJSONResponseSerializer serializer];

    }
    return self;
}

-(NSURLSessionDataTask*)responseAtRequestOfString:(NSString*) nameRequest andDictionaryParametrs:(NSDictionary*)parametrs andTvc:(TableViewController*)tvc andUser:(AVUser*)user{

    typedef void(^Progress)(NSProgress*);
    typedef void(^Success)(NSURLSessionDataTask*,id _Nullable);
    typedef void(^Failure)(NSURLSessionDataTask *task, id _Nullable responseObject);

    Failure failure = ^(NSURLSessionDataTask *task, id _Nullable responseObject){
        NSLog(@"------------------------------------responseObjectFailure=%@",responseObject);
        NSLog(@"failure");
    };
    Success success = ^(NSURLSessionDataTask *task, id _Nullable responseObject){
        NSLog(@"-------------------------------------responseObjectSuccess=%@",responseObject);
        NSLog(@"task ================ %@",task.response);

        NSDictionary*dictionaryResponse = (NSDictionary*)responseObject;
        NSArray*arrayParams = [dictionaryResponse objectForKey:@"response"];
        NSDictionary*dictionaryParams = [arrayParams firstObject];

        user.firstName = [dictionaryParams objectForKey:@"first_name"];
        user.lastName = [dictionaryParams objectForKey:@"last_name"];
        user.isCliosed = [dictionaryParams objectForKey:@"is_closed"];
        user.foto = [NSURL URLWithString:[dictionaryParams objectForKey:@"photo_50"]];
        user.city = [dictionaryParams objectForKey:@"city"];
        user.canAccessClosed =[dictionaryParams objectForKey:@"can_access_closed"];
        user.dateBirthString = [dictionaryParams objectForKey:@"bdate"];

        [tvc.tableView reloadData];

    };
    Progress progress = ^(NSProgress* prog){
        NSLog(@"progress");
    };

    NSURLSessionDataTask*task = [[NSURLSessionDataTask alloc]init];
    task = [self.sessionManager GET:@"users.get"
                  parameters:parametrs
                    progress:progress
                     success:success
                     failure:failure
     ];

    return task;
    
}

@end


