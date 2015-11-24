//
//  MediaModule.m
//  DefindMe
//
//  Created by Sumit Mahto on 13/08/1937 SAKA.
//  Copyright © 1937 SAKA Digi Interacts. All rights reserved.
//

#import "MediaModule.h"

@implementation MediaModule
-(id)initWithDictionary:(NSDictionary*)dic{
    if (self = [super init]) {
        if ([dic objectForKey:@"kind"]&& ![[dic objectForKey:@"kind"]isKindOfClass:[NSNull class]]) {
            self.mediaKind= [dic objectForKey:@"kind"];
        }else{
            self.mediaKind = @"";
        }
        if ([dic objectForKey:@"title"]&& ![[dic objectForKey:@"title"]isKindOfClass:[NSNull class]]) {
            self.mediaTitle= [dic objectForKey:@"title"];
        }else{
            self.mediaTitle= @"";
        }
        if ([dic objectForKey:@"artworkUrl100"]&& ![[dic objectForKey:@"artworkUrl100"]isKindOfClass:[NSNull class]]) {
            self.imagestr= [dic objectForKey:@"artworkUrl100"];
        }else{
            self.imagestr= @"";
        }
        if ([dic objectForKey:@"posters"]&& ![[dic objectForKey:@"posters"]isKindOfClass:[NSNull class]]) {
            self.posterDict= [dic objectForKey:@"posters"];
        }else{
            self.posterDict= nil;
        }
        if ([dic objectForKey:@"volumeInfo"]&& ![[dic objectForKey:@"volumeInfo"]isKindOfClass:[NSNull class]]) {
            self.booktitleDict= [dic objectForKey:@"volumeInfo"];
        }else{
            self.booktitleDict= nil;
        }
        if ([dic objectForKey:@"imageLinks"]&& ![[dic objectForKey:@"imageLinks"]isKindOfClass:[NSNull class]]) {
            self.bookImageDict= [dic objectForKey:@"imageLinks"];
        }else{
            self.bookImageDict= nil;
        }
    }
    return self;
}
@end
