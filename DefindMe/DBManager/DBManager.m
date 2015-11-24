//
//  DBManager.m
//  iCompliance
//
//  Created by Boudhayan Biswas on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DBManager.h"
#import "AppDelegate.h"
#import "FeedPageDataSavedService.h"
#import <sqlite3.h>

#define DATABASE_NAME @"Defindmedb.sqlite"



NSString *docsDir;
NSArray *dirPaths;
NSString *databasePath;
sqlite3 *database;
const char *dbpath;

//const char *sql_stmt = "CREATE TABLE IF NOT EXISTS  Address (address VARCHAR, zoneId VARCHAR, stateCode VARCHAR,id VARCHAR, note VARCHAR)";

@implementation DBManager

+(DBManager*)manager
{
    static DBManager *dbManager=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dbManager=[[DBManager alloc] init];
    });
    return dbManager;
}


-(BOOL) deleteAllrecord{
    
    BOOL flag=NO;
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = dirPaths[0];
    databasePath = [[NSString alloc]initWithString: [docsDir stringByAppendingPathComponent:DATABASE_NAME]];
    //NSLog(@"%@",databasePath);
    dbpath = [databasePath UTF8String];
    if (sqlite3_open(dbpath, &database) == SQLITE_OK) {
        //const char *dbpath = [_databasePath UTF8String];
        
        if (sqlite3_open(dbpath, &database) == SQLITE_OK) {
            
            NSString *query=[NSString stringWithFormat:@"delete from Address"];
            const char *sqlStatement = [query UTF8String];
            
            sqlite3_stmt *compileStatement;
            
            sqlite3_prepare_v2(database, sqlStatement, -1, &compileStatement, NULL);
            if (sqlite3_step(compileStatement) == SQLITE_DONE) {
                //NSLog(@"All Value of Reminder is deleted...");
                flag= YES;
            }else{
                flag= NO;
            }
            sqlite3_finalize(compileStatement);
            sqlite3_close(database);
            return flag;
        }
        else {
            //NSLog(@"error in database");
            return NO;
        }
    }
    return NO;
    
}

-(BOOL)deleteAddressForForId:(NSString*)strID
{
    BOOL flag=NO;
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = dirPaths[0];
    databasePath = [[NSString alloc]initWithString: [docsDir stringByAppendingPathComponent:DATABASE_NAME]];
    dbpath = [databasePath UTF8String];
    if (sqlite3_open(dbpath, &database) == SQLITE_OK) {
        //const char *dbpath = [_databasePath UTF8String];
        
        if (sqlite3_open(dbpath, &database) == SQLITE_OK) {
            
            NSString *query=[NSString stringWithFormat:@"delete from Address where id = %@",strID];
            const char *sqlStatement = [query UTF8String];
            
            sqlite3_stmt *compileStatement;
            
            sqlite3_prepare_v2(database, sqlStatement, -1, &compileStatement, NULL);
            if (sqlite3_step(compileStatement) == SQLITE_DONE) {
                //NSLog(@"%@ Value of Reminder is deleted...",Id);
                flag= YES;
            }else{
                flag= NO;
            }
            sqlite3_finalize(compileStatement);
            sqlite3_close(database);
            return flag;
        }
        else {
            //NSLog(@"error in database");
            return NO;
        }
    }
    return NO;
}

