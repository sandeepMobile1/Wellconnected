
#import "AdiWebView.h"
#import "AppDelegate.h"
#import "MainTabBarController.h"
@implementation AdiWebView


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
       
      
    }
    return self;
}
- (void)dismiss {
    
    [self.parentViewController dismissViewControllerAnimated:YES completion:nil  ];
    
    
    
   // TTNavigator* navigator = [(AppDelegate *)[[UIApplication sharedApplication] delegate]  navigator ];
   // CGRect r = [ UIScreen mainScreen ].applicationFrame;
    
  //  MainTabBarController *mainTab =  (MainTabBarController *)navigator.rootViewController;
  //  TTNavigationController *ttnav  = (TTNavigationController *)mainTab.topSubcontroller;
   // ttnav.topViewController.navigationController.navigationBar.frame = CGRectMake(0, 20, r.size.width,78 );
    
}



 
 - (void)viewWillAppear:(BOOL)animated {
     
     
     self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                                             target:self action:@selector(dismiss)] autorelease];
     
     
     /**
 
 TTNavigator* navigator = [(AppDelegate *)[[UIApplication sharedApplication] delegate]  navigator ];
 CGRect r = [ UIScreen mainScreen ].applicationFrame;
 
 MainTabBarController *mainTab =  (MainTabBarController *)navigator.rootViewController;
 
 TTNavigationController *ttnav  = (TTNavigationController *)mainTab.topSubcontroller;
 
 NSLog(@"%@", ttnav.topViewController) ;
 
 ttnav.topViewController.navigationController.navigationBar.frame = CGRectMake(0, 20, r.size.width,78 );
      
      */
 
 }



 
@end
