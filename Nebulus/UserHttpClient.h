//
//  HttpClient.h
//  Nebulus
//
//  Created by Jike on 7/24/15.
//  Copyright (c) 2015 CMU-eBiz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "Clip.h"
#import <UIKit/UIKit.h>

@interface UserHttpClient : NSObject
+(User*) login: (NSString*) username password: (NSString*) password;

+(void) logout;

+(BOOL) registerUser:(NSString*) username password: (NSString*) password email: (NSString*) email;

+(User*) updateUserInfo:(User*) user;

//Return the currently logged-in user
+(User*) getCurrentUser;

+(NSArray*) getFollowers:(User*) user;

+(NSArray*) getFollowing:(User*) user;

+(NSArray*) getTimeline:(User*) user;

+(BOOL) follow:(User*) followee follower:(User*) follower;

+(BOOL) unfollow:(User*) followee follower:(User*) follower;


//Search and return the matched users by the given search querry
+(NSArray*) searchUser:(NSString*) searchStr;

+(UIImage*) getUserImage:(NSString*) userId;

+(BOOL) setUserImage:(UIImage*) image userId:(NSString*) userId;


@end
