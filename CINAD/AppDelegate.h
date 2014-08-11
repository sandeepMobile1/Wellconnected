//
//  AppDelegate.h
//  WZIM
//
//  Created by josepth on 11/18/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ClockViewController_iPhone.h"
#import "Alarm.h"


#define  sharedDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)


@interface AppDelegate : NSObject <UIApplicationDelegate,NSXMLParserDelegate >
{
    
    
    ClockViewController_iPhone*clockViewController;
    
    BOOL uiIsVisible;
    
     Alarm*alarm;
}
@property (strong, nonatomic) UIWindow *window;
@property (nonatomic) BOOL uiIsVisible;


-(void)updateAlarms ;
@end
 
