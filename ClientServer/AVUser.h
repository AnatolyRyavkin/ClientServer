//
//  AVUser.h
//  ClientServer
//
//  Created by Anatoly Ryavkin on 19/07/2019.
//  Copyright © 2019 AnatolyRyavkin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AVUser : NSObject

@property NSURL*requestURL;

@property NSString*ID;
@property NSString*token;
@property NSDate*dateExpires;
@property NSString*dateExpiresString;


@property NSString* firstName;
@property NSString* lastName;
@property BOOL isCliosed;
@property BOOL canAccessClosed;
@property NSDate* dateBirth;
@property NSString*dateBirthString;
@property NSDictionary* city;
@property NSURL*foto;

-(id)initWithURL:(NSURL*)inputURL;

@end

NS_ASSUME_NONNULL_END
