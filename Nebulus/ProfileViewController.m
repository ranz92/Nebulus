//
//  ProfileViewController.m
//  Nebulus
//
//  Created by Gang Wu on 7/21/15.
//  Copyright (c) 2015 CMU-eBiz. All rights reserved.
//

#import "ProfileViewController.h"
#import "ProfileDetailViewController.h"
#import "HttpClient.h"

@interface ProfileViewController ()
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *headPhoto;
@property (weak, nonatomic) IBOutlet UIButton *postsButton;
@property (weak, nonatomic) IBOutlet UIButton *followedButton;
@property (weak, nonatomic) IBOutlet UIButton *followingButton;
@end

@implementation ProfileViewController

-(void)viewDidLoad{
    [self.headPhoto setImage:[UIImage imageNamed:@"pic2"]];
    [self.headPhoto sizeToFit];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [self.userNameLabel setText:[defaults objectForKey:@"username"]];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"Clips"]) {
        if ([segue.destinationViewController isKindOfClass:[ProfileDetailViewController class]]) {
            ProfileDetailViewController *pdvc = (ProfileDetailViewController *)segue.destinationViewController;
            pdvc.mode = CLIPS;
            pdvc.title = segue.identifier;
        }
    } else if ([segue.identifier isEqualToString:@"Projects"]) {
        if ([segue.destinationViewController isKindOfClass:[ProfileDetailViewController class]]) {
            ProfileDetailViewController *pdvc = (ProfileDetailViewController *)segue.destinationViewController;
            pdvc.mode = PROJECTS;
            pdvc.title = segue.identifier;
        }
    } else if ([segue.identifier isEqualToString:@"Albums"]) {
        if ([segue.destinationViewController isKindOfClass:[ProfileDetailViewController class]]) {
            ProfileDetailViewController *pdvc = (ProfileDetailViewController *)segue.destinationViewController;
            pdvc.mode = ALBUMS;
            pdvc.title = segue.identifier;
        }
    } else if ([segue.identifier isEqualToString:@"followedSegue"]) {
        if ([segue.destinationViewController isKindOfClass:[UITableViewController class]]) {
            UITableViewController *tvc = (UITableViewController *)segue.destinationViewController;
            tvc.title = @"Followed";
        }
    } else if ([segue.identifier isEqualToString:@"followingSegue"]) {
        if ([segue.destinationViewController isKindOfClass:[UITableViewController class]]) {
            UITableViewController *tvc = (UITableViewController *)segue.destinationViewController;
            tvc.title = @"Following";
        }
    } else if ([segue.identifier isEqualToString:@"logout"]){
        [HttpClient logout];
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

@end
