//
//  AppDelegate.m
//  NotesForGoatsRedux
//
//  Created by Loan Wolf on 10/19/14.
//  Copyright (c) 2014 Mandy. All rights reserved.
//

#import "AppDelegate.h"
#import "goatNoteDataStore.h"


@interface AppDelegate ()
@property (strong, nonatomic) goatNoteDataStore *dataStore;
@property (strong, nonatomic) NSData *archive;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSLog(@"application didFinishLaunchingWithOptions");
    
    //self.dataStore = [goatNoteDataStore sharedGoatNotesDataStore];
   // self.dataStore = [NSKeyedUnarchiver unarchiveObjectWithData:_archive];
    NSData *archivedData = [[NSUserDefaults standardUserDefaults] objectForKey:@"goatNoteArray"];
    self.dataStore.goatNoteArray = [NSKeyedUnarchiver unarchiveObjectWithData:archivedData];
    
    return YES;

}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    NSLog(@"applicationWillResignActive");
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    NSLog(@"applicationDidEnterBackground");
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    NSLog(@"applicationDidEnterBackground");
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    NSLog(@"applicationDidBecomeActive");
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    NSLog(@"applicationWillTerminate");
}

@end
