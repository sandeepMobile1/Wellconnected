//
//  AppDelegate.m
//  WZIM
//
//  Created by josepth on 11/18/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseNavigationController.h"


#import "MainTabBarController.h"
#import "MyMovieViewController.h"
#import "ClockViewController_iPhone.h"


//#import "NewsViewController.h"
//#import "NewsDetail.h"
//#import "PhotoViewController.h"

#import "STeamViewController.h"



#import "FBView.h"
#import "TView.h"
#import "Website.h"
#import "InfoPage.h"
#import "SignUpView.h"

#import "Settings.h"

#import "RemindEdit.h"

#import "MyClass.h"
#import "GetXML.h"


 
 
@implementation AppDelegate


@synthesize uiIsVisible;

/*these 2 methods get called periodically to keep stuff up to date*/
-(void)updateClockLoop
{
    [clockViewController setDate:[NSDate date]];
    [self performSelector:@selector(updateClockLoop) withObject:nil afterDelay:1.0];
}


/*reset all the alarms. We call this whenever settings or locations have changed, whenever the app starts or wakes up.*/
-(void)updateAlarms
{
  //  Settings*settings = [Settings sharedSettings];
    //[scheduler rescheduleLatitude:settings.lat longitude:settings.lon];
    
    /*also update the "on" indicator in the clock.*/

    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    alarm = [[Alarm alloc] init];
   
    self.uiIsVisible = YES;
    
    [UIApplication sharedApplication ].statusBarStyle  = UIStatusBarStyleBlackTranslucent;
   
    
    [[NSUserDefaults standardUserDefaults] setObject:@"http://ice7.securenetsystems.net/CINA-FM" forKey:@"iosStreamUrl"];
    [[NSUserDefaults standardUserDefaults] setObject:@"https://www.facebook.com/cinaradio102.3fm" forKey:@"facebook"];
    [[NSUserDefaults standardUserDefaults] setObject:@"https://twitter.com"  forKey:@"twitter"];
    
    [[NSUserDefaults standardUserDefaults] setObject:@"http://cinafm.com" forKey:@"websiteUrl"];
    [[NSUserDefaults standardUserDefaults] setObject:@"http://derftghyu.itm-staging.com/pages/rss/fg-98685.rss"      forKey:@"fgUrl"];
    
    [[NSUserDefaults standardUserDefaults] setObject:@"http://cinafm.com"  forKey:@"signupUrl"];
    [[NSUserDefaults standardUserDefaults] setObject:@"http://cinafm.com/about-us/"    forKey:@"infoUrl"];
    
    
    
    [[NSUserDefaults standardUserDefaults] setObject:@"http://imgsrv.derftghyu.itm-staging.com/image/cinad/UserFiles/Image/Cinagarylogo.JPG"    forKey:@"headerImage"];
    
    [[NSUserDefaults standardUserDefaults] setObject:@"http://derftghyu.itm-staging.com/custom_code/mobile_app_banner_delivery.php?bannerxgroupid=33496" forKey:@"bannerGroupId"];
   
    
    
    
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    
    // listen
    MyMovieViewController *movieViewController = [[MyMovieViewController alloc] init];
    movieViewController.title = @"Listen";
    movieViewController.tabBarItem.image = [UIImage imageNamed:@"tabicon-listen"];
    
    BaseNavigationController *movieNavigationController = [[BaseNavigationController alloc]
                                                             initWithRootViewController:movieViewController];
    
    
    
   
    
    // remind
    RemindEdit *remindViewController = [[RemindEdit alloc] init];
    remindViewController.title = @"Alarm";
    remindViewController.tabBarItem.image = [UIImage imageNamed:@"clock"];
    
    BaseNavigationController *remindNavigationController = [[BaseNavigationController alloc]
                                                           initWithRootViewController:remindViewController];
    
    
    
    
    FBView *fbViewController = [[FBView alloc] init];
    fbViewController.title = @"Facebook";
    fbViewController.tabBarItem.image = [UIImage imageNamed:@"facebook"];
    
    BaseNavigationController *fbNavigationController = [[BaseNavigationController alloc]
                                                            initWithRootViewController:fbViewController];
  
    
    
    
    
    TView *tViewController = [[TView alloc] init];
    tViewController.title = @"Twitter";
    tViewController.tabBarItem.image = [UIImage imageNamed:@"twitter"];
    
    BaseNavigationController *tNavigationController = [[BaseNavigationController alloc]
                                                        initWithRootViewController:tViewController];
    
  

    
    Website *websiteController = [[Website alloc] init];
    websiteController.title = @"Website";
    websiteController.tabBarItem.image = [UIImage imageNamed:@"tabicon-home"];
    
    BaseNavigationController *websiteNavigationController = [[BaseNavigationController alloc]
                                                       initWithRootViewController:websiteController];
    
    
    
    InfoPage *infoPageController = [[InfoPage alloc] init];
    infoPageController.title = @"Info page";
    infoPageController.tabBarItem.image = [UIImage imageNamed:@""];
    
    BaseNavigationController *infoPageNavigationController = [[BaseNavigationController alloc]
                                                             initWithRootViewController:infoPageController];
    
    
    
    
    
    
    // tab bar
    MainTabBarController *rootTabBarController = [[MainTabBarController alloc] init];
    rootTabBarController.viewControllers = [NSArray arrayWithObjects:movieNavigationController,
                                            remindNavigationController,  fbNavigationController,tNavigationController,
                                            websiteNavigationController,
                                            infoPageNavigationController,
                                            nil];
    
    self.window.rootViewController = rootTabBarController;
    
    [self.window makeKeyAndVisible];
    
    
    [self xmlTapped];
    
    
    
    return YES;
    
    
    

        
    
}




- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{ 
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/


- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    NSLog(@"didReceiveLocalNotification") ;
   //  [alarm play] ;
    
    
    
    MainTabBarController*main = (MainTabBarController*) self.window.rootViewController;
    [main setSelectedIndex:0];
    BaseNavigationController*nav = (BaseNavigationController*)[[main viewControllers] objectAtIndex:0 ]  ;
    
    MyMovieViewController*my    =(MyMovieViewController*) nav.topViewController ;
    [my buttonPressed:nil ];

}



/*

- (void) requestAction   {
    
    TTURLRequest* request = [TTURLRequest requestWithURL:@"http://s3.amazonaws.com/awsstatic/image/cinad/mobile_xml/cinad.xml"
                                                delegate:self];
    request.cachePolicy = TTURLRequestCachePolicyNetwork ;
    request.cacheExpirationAge = TT_CACHE_EXPIRATION_AGE_NEVER;
    
    TTURLXMLResponse* response = [[TTURLXMLResponse alloc] init];
    response.isRssFeed = YES;
    request.response = response;
    TT_RELEASE_SAFELY(response);
    
    [request send];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark TTURLRequestDelegate

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)requestDidStartLoad:(TTURLRequest*)request {
    // [_requestButton setTitle:@"Loading..." forState:UIControlStateNormal];
    
    // NSLog(@"Loading...") ;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)requestDidFinishLoad:(TTURLRequest*)request {
    
    
    
    
    TTURLXMLResponse* response = request.response;
	TTDASSERT([response.rootObject isKindOfClass:[NSDictionary class]]);
    
    //  NSLog(@"%@" ,response.rootObject );
    
    
    NSString *iosStreamUrl = [[[response rootObject] objectForKey:@"iosStreamUrl"] objectForXMLNode ];
    
    NSString *facebook     = [[[response rootObject] objectForKey:@"facebook"] objectForXMLNode ];
    NSString *twitter      = [[[response rootObject] objectForKey:@"twitter"] objectForXMLNode ];
    
    NSString *websiteUrl   = [[[response rootObject] objectForKey:@"websiteUrl"] objectForXMLNode ];
    NSString *fgUrl        = [[[response rootObject] objectForKey:@"fgUrl"] objectForXMLNode ];
    
    NSString *signupUrl    = [[[response rootObject] objectForKey:@"signupUrl"] objectForXMLNode ];
    NSString *infoUrl      = [[[response rootObject] objectForKey:@"infoUrl"] objectForXMLNode ];
    
    
    
    NSString *headerImage     = [[[response rootObject] objectForKey:@"headerImage"] objectForXMLNode ];
    NSString *bannerGroupId  = [[[response rootObject] objectForKey:@"bannerGroupId"] objectForXMLNode ];
  //  NSString *featureGroup    = [[[response rootObject] objectForKey:@"featureGroup"] objectForXMLNode ];
    
    
   NSLog(@"facebook%@" , facebook);
    NSLog(@"twitter%@" , twitter);
    
    NSLog(@"websiteUrl%@" , websiteUrl);
    NSLog(@"fgUrl%@" , fgUrl);
    NSLog(@"bannerGroupId%@" , bannerGroupId);
    
    
    
    [[NSUserDefaults standardUserDefaults] setObject:iosStreamUrl forKey:@"iosStreamUrl"];
    [[NSUserDefaults standardUserDefaults] setObject:facebook forKey:@"facebook"];
    [[NSUserDefaults standardUserDefaults] setObject:twitter  forKey:@"twitter"];
    
    [[NSUserDefaults standardUserDefaults] setObject:websiteUrl forKey:@"websiteUrl"];
    [[NSUserDefaults standardUserDefaults] setObject:fgUrl      forKey:@"fgUrl"];
    
    [[NSUserDefaults standardUserDefaults] setObject:signupUrl  forKey:@"signupUrl"];
    [[NSUserDefaults standardUserDefaults] setObject:infoUrl    forKey:@"infoUrl"];
    
    
    
    [[NSUserDefaults standardUserDefaults] setObject:headerImage    forKey:@"headerImage"];
    
    [[NSUserDefaults standardUserDefaults] setObject:bannerGroupId forKey:@"bannerGroupId"];
  //  [[NSUserDefaults standardUserDefaults] setObject:featureGroup   forKey:@"featureGroup"];
    
    
   // [MyClass parseDefault];
   
    //[[NSNotificationCenter defaultCenter]postNotificationName:@"refreshTable" object:self userInfo:nil ];
    
    
    if (![navigator restoreViewControllers]) {
        // This is the first launch, so we just start with the tab bar
        [navigator openURLAction:[TTURLAction actionWithURLPath:@"tt://tabBar"]];
        
    }
    
    
    //MainTabBarController*main = (MainTabBarController*) navigator.rootViewController;
    
   // TTNavigationController*nav = (TTNavigationController*)[[main viewControllers] objectAtIndex:1 ]  ;
    
   // NSLog(@"df%@", nav.topViewController ) ;
    
    //clockViewController =(ClockViewController_iPhone*) nav.topViewController ;
    
    //[self updateClockLoop];
    
    
  
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)request:(TTURLRequest*)request didFailLoadWithError:(NSError*)error {
    NSLog(@"APP Failed to load, try again.");
}

*/


