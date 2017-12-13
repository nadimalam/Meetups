//
//  MeetupManager.h
//  Meetup
//
//  Created by Nadim Alam on 12/12/2017.
//  Copyright © 2017 Nadim Alam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "MeetupManagerDelegate.h"
#import "MeetupCommunicatorDelegate.h"

@class MeetupCommunicator;

@interface MeetupManager : NSObject

@property (strong, nonatomic) MeetupCommunicator *communicator;
@property (weak, nonatomic) id delegate;

- (void)fetchGroupsAtCoordinate:(CLLocationCoordinate2D)coordinate;

@end
