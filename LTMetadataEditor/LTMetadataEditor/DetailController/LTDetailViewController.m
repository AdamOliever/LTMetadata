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
    UIView     * toolBarView;
    UIButton   * backButton;
}
@end

@implementation LTDetailViewController
-(instancetype)initWithFrame:(CGRect)frame andImage:(UIImage*)image
{
    if(self = [super init])
    {
        currentImage = image;
        toolBarView = [[UIView alloc]initWithFrame:[self getToolBarViewRect]];
        toolBarView.backgroundColor = [UIColor grayColor];
        backButton = [[UIButton alloc]initWithFrame:[self getBackButtonRect]];
        UIImage* iconImage = [UIImage imageNamed:@"back_48px_1199464_easyicon.net.png"];
        [backButton setImage:iconImage forState:UIControlStateNormal];
        [toolBarView addSubview:backButton];
        currentImageView = [[UIImageView alloc]initWithFrame:[self getCurrentImageViewRect:currentImage]];
        [currentImageView setImage:currentImage];
        self->metadataTable = [[UITableView alloc] initWithFrame:[self getMetadataTableRect:currentImageView] style:UITableViewStylePlain];
    }
    return self;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:currentImageView];
    [self.view addSubview:metadataTable];
    [self.view addSubview:toolBarView];
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
    float imageViewY      = [UIScreen mainScreen].bounds.origin.y + statusBarHeight + toolBarView.frame.size.height;
    float imageViewWidth  = [UIScreen mainScreen].bounds.size.width / 4;
    float imageViewHeight = imageViewWidth * imageRatio;
    return  CGRectMake(0, imageViewY, imageViewWidth, imageViewHeight);
}
-(CGRect)getMetadataTableRect:(UIImageView*)imageView
{
    float tableViewY      = [UIScreen mainScreen].bounds.origin.y + statusBarHeight + imageView.frame.size.height+5 + toolBarView.frame.size.height;
    float tableViewWidth  = [UIScreen mainScreen].bounds.size.width;
    float tableViewHeight = [UIScreen mainScreen].bounds.size.height - statusBarHeight - imageView.frame.size.height;
    return  CGRectMake(0, tableViewY, tableViewWidth, tableViewHeight);
}

-(CGRect)getBackButtonRect
{
    float BackButtonX = 5;
    float BackButtony = 5;
    
    float BackButtonWidth = 48;
    return CGRectMake(BackButtonX, BackButtony, BackButtonWidth, BackButtonWidth);
}

-(CGRect) getToolBarViewRect
{
    float toolBarViewWidth = [UIScreen mainScreen].bounds.size.width;
    return CGRectMake(0, 0, toolBarViewWidth, 60);
}
- (void) setCurrentImage:(UIImage*)image
{
    if(image)
    {
        self->currentImage = image;
    }
    self-> currentImage = nil;//placeholder
}

-(BOOL)prefersStatusBarHidden
{
    return  YES;
}
@end
