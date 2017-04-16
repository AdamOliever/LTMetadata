//
//  LTDetailViewController.m
//  LTMetadataEditor
//
//  Created by 苗盼盼 on 17/4/15.
//  Copyright © 2017年 Adam. All rights reserved.
//

#import "LTDetailViewController.h"
static float statusBarHeight = 20;
@interface LTDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView* metadataTable;
    UIImageView* currentImageView;
    UIImage    * currentImage;
}
@end

@implementation LTDetailViewController
-(instancetype)initWithFrame:(CGRect)frame andImage:(UIImage*)image
{
    if(self = [super init])
    {
        currentImage = image;
        currentImageView = [[UIImageView alloc]initWithFrame:[self getCurrentImageViewRect:currentImage]];
        self->metadataTable = [[UITableView alloc] initWithFrame:[self getMetadataTableRect:currentImageView] style:UITableViewStylePlain];
    }
    return self;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
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
#pragma mark - tableDatasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [[UITableViewCell alloc]init];
}


#pragma mark - get && set function

-(NSData*) getDataFromImage:(UIImage*)image
{
    NSData* imageData = UIImageJPEGRepresentation(image, 1);
    if(imageData)
    {
        return imageData;
    }
    return nil;
}

- (UIImage*) getCurrentImage
{
    if(self->currentImage)
    {
        return self->currentImage;
    }
    return nil;
}
-(CGRect)getCurrentImageViewRect:(UIImage*)image
{
    float imageRatio      = image.size.height/image.size.width;
    float imageViewY      = [UIScreen mainScreen].bounds.origin.y - statusBarHeight;
    float imageViewWidth  = [UIScreen mainScreen].bounds.size.width / 4;
    float imageViewHeight = imageViewWidth * imageRatio;
    return  CGRectMake(0, imageViewY, imageViewWidth, imageViewHeight);
}
-(CGRect)getMetadataTableRect:(UIImageView*)imageView
{
    float tableViewY      = [UIScreen mainScreen].bounds.origin.y + statusBarHeight + imageView.frame.size.height;
    float tableViewWidth  = [UIScreen mainScreen].bounds.size.width;
    float tableViewHeight = [UIScreen mainScreen].bounds.size.height - statusBarHeight - imageView.frame.size.height;
    return  CGRectMake(0, tableViewY, tableViewWidth, tableViewHeight);
}
- (void) setCurrentImage:(UIImage*)image
{
    if(image)
    {
        self->currentImage = image;
    }
    self-> currentImage = nil;//placeholder
}

@end
