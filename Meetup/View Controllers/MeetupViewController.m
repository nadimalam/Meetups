//
//  MeetupViewController.m
//  Meetup
//
//  Created by Nadim Alam on 12/12/2017.
//  Copyright © 2017 Nadim Alam. All rights reserved.
//

#import "MeetupViewController.h"
#import "Group.h"
#import "MeetupManager.h"
#import "MeetupCommunicator.h"
#import "MeetupTableViewCell.h"

@interface MeetupViewController ()  {
    NSArray *_groups;
    MeetupManager *_manager;
}
@end

@implementation MeetupViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _manager = [[MeetupManager alloc] init];
    _manager.communicator = [[MeetupCommunicator alloc] init];
    _manager.communicator.delegate = _manager;
    _manager.delegate = self;
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [locationManager startUpdatingLocation];
    
    if ([locationManager respondsToSelector:
         @selector(requestWhenInUseAuthorization)]) {
        [locationManager requestWhenInUseAuthorization];
        
        [self startFetchingGroups];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)startFetchingGroups
{
    [_manager fetchGroupsAtCoordinate: locationManager.location.coordinate];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"OldLocation %f %f", oldLocation.coordinate.latitude, oldLocation.coordinate.longitude);
    NSLog(@"NewLocation %f %f", newLocation.coordinate.latitude, newLocation.coordinate.longitude);
}

- (void)didReceiveGroups:(NSArray *)groups
{
    _groups = groups;
    [locationManager stopUpdatingLocation];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

- (void)fetchingGroupsFailedWithError:(NSError *)error
{
    NSLog(@"Error %@; %@", error, [error localizedDescription]);
    [locationManager stopUpdatingLocation];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _groups.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MeetupTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MeetupCell" forIndexPath:indexPath];
    
    Group *group = _groups[indexPath.row];
    [cell.nameLabel setText:group.name];
    [cell.whoLabel setText:group.who];
    [cell.cityLabel setText:[NSString stringWithFormat:@"%@, %@", group.city, group.country]];
    [cell.detailLabel setText:group.detail];
    
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