-(BOOL)insertdataWithUserName:(NSString*)strUserName UserImage:(NSString *)strUserImage ArtistName:(NSString *)strartistName PosterName:(NSString*)strPosterName PosterImage:(NSString *)strPosterImage PostDate:(NSString *)strPostDate Comments:(NSString *)strComments UserId:(NSString *)strUserId PostId:(NSString *)strPostId MediaId:(NSString *)strmId MediaKind:(NSString *)strmediaKind AudioUrl:(NSString *)straudioUrl
{
    BOOL flag=NO;
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = dirPaths[0];
    databasePath = [[NSString alloc]initWithString: [docsDir stringByAppendingPathComponent:DATABASE_NAME]];
    dbpath = [databasePath UTF8String];
    if (sqlite3_open(dbpath, &database) == SQLITE_OK)
    {
        char *errMsg;
        const char *sql_stmt ="CREATE TABLE IF NOT EXISTS  Address (userName TEXT,userImage TEXT,artistName TEXT,posterName TEXT,posterImage TEXT,postDate TEXT,comments TEXT,uid TEXT,pid TEXT,mid TEXT,mkind TEXT,audioUrl TEXT)";
        if (sqlite3_exec(database, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK)
        {
                NSLog(@"Failed to create table");
        }else{
            sqlite3_stmt    *statement;
            const char *dbpath = [databasePath UTF8String];
            
            if (sqlite3_open(dbpath, &database) == SQLITE_OK)
            {
                
                NSString *insertSQL = [NSString stringWithFormat:
                                       @"INSERT INTO Address (userName,userImage,artistName,posterName,posterImage,postDate,comments,uid,pid,mid,mkind,audioUrl) VALUES (\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\")",strUserName,strUserImage,strartistName,strPosterName,strPosterImage,strPostDate,strComments,strUserId,strPostId,strmId,strmediaKind,straudioUrl];
                
                const char *insert_stmt = [insertSQL UTF8String];
                sqlite3_prepare_v2(database, insert_stmt,-1, &statement, NULL);
                if (sqlite3_step(statement) == SQLITE_DONE)
                {
                    NSLog(@"new values are saved.");
                flag= YES;
                } else {
                   NSLog(@"Failed to add reminder");
                    flag= NO;
                }
                sqlite3_finalize(statement);
                sqlite3_close(database);
                return flag;
            }
        }
        sqlite3_close(database);
    }
    else {
        NSLog(@"Failed to open/create database");
    }
    return NO;
}

/*-(ModelDropOffAddress*) getAddressForId:(NSString *)strID{
    
    ModelDropOffAddress *obj=nil;
    
    NSArray *array=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docs=[array objectAtIndex:0];
    
    databasePath=[[NSString alloc] initWithString:[docs stringByAppendingPathComponent:DATABASE_NAME]];
    const char *dbPath=[databasePath UTF8String];
    if (sqlite3_open(dbPath, &database)==SQLITE_OK) {
        NSString *query=[NSString stringWithFormat:@"select * from Address where ID='%@'",strID];
        const char *selectStatemt=[query UTF8String];
        sqlite3_stmt *compileStatement;
        if (sqlite3_prepare_v2(database, selectStatemt, -1, &compileStatement, NULL)==SQLITE_OK) {
            obj = [[ModelDropOffAddress alloc] init];
            while (sqlite3_step(compileStatement)==SQLITE_ROW) {
                //(address,zoneId, stateCode, id,note)
                obj.strAddress=[NSString stringWithUTF8String:(char*)sqlite3_column_text(compileStatement, 0)];
                obj.strZoneId=[NSString stringWithUTF8String:(char*)sqlite3_column_text(compileStatement, 1)];
                obj.strStateCode=[NSString stringWithUTF8String:(char*)sqlite3_column_text(compileStatement, 2)];
                obj.strAddressId=[NSString stringWithUTF8String:(char*)sqlite3_column_text(compileStatement, 3)];
                obj.strAddressNote=[NSString stringWithUTF8String:(char*)sqlite3_column_text(compileStatement, 4)];
            }
        }
    }
    return obj;
}
*/
/*-(BOOL)updateAddressForAddress:(ModelDropOffAddress *)objAddress
{
    BOOL flag=NO;
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = dirPaths[0];
    databasePath = [[NSString alloc]initWithString: [docsDir stringByAppendingPathComponent:DATABASE_NAME]];
    dbpath = [databasePath UTF8String];
    
    if (sqlite3_open(dbpath, &database) == SQLITE_OK)
    {
        NSString *query=[NSString stringWithFormat:@"update Address set note='%@' where ID='%@'",objAddress.strAddressNote,objAddress.strAddressId];
        const char *sql_stmt =[query UTF8String];
        
        if (sqlite3_open(dbpath, &database) == SQLITE_OK)
        {
            sqlite3_stmt *statement;
            sqlite3_prepare_v2(database, sql_stmt,
                               -1, &statement, NULL);
            if (sqlite3_step(statement) == SQLITE_DONE)
            {
                //NSLog(@"values are updated.");
                flag= YES;
            } else {
                //NSLog(@"Failed to updated.");
                flag= NO;
            }
            sqlite3_finalize(statement);
            sqlite3_close(database);
            return flag;
        }
        sqlite3_close(database);
    }
    return NO;
}
*/


-(NSMutableArray*) getallrecord{
    NSMutableArray *arr=[[NSMutableArray alloc] init];
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = dirPaths[0];
    databasePath = [[NSString alloc]initWithString: [docsDir stringByAppendingPathComponent:DATABASE_NAME]];
    //NSLog(@"%@",databasePath);
    dbpath = [databasePath UTF8String];
    if (sqlite3_open(dbpath, &database) == SQLITE_OK) {
        const char *sqlStatement = "select * from Address";
        sqlite3_stmt *compileStatement;
        if (sqlite3_prepare_v2(database, sqlStatement, -1, &compileStatement, NULL) == SQLITE_OK) {
            while (sqlite3_step(compileStatement) == SQLITE_ROW) {
                //NSLog(@"one record");
                FeedPageDataSavedService *obj=[[FeedPageDataSavedService alloc] init];
                //(address,zoneId, stateCode, id,note)
                obj.name=[NSString stringWithUTF8String:(char *)sqlite3_column_text(compileStatement, 0)];
                obj.avatar=[NSString stringWithUTF8String:(char *)sqlite3_column_text(compileStatement, 1)];
                obj.strArtistName=[NSString stringWithUTF8String:(char *)sqlite3_column_text(compileStatement, 2)];
                obj.strTitle=[NSString stringWithUTF8String:(char *)sqlite3_column_text(compileStatement, 3)];
                obj.strposterURL=[NSString stringWithUTF8String:(char *)sqlite3_column_text(compileStatement, 4)];
                obj.strPostDate=[NSString stringWithUTF8String:(char *)sqlite3_column_text(compileStatement, 5)];
                obj.strContent=[NSString stringWithUTF8String:(char *)sqlite3_column_text(compileStatement, 6)];
                obj.strid=[NSString stringWithUTF8String:(char *)sqlite3_column_text(compileStatement, 7)];
                obj.post_Id=[NSString stringWithUTF8String:(char *)sqlite3_column_text(compileStatement, 8)];
                obj.media_Id=[NSString stringWithUTF8String:(char *)sqlite3_column_text(compileStatement, 9)];
                obj.mediaKind=[NSString stringWithUTF8String:(char *)sqlite3_column_text(compileStatement, 10)];
                obj.strmpthriURL=[NSString stringWithUTF8String:(char *)sqlite3_column_text(compileStatement, 11)];
                [arr addObject:obj];
               
            }
        }
    }
    else {
        //NSLog(@"error in database");
    }
    return arr;
}

@end
