//
//  MeetupCommunicator.h
//  Meetup
//
//  Created by Nadim Alam on 12/12/2017.
//  Copyright © 2017 Nadim Alam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@protocol MeetupCommunicatorDelegate;

@interface MeetupCommunicator : NSObject

@property (weak, nonatomic) id delegate;

- (void)searchGroupsAtCoordinate:(CLLocationCoordinate2D)coordinate;

@end
