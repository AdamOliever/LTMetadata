//
//  LTPhotoController.m
//  LTMetadataEditor
//
//  Created by adam on 17/4/15.
//  Copyright © 2017年 Adam. All rights reserved.
//

#import "LTPhotoController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <ImageIO/ImageIO.h>
#import  <Photos/Photos.h>

@interface LTPhotoController ()<UIImagePickerControllerDelegate,UINavigationBarDelegate>
@property (strong, nonatomic) UIImagePickerController *imagePickerController;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextView *resultTextView;
@end

@implementation LTPhotoController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
   
    //[self dismissViewControllerAnimated:YES completion:nil];
    // Do any additional setup after loading the view.
}
-(void)viewDidAppear:(BOOL)animated
{
    UIImagePickerController *ctrl = [[UIImagePickerController alloc] init];
    ctrl.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    ctrl.delegate = self;
    ctrl.view.backgroundColor = [UIColor yellowColor];
    [self presentViewController:ctrl animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)pickPhotoAction:(id)sender
{
    [self presentImagePicker];
}

#pragma mark - UIImagePickerControllerDelegate

- (void)presentImagePicker {
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        NSLog(@"[%@ %@] : Not Allowed To Open Photo Library!", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
        return;
    }
    
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePickerController.delegate = self;
    
    self.imagePickerController = imagePickerController;
    [self presentViewController:self.imagePickerController animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
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