- (IBAction)xmlTapped{
     
      /*
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/xml", @"text/xml",nil];
  
    AFHTTPRequestOperation *operation = [manager GET:@"http://s3.amazonaws.com/awsstatic/image/cinad/mobile_xml/cinad.xml"
                                         
                                          parameters:nil
                                             success:^(AFHTTPRequestOperation *operation,  id responseObject) {
                                              
                                            //XMLParser.delegate = self;
                                              //  XMLParser setShouldProcessNamespaces:YES];
                                                // [XMLParser parse];
                                                 
                                             }
                                             failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                                 NSLog(@"FAILED%@", error);
                                             }];
    
    
    
    [operation start];
    
  
    
    
    AFXMLRequestOperation *operation =
    [AFXMLRequestOperation XMLParserRequestOperationWithRequest:request
                                                        success:^(NSURLRequest *request, NSHTTPURLResponse *response, NSXMLParser *XMLParser) {
                                                            //self.xmlWeather = [NSMutableDictionary dictionary];
                                                            XMLParser.delegate = self;
                                                            [XMLParser setShouldProcessNamespaces:YES];
                                                            [XMLParser parse];
                                                        }
                                                        failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, NSXMLParser *XMLParser) {
                                                            UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Weather"
                                                                                                         message:[NSString stringWithFormat:@"%@",error]
                                                                                                        delegate:nil
                                                                                               cancelButtonTitle:@"OK"
                                                                                               otherButtonTitles:nil];
                                                            [av show];
                                                        }];
    
    [operation start];
    
    */
    
}


@end
