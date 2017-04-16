//
//  mainWindow.m
//  LTMetadataEditor
//
//  Created by 苗盼盼 on 17/4/16.
//  Copyright © 2017年 Adam. All rights reserved.
//

#import "mainWindow.h"
#import "LTPhotoController.h"
@interface mainWindow ()
{
    LTPhotoController *photoDetail;
}
@end

@implementation mainWindow

- (void)viewDidLoad {
    [super viewDidLoad];
    photoDetail = [[LTPhotoController alloc]init];

}

-(void)viewDidAppear:(BOOL)animated
{
    [self presentViewController:photoDetail animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
