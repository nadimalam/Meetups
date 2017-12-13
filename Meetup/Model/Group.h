//
//  Group.h
//  Meetup
//
//  Created by Nadim Alam on 12/12/2017.
//  Copyright © 2017 Nadim Alam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Group : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *detail;
@property (strong, nonatomic) NSString *who;
@property (strong, nonatomic) NSString *country;
@property (strong, nonatomic) NSString *city;

@end
