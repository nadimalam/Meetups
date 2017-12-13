//
//  MeetupViewController.h
//  Meetup
//
//  Created by Nadim Alam on 12/12/2017.
//  Copyright © 2017 Nadim Alam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MeetupViewController : UITableViewController <CLLocationManagerDelegate> {
    CLLocationManager *locationManager;
}

@end
