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
#import "WebJsonDataGetter.h"
@interface JsonViewController : UIViewController<UITableViewDataSource,WebJsonDataGetFinishDelegater,CLLocationManagerDelegate>{
    CLLocation *location;
    CLLocationManager*      locationManager;
    NSArray *Array_locaions;
    ASIHTTPRequest *asiRequest;
    WebJsonDataGetter *webGetter;
}
@property (strong, nonatomic) IBOutlet UITableView *tableView_Json;
@property (strong,nonatomic) NSArray *array_nearUsers;

@end
