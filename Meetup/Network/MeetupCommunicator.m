//
//  MeetupCommunicator.m
//  Meetup
//
//  Created by Nadim Alam on 12/12/2017.
//  Copyright © 2017 Nadim Alam. All rights reserved.
//

#import "MeetupCommunicator.h"
#import "MeetupCommunicatorDelegate.h"

#define API_KEY @"1a4a6e5623316d49954e80594a71"
#define PAGE_COUNT 20

@implementation MeetupCommunicator

- (void)searchGroupsAtCoordinate:(CLLocationCoordinate2D)coordinate
{
    NSString *urlAsString = [NSString stringWithFormat:@"https://api.meetup.com/2/groups?lat=%f&lon=%f&page=%d&key=%@", coordinate.latitude, coordinate.longitude, PAGE_COUNT, API_KEY];
    
    NSLog(@"%@", urlAsString);
    
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:urlAsString]
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
                
                if (error) {
                    [self.delegate fetchingGroupsFailedWithError:error];
                } else {
                    [self.delegate receivedGroupsJSON:data];
                }
                
    }] resume];
}

@end
