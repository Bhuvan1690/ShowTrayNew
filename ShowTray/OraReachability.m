//
//  OraReachability.m
//  Oralift
//
//  Created by Admin on 2/8/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "OraReachability.h"

#import "Reachability.h"

@implementation OraReachability

#pragma mark Default Manager
//+ (OraReachability *)sharedManager {
//    static OraReachability *_sharedManager = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        _sharedManager = [[self alloc] init];
//    });
//    
//    return _sharedManager;
//}

+ (id)sharedManager
{
    static OraReachability *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}


#pragma mark Memory Management
- (void)dealloc {
    // Stop Notifier
    if (_reachability) {
        [_reachability stopNotifier];
    }
}


#pragma mark Class Methods

+ (BOOL)isReachable {
    return [[[OraReachability sharedManager] reachability] isReachable];
}

+ (BOOL)isUnreachable {
    return ![[[OraReachability sharedManager] reachability] isReachable];
}

+ (BOOL)isReachableViaWWAN {
    return [[[OraReachability sharedManager] reachability] isReachableViaWWAN];
}

+ (BOOL)isReachableViaWiFi {
    return [[[OraReachability sharedManager] reachability] isReachableViaWiFi];
}


#pragma mark Private Initialization
- (id)init {
    self = [super init];
    
    if (self) {
        // Initialize Reachability
        self.reachability = [Reachability reachabilityWithHostname:@"www.google.com"];
        
        // Start Monitoring
        [self.reachability startNotifier];
    }
    
    return self;
}

@end
