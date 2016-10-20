//
//  RearViewController.m
//  Dua
//
//  Created by Sameer Siddiqui on 11/18/15.
//  Copyright © 2015 Sameer Siddiqui. All rights reserved.
//

#import "RearViewController.h"
#import "RearTableViewCell.h"
//#import "SearchViewController.h"
#import "AppDelegate.h"
#import "SWRevealViewController.h"
#import "ViewController.h"

//#import "AboutViewController.h"
//#import "FavoritesViewController.h"

@interface RearViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *topLabel;
@end

@implementation RearViewController {
        NSInteger _presentedRow;
}

+ (RearViewController*)create {
    RearViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([RearViewController class])];
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.467 green:0.761 blue:0.741 alpha:1.00];
    self.navigationController.navigationBarHidden = YES;
    self.tableView.scrollEnabled = NO;
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    self.topLabel.attributedText = [[NSAttributedString alloc]initWithString:@"Centauri"
                                                                  attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor],
                                                                               NSFontAttributeName: [UIFont fontWithName:@"AvenirNext-DemiBold" size:14.0],
                                                                               NSKernAttributeName: @(2.0f)}];
    
//    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0.0f, 167.0f, self.view.frame.size.width, 1 / UIScreen.mainScreen.scale)];
//    line.backgroundColor = [[UIColor whiteColor]colorWithAlphaComponent:0.1f];
//    [self.view addSubview:line];

}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

#pragma mark - table view delegate and data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    RearTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    [cell setBackgroundColor:[UIColor clearColor]];
    switch (indexPath.row) {
        case 0:
            [cell initializeCellWithTitle:@"Home" withImageNamed:@"home"];
            break;
        case 1:
            [cell initializeCellWithTitle:@"Policies" withImageNamed:@"policy"];
            break;

        case 2:
            [cell initializeCellWithTitle:@"Billing" withImageNamed:@"billing"];
            break;
        case 3:
            [cell initializeCellWithTitle:@"Claims" withImageNamed:@"claims"];
            break;
        case 4:
            [cell initializeCellWithTitle:@"Contact Us" withImageNamed:@"phone"];
            break;
        case 5:
            [cell initializeCellWithTitle:@"Faq" withImageNamed:@"question"];
            break;

        default:
            break;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.revealViewController setFrontViewPosition:FrontViewPositionLeft animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    
    
    if (indexPath.row == 0)
    {
        [[AppDelegate appDelegate].dashboardViewController loadWebWithURL:@"http://centauri.devweb1.keylimetie.com/a/home.html"];
    }
    else if (indexPath.row == 1)
    {
        [[AppDelegate appDelegate].dashboardViewController loadWebWithURL:@"http://centauri.devweb1.keylimetie.com/a/policies.html"];
    }

    else if (indexPath.row == 2)
    {
        [[AppDelegate appDelegate].dashboardViewController loadWebWithURL:@"http://centauri.devweb1.keylimetie.com/a/billing.html"];

    }
    else if (indexPath.row == 3)
    {
        [[AppDelegate appDelegate].dashboardViewController loadWebWithURL:@"http://centauri.devweb1.keylimetie.com/a/claims.html"];
        
    }
    else if (indexPath.row == 4)
    {
        [[AppDelegate appDelegate].dashboardViewController loadWebWithURL:@"http://portaldev.seibels.com/CSI/"];
        
    }
    else if (indexPath.row == 5)
    {
        [[AppDelegate appDelegate].dashboardViewController loadWebWithURL:@"http://centauri.devweb1.keylimetie.com/a/faq.html"];
        
    }


}

@end
