//
//  YouShouldMeetMeService.h
//  DefindMe
//
//  Created by Sumit Mahto on 30/06/1937 SAKA.
//  Copyright © 1937 SAKA Sumit Mahto. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface YouShouldMeetMeService : WebServiceBaseClass
+(YouShouldMeetMeService *)sharedInstance;
-(void)YouShouldMeetMeServicewithCompletionHandler:(CompletionHandler)handler;






@end
