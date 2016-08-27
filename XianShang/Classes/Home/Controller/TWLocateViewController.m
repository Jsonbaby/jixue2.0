//
//  TWLocateViewController.m
//  XianShang
//
//  Created by tao wai on 16/7/7.
//  Copyright © 2016年 jixuejiyong. All rights reserved.
//

#import "TWLocateViewController.h"
#import <CoreLocation/CoreLocation.h>
@interface TWLocateViewController ()<CLLocationManagerDelegate>
@property (nonatomic, strong) CLLocationManager *lM;
/** 地理编码 */
@property (nonatomic, strong) CLGeocoder *geoC;
@end

@implementation TWLocateViewController

- (CLLocationManager *)lM
{
    if (!_lM) {
        // 1.创建位置管理者
        _lM = [[CLLocationManager alloc] init];
         _lM.delegate = self;
        _lM.distanceFilter = 100;
        // 精确度越高，越耗电，定位时间越长
        _lM.desiredAccuracy = kCLLocationAccuracyBest;
        // ios8.0定位适配
        // 前后台定位授权
//        [_lM requestAlwaysAuthorization];
        // 前台定位授权
        if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
             [_lM requestWhenInUseAuthorization];
        }
       
//        if ([[UIDevice currentDevice].systemVersion floatValue] >= 9.0) {
//            _lM.allowsBackgroundLocationUpdates = YES;
//        }
    }
    return _lM;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
    self.title = @"地点";
  
    // 2.使用位置管理者，开始更新用户位置
    [self.lM startUpdatingLocation];
}
- (CLGeocoder *)geoC
{
    if (!_geoC) {
        _geoC = [[CLGeocoder alloc] init];
    }
    return _geoC;
}
#pragma mark -<CLLocationManagerDelegate>
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    NSLog(@"定位到了");
    // 拿到位置，做一些业务逻辑操作
    CLLocation *location = [locations lastObject];
    
   
    double lati = location.coordinate.latitude;
    double longi = location.coordinate.longitude;
    // TODO: 容错
    
    CLLocation *loc = [[CLLocation alloc] initWithLatitude:lati longitude:longi];
    [self.geoC reverseGeocodeLocation:loc completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if(error == nil)
        {
            
            [placemarks enumerateObjectsUsingBlock:^(CLPlacemark * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                NSLog(@"%@--%zd", obj.name,placemarks.count);
                
                
                
            }];
        }else
        {
            NSLog(@"cuowu");
        }
        
    }];

    // 停止更新
//    [manager stopUpdatingLocation];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)cancel{
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"locate";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    // 2.如果没有可循环利用的cell
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"不显示";
    }else{
        cell.imageView.image = [UIImage imageNamed:@"locate1"];
        cell.textLabel.text = @"杭州运河产业园";
    }
   return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
