//
//  WebServiceBaseClass.m
//  Foodjets
//
//  Created by AppsbeeTechnology on 25/06/15.
//  Copyright (c) 2015 Jayanta. All rights reserved.
//

#import "WebServiceBaseClass.h"
#include <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonHMAC.h>


//Url For New Autho test
#define _kBaseURL @"http://Example.com/"

NSString static *strAllservices[]={
    [SIGN_IN]=@"signin",
    [FORGOT_PASSWORD] = @"forgot-password",
    [SIGN_UP]=@"signup",
};

@implementation WebServiceBaseClass

-(id)initWithService:(WebService)service
{
    if (self=[super init]) {
        urlService=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",_kBaseURL,strAllservices[service]]];
    }
    return self;
}
#pragma mark
#pragma mark Generate QueryString
#pragma mark
-(NSString *)serializeParams:(NSDictionary *)params {
    
    NSMutableArray *arrPairs = NSMutableArray.array;
    for (NSString *key in params.keyEnumerator)
    {
       // NSLog(@"Main Dic Key: %@", key);
        
        id value = params[key];
        if ([value isKindOfClass:[NSDictionary class]])
        {
            for (NSString *subKey in value){
                
                //NSLog(@"SubKey: %@", subKey);
                //NSLog(@"Value for subkey %@",[value objectForKey:subKey] );
                id valuforSubKey = [value objectForKey:subKey];
                if ([valuforSubKey isKindOfClass:[NSDictionary class]]) {
                    for (NSString *subValueKey in valuforSubKey) {
                        NSLog(@"SubValueKey: %@", subValueKey);
                        [arrPairs addObject:[NSString stringWithFormat:@"%@[%@][%@]=%@", key, subKey,subValueKey,[valuforSubKey objectForKey:subValueKey]]];
                        
                    }
                    
                }else{
                    [arrPairs addObject:[NSString stringWithFormat:@"%@[%@]=%@", key, subKey,valuforSubKey]];
                    
                }
                
            }
        }
        else if ([value isKindOfClass:[NSArray class]])
        {
            for (id subValue in value){
              //  NSLog(@"subValue: %@", subValue);
                if ([subValue isKindOfClass:[NSDictionary class]]) {
                    for (NSString *subValueKey in subValue) {
                       // NSLog(@"SubValueKey: %@", subValueKey);
                        [arrPairs addObject:[NSString stringWithFormat:@"%@[%d][%@]=%@", key,[value count]-1,subValueKey, [subValue objectForKey:subValueKey]]];
                    }
                    
                }else{
                    [arrPairs addObject:[NSString stringWithFormat:@"%@[%d]=%@", key,[value count],subValue]];
                    
                }
                
                
            }
        }
        else{
            [arrPairs addObject:[NSString stringWithFormat:@"%@=%@", key, value]];

        }
    }
    return [NSString stringWithFormat:@"%@",[arrPairs componentsJoinedByString:@"&"]];
}
#pragma mark
#pragma mark Generate Signature
#pragma mark
-(NSString *) sha256:(NSString *) input
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    secreteKey = [userDefault objectForKey:@"secret_key"];

    const char *cKey  = [secreteKey cStringUsingEncoding:NSUTF8StringEncoding];
    const char *data = [input cStringUsingEncoding:NSUTF8StringEncoding];
    unsigned char digest[CC_SHA256_DIGEST_LENGTH];
    CCHmac(kCCHmacAlgSHA256, cKey, strlen(cKey), data, strlen(data), digest);
    
    NSString *hash;
    
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA256_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_SHA256_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    hash = output;
    return hash;
    
}


@end
