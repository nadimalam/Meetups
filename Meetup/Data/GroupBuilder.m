//
//  GroupBuilder.m
//  Meetup
//
//  Created by Nadim Alam on 12/12/2017.
//  Copyright © 2017 Nadim Alam. All rights reserved.
//

#import "GroupBuilder.h"
#import "Group.h"

@implementation GroupBuilder

+ (NSArray *)groupsFromJSON:(NSData *)objectNotation error:(NSError **)error
{    
    NSError *localError = nil;
    NSDictionary *parsedObject = [NSJSONSerialization JSONObjectWithData:objectNotation options:0 error:&localError];
    
    if (localError != nil) {
        *error = localError;
        return nil;
    }
    
    NSMutableArray *groups = [[NSMutableArray alloc] init];
    
    NSArray *results = [parsedObject valueForKey:@"results"];
    NSLog(@"Count %lu", (unsigned long)results.count);
    
    for (NSDictionary *groupDic in results) {
        Group *group = [[Group alloc] init];
        
        for (NSString *key in groupDic) {
            if ([group respondsToSelector:NSSelectorFromString(key)]) {
                group.name = groupDic[@"name"];
                group.city = groupDic[@"city"];
                group.who = groupDic[@"who"];
                group.country = groupDic[@"country"];
                group.detail = groupDic[@"description"];
            }                        
        }
        
        [groups addObject:group];
    }
    
    return groups;
}
@end
