//
//  feedPageData.m
//  DefindMe
//
//  Created by Sumit Mahto on 25/08/1937 SAKA.
//  Copyright © 1937 SAKA Digi Interacts. All rights reserved.
//

#import "feedPageData.h"

@implementation feedPageData
-(id)initWithDictionary:(NSDictionary*)dic{
    if (self = [super init]) {
        if ([dic objectForKey:@"postdate"]&& ![[dic objectForKey:@"postdate"]isKindOfClass:[NSNull class]]) {
            self.strPostDate = [dic objectForKey:@"postdate"];
        }else{
            self.strPostDate = @"";
        }
        if ([dic objectForKey:@"content"]&& ![[dic objectForKey:@"content"]isKindOfClass:[NSNull class]]) {
            self.strContent = [dic objectForKey:@"content"];
        }else{
            self.strContent = @"";
        }
        if ([dic objectForKey:@"feed"]&& ![[dic objectForKey:@"feed"]isKindOfClass:[NSNull class]]) {
            self.strid = [dic objectForKey:@"feed"];
        }else{
            self.strid = @"";
        }
        if ([dic objectForKey:@"id"]&& ![[dic objectForKey:@"id"]isKindOfClass:[NSNull class]]) {
            self.strPostId = [dic objectForKey:@"id"];
        }else{
            self.strPostId = @"";
        }
        if ([dic objectForKey:@"m_id"]&& ![[dic objectForKey:@"m_id"]isKindOfClass:[NSNull class]]) {
            self.strMediaId= [dic objectForKey:@"m_id"];
        }else{
            self.strMediaId = @"";
        }
    }
    return self;
}
-(id)initWithUserDataDictionary:(NSDictionary *)dic{
    if (self = [super init]) {
        if ([dic objectForKey:@"name"]&& ![[dic objectForKey:@"name"]isKindOfClass:[NSNull class]]) {
            self.name = [dic objectForKey:@"name"];
        }else{
            self.name = @"";
        }
        if ([dic objectForKey:@"avatar"]&& ![[dic objectForKey:@"avatar"]isKindOfClass:[NSNull class]]) {
            self.avatar = [dic objectForKey:@"avatar"];
        }else{
            self.avatar = @"";
        }
  
    }
    return self;
}
-(id)initWithDictionaryMediaData:(NSDictionary *)dic{
    if (self = [super init]) {
        if ([dic objectForKey:@"kind"]&& ![[dic objectForKey:@"kind"]isKindOfClass:[NSNull class]]) {
            self.mediaKind = [dic objectForKey:@"kind"];
        }else{
            self.mediaKind = @"";
        }
        if ([dic objectForKey:@"previewUrl"]&& ![[dic objectForKey:@"previewUrl"]isKindOfClass:[NSNull class]]) {
            self.strmpthriURL = [dic objectForKey:@"previewUrl"];
        }else{
            self.strmpthriURL = @"";
        }
        if ([[dic objectForKey:@"posters"] objectForKey:@"original"]&& ![[[dic objectForKey:@"posters"] objectForKey:@"original"]isKindOfClass:[NSNull class]]) {
            NSString * movieStr=[[dic objectForKey:@"posters"] objectForKey:@"original"];
            NSRange r1 = [movieStr rangeOfString:@"movie"];
            NSString *substr = [movieStr substringFromIndex:r1.location];
            self.strposterURL =[NSString stringWithFormat:@"%@%@",@"http://content6.flixster.com/",substr];
        }
        else if ([dic objectForKey:@"artworkUrl100"]&& ![[dic objectForKey:@"artworkUrl100"] isKindOfClass:[NSNull class]]) {
            self.strposterURL =[[dic objectForKey:@"artworkUrl100"] objectForKey:@"artworkUrl100"];
        }
        else if ([dic objectForKey:@"photo"] && ![[dic objectForKey:@"photo"]isKindOfClass:[NSNull class]]) {
            self.strposterURL =[NSString stringWithFormat:@"%@%@%@",@"http://www.defindme.com/defindme_cdn/image/",[dic objectForKey:@"photo"],@"_f"];
        }
        else if ([[dic objectForKey:@"imageLinks"] objectForKey:@"extraLarge"]&& ![[[dic objectForKey:@"imageLinks"] objectForKey:@"extraLarge"]isKindOfClass:[NSNull class]]) {
            self.strposterURL =[[dic objectForKey:@"imageLinks"] objectForKey:@"extraLarge"];
        }
       else if ([[dic objectForKey:@"imageLinks"] objectForKey:@"large"]&& ![[[dic objectForKey:@"imageLinks"] objectForKey:@"large"]isKindOfClass:[NSNull class]]) {
            self.strposterURL =[[dic objectForKey:@"imageLinks"] objectForKey:@"large"];
        }
       else if ([[dic objectForKey:@"imageLinks"] objectForKey:@"medium"]&& ![[[dic objectForKey:@"imageLinks"] objectForKey:@"medium"]isKindOfClass:[NSNull class]]) {
           self.strposterURL =[[dic objectForKey:@"imageLinks"] objectForKey:@"medium"];
       }
        else{
            self.strposterURL = @"";
        }
        if ([dic objectForKey:@"artistName"]&& ![[dic objectForKey:@"artistName"]isKindOfClass:[NSNull class]]) {
            self.strArtistName = [dic objectForKey:@"artistName"];
        }
        else if ([[[dic objectForKey:@"volumeInfo"] objectForKey:@"authors"] objectAtIndex:0]&& ![[[[dic objectForKey:@"volumeInfo"] objectForKey:@"authors"] objectAtIndex:0]isKindOfClass:[NSNull class]]) {
            self.strArtistName =[[[dic objectForKey:@"volumeInfo"] objectForKey:@"authors"] objectAtIndex:0];
        }

        else{
            self.strArtistName = @"";
        }
        if ([dic objectForKey:@"title"]&& ![[dic objectForKey:@"title"]isKindOfClass:[NSNull class]]) {
            self.strTitle = [dic objectForKey:@"title"];
        }
        else if ([[[dic objectForKey:@"volumeInfo"] objectForKey:@"title"] objectAtIndex:0]&& ![[[[dic objectForKey:@"volumeInfo"] objectForKey:@"title"] objectAtIndex:0]isKindOfClass:[NSNull class]]) {
            self.strTitle =[[[dic objectForKey:@"volumeInfo"] objectForKey:@"title"] objectAtIndex:0];
        }else{
            self.strTitle = @"";
        }
    }
    return self;
}
@end
