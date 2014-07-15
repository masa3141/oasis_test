//
//  CustomAnnotation.h
//  oasis_test
//
//  Created by mk on 2014/07/09.
//  Copyright (c) 2014年 mk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface CustomAnnotation : NSObject<MKAnnotation>

@property(nonatomic, readonly)CLLocationCoordinate2D coordinate;
@property(nonatomic, copy)NSString *title;
@property(nonatomic, copy)NSString *subtitle;

-(id)initWithCoordinates:(CLLocationCoordinate2D)co newTitle:(NSString *)t newSubTitle:(NSString *)st;
@end
