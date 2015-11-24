//
//  DBManager.h
//  iCompliance
//
//  Created by Boudhayan Biswas on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface DBManager : NSObject

+(DBManager*)manager;


-(BOOL) deleteAllrecord;

-(BOOL)deleteAddressForForId:(NSString*)strID;

-(BOOL)insertdataWithUserName:(NSString*)strUserName UserImage:(NSString *)strUserImage ArtistName:(NSString *)strartistName PosterName:(NSString*)strPosterName PosterImage:(NSString *)strPosterImage PostDate:(NSString *)strPostDate Comments:(NSString *)strComments UserId:(NSString *)strUserId PostId:(NSString *)strPostId MediaId:(NSString *)strmId MediaKind:(NSString *)strmediaKind AudioUrl:(NSString *)straudioUrl;

//-(ModelDropOffAddress*) getAddressForId:(NSString *)strID;

//-(BOOL)updateAddressForAddress:(ModelDropOffAddress *)objAddress;

-(NSMutableArray*) getallrecord;

@end
