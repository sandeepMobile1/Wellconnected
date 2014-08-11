//
//  RemindEdit.m
//  Baby
//
//  Created by Jian Zhang on 4/15/13.
//  Copyright (c) 2013 com.cti. All rights reserved.
//

#import "RemindEdit.h"
#import "AppDelegate.h"
#import "Settings.h"





@interface RemindEdit () <NIAttributedLabelDelegate>


@property (nonatomic, retain) UIToolbar *toolBar;

@end

@implementation RemindEdit
 
 
@synthesize selectDate;







-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear: animated] ;
    
    self.navigationController.navigationBarHidden = YES;
  
   
}
- (void) cancel{
    
    [self dismissViewControllerAnimated:YES completion:nil ] ;
}
- (void)loadView
{
    [super loadView];
    
    
    /**
     
    UIBarButtonItem *cancel= [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel  target:self action:@selector(cancel)];
    //self.navigationItem.leftBarButtonItem = cancel;
    
     UIBarButtonItem *save= [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave  target:self action:@selector(save)];
     //self.navigationItem.rightBarButtonItem = save;
    
  
    [[NSNotificationCenter defaultCenter]  addObserver:self
                                              selector:@selector(refreshTable:)
                                                  name:@"refreshTable"
                                                object:nil];
     
     */
 
    
   // NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init] ;
    //[dateFormat setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    ///NSString *dateString = [dateFormat stringFromDate:[NSDate date] ];

  //  self.dataSource = [[RemindEditDataSource  alloc] initWithSearchQuery:@""  ];
    
    /////////////////////////////////////////////////
    
    NSString*headerImage      =  [[NSUserDefaults standardUserDefaults]  objectForKey:@"headerImage"];
    
    NINetworkImageView*imgV1= [[NINetworkImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    [imgV1 setPathToNetworkImage:  headerImage];
    // imgV1.image = [UIImage imageNamed:@"img1.png"];
    [self.view addSubview:imgV1];
    
    
 
    NSString* kText = @" <span class=\"redText\">If app is open,the stream will start at alarm time. If app is in background mode or closed, an alert will appear at alarm time.</span><br>\
    <span class=\"yText\">Please keep phone unmuted.</span>";
 
    
    NIAttributedLabel* label = [[NIAttributedLabel alloc] initWithFrame:CGRectZero];
 
    
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.autoresizingMask = UIViewAutoresizingFlexibleDimensions;
    label.frame = CGRectInset(self.view.bounds, 20, 20);
    label.font =  [UIFont systemFontOfSize:17];
    label.delegate = self;
    label.autoDetectLinks = YES;
    
    // Turn on all available data detectors. This includes phone numbers, email addresses, and
    // addresses.
    label.dataDetectorTypes = NSTextCheckingAllSystemTypes;
    
    label.text = kText;
    
   // [self.view addSubview:label];
    
    
    /*
    
    TTStyledTextLabel* label1 = [[[TTStyledTextLabel alloc] initWithFrame:self.view.bounds] autorelease];
    label1.top = imgV1.bottom;
    label1.font = [UIFont systemFontOfSize:17];
    label1.text = [TTStyledText textFromXHTML:kText lineBreaks:YES URLs:YES];
    label1.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    label1.backgroundColor = [UIColor clearColor];
    label1.textAlignment = UITextAlignmentCenter;
    [label1 sizeToFit];
    [self.view addSubview:label1];
    
    
    */
    

    myDatePicker = [ [ UIDatePicker alloc] initWithFrame:CGRectMake(0.0,160,0.0,0.0)];
    [myDatePicker setDatePickerMode:UIDatePickerModeDateAndTime ];
    [myDatePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged ];
    [myDatePicker setDate:[NSDate date] animated:YES ] ;
    [myDatePicker setTimeZone:[NSTimeZone defaultTimeZone]];
    myDatePicker.backgroundColor = [UIColor grayColor] ;
    [self.view addSubview:myDatePicker];
    
    UISwitch* switchy = [[[UISwitch alloc] initWithFrame:CGRectMake(0, myDatePicker.bottom+5, 100,28)] autorelease];
    [switchy addTarget:self action:@selector(alarm:) forControlEvents:UIControlEventValueChanged ] ;
    
    /**
    NSString *alarm = [[NSUserDefaults standardUserDefaults ] objectForKey:@"alarm" ] ;
    if ( [alarm isEqualToString:@"on" ] ) {
        [switchy setOn:YES ];
    }else
        [switchy setOn:NO ];
     */
    
   
    
    [self.view addSubview:switchy ] ;
    
}
- (void)alarm:(id)sender{
    
    UISwitch* switchy =(UISwitch*)sender;
    if ( switchy.isOn ) {
        //[[NSUserDefaults standardUserDefaults ] setObject:@"on" forKey:@"alarm"];
        
        [self save] ; 
        
    }else{
       // [[NSUserDefaults standardUserDefaults ] removeObjectForKey:@"alarm"];
        [[UIApplication sharedApplication] cancelAllLocalNotifications];
        
        ///[[NSUserDefaults standardUserDefaults  ] setObject:@"" forKey:@"alarmTime" ] ;
        
       // [[NSNotificationCenter defaultCenter]  postNotificationName:@"refreshTable" object:self userInfo:nil ];
       
        
    }
    
}

-(void)save{
     
     //   NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init] ;
    //    [dateFormat setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
     //   NSString *dateString = [dateFormat stringFromDate:[myDatePicker date] ];
     //   NSDate *notificationDate = [dateFormat dateFromString:dateString];

    UILocalNotification *notification=[[UILocalNotification alloc] init];
    if (notification!=nil) {
            
        notification.timeZone = [NSTimeZone defaultTimeZone];
        notification.repeatInterval=0;
        

       // notification.applicationIconBadgeNumber = 1;
        notification.alertAction = NSLocalizedString(@"显示", nil);
        //notification.hasAction = NO;
 
        notification.fireDate = [myDatePicker date];
        
      //  notification.fireDate= [[NSDate date ]  dateByAddingTimeInterval:10];
        
        NSLog(@" notification.fireDate%@", notification.fireDate) ;
        
        notification.alertBody=@"Tap here to go to app";
        
         [notification setSoundName:UILocalNotificationDefaultSoundName];
        
        
      //  Settings*settings = [Settings sharedSettings];
      //  insist (settings);
        notification.soundName = @"alarm-clock-1.mp3";
        
        
        
        
        NSDictionary *dict = [NSDictionary dictionaryWithObject:@"value" forKey:@"key"];
        [notification setUserInfo:dict];
        
        [[UIApplication sharedApplication]   scheduleLocalNotification:notification];
    }
    [notification release];  
   // [self dismissViewControllerAnimated:YES completion:nil ] ;
}


- (IBAction)dateChanged:(id)sender {
    
    UIDatePicker* datePicker = (UIDatePicker*)sender;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    
    //self.selectDate =[formatter stringFromDate: [datePicker date] ];
    
   // self.selectDate =   [myDatePicker date]  ;
    
   // [[NSUserDefaults standardUserDefaults  ] setObject:self.selectDate forKey:@"alarmTime" ] ;
    
 //   self.dataSource = [[RemindEditDataSource  alloc] initWithSearchQuery:@""  ];
    
    
}

- (void)refreshTable:(NSNotification*)notification
{
   // self.dataSource = [[RemindEditDataSource  alloc] initWithSearchQuery:@""  ];
   
}

@end
