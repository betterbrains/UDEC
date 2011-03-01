//
//  UmDiaEuComproAppDelegate.h
//  UmDiaEuCompro
//
//  Created by Luiz Aguiar on 1/18/11.
//  Copyright 2011 Betterbrains Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UmDiaEuComproAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

