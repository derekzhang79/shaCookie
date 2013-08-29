//
//  JsonViewController.h
//  miniGame
//
//  Created by 趴特萬 on 13/3/27.
//
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "RecipeInfo.h"
#import "ASIHTTPRequest.h"
#import "Person.h"
#import "WebJsonDataGetter.h"
#import "ViewController.h"
#import "MBProgressHUD.h"
@interface JsonViewController : UIViewController<RecipeInFoDelegate,UITableViewDataSource,UITableViewDataSource,WebPersonLoadLocationFinishDelegater,WebJsonDataGetFinishDelegater,CLLocationManagerDelegate>{
    CLLocation *location;
    CLLocationManager*      locationManager;
    NSArray *Array_locaions;
    RecipeInfo *myRecipe;
    ASIHTTPRequest *asiRequest;
    Person *aPerson;
    WebJsonDataGetter *webGetter;
}
@property (strong, nonatomic) IBOutlet UITableView *tableView_Json;
- (IBAction)button_Back:(id)sender;

@end
