//
//  MeetupTableViewCell.h
//  Meetup
//
//  Created by Nadim Alam on 12/12/2017.
//  Copyright © 2017 Nadim Alam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MeetupTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *whoLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@end
