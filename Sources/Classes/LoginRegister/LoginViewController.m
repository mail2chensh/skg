//
//  LoginViewController.m
//  SKGDemo
//
//  Created by chensh on 15-5-26.
//  Copyright (c) 2015年 Chensh. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginRootView.h"
#import "InfoEditGroupView.h"

@interface LoginViewController ()
{
    LoginRootView *_rootView;
}
@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    //
    _rootView = [[LoginRootView alloc] initWithFrame:self.view.frame];
    self.view = _rootView;
    //
    [_rootView.scrollView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewDidTouch:)]];
    [_rootView.segControl addTarget:self action:@selector(segControlDidChanged:) forControlEvents:UIControlEventValueChanged];
    [_rootView.button addTarget:self action:@selector(buttonDidTouch:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark -

- (void)scrollViewDidTouch:(id)sender
{
    [_rootView.loginView allTextFieldResignFirstResponder];
    [_rootView.registerView allTextFieldResignFirstResponder];
}

- (void)segControlDidChanged:(UISegmentedControl*)sender
{
    [_rootView showViewWithSegIndex:sender.selectedSegmentIndex];
}

- (void)buttonDidTouch:(id)sender
{
    if (_rootView.segControl.selectedSegmentIndex == 0) {
        
    } else {
        
    }
}

@end
