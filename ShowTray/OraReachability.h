//
//  OraReachability.h
//  Oralift
//
//  Created by Admin on 2/8/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Reachability;

@interface OraReachability : NSObject


@property (strong, nonatomic) Reachability *reachability;

#pragma mark Shared Manager

+ (id)sharedManager;

#pragma mark Class Methods

+ (BOOL)isReachable;
+ (BOOL)isUnreachable;
+ (BOOL)isReachableViaWWAN;
+ (BOOL)isReachableViaWiFi;

@end