//
//  WebServiceBaseClass.h
//  
//Created by Sumit Mahto on 14/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.

//
//
//

#import <Foundation/Foundation.h>
#define SomethingWrong @"Something is wrong, please try again later."
#define ConnectionErrorMsg @"ConnectionErrorHappen, please try again later."

typedef NS_ENUM(NSUInteger, WebService) {
    GET_MENU_ITEMS,
    LOG_IN,
    FORGOT_PASSWORD,
    SIGN_UP,
    MY_ACCOUNT_DETAILS,
    GET_DELIVERY_ZONE,
    ADD_CUSTOMER_ADDRESS,
    UPDATE_PASSWORD,
    UPDATE_EMAIL_RECEIVED,
    NOTIFICATION_DATA
};


typedef void(^CompletionHandler)(id result,BOOL isError,NSString *strMsg);

@interface WebServiceBaseClass : NSObject
{
    @protected
    NSURL *urlService;
    NSString *secreteKey;
}

-(id)initWithService:(WebService)service;
-(NSString *)serializeParams:(NSDictionary *)params;
-(NSString *) sha256:(NSString *) input;

//-(NSString *) sha256:(NSString *) input withSalt: (NSString *) salt;
@end
