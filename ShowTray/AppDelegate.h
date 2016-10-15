//
//  AppDelegate.h
//  ShowTray
//
//  Created by Ashwani on 15/10/16.
//  Copyright © 2016 Ashwani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

