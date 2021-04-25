//
//  ViewController.m
//  PhotoTest
//
//  Created by Ilya on 08/06/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import "ViewController.h"
#import "GRPFilterModel.h"
#import "GRPFilterFabric.h"

@interface ViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIImage *originalImage;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray<GRPFilterModel *> *filters;
@property (nonatomic, strong) GRPFilterFabric *fabric;
@property (nonatomic, strong) CIContext *context;
@property (nonatomic, strong) UIButton *clearButton;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(leftButtonTapped)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Photo" style:UIBarButtonItemStylePlain target:self action:@selector(rightButtonTapped)];
    
    self.fabric = [GRPFilterFabric new];
    
    self.filters = @[
                     [self.fabric createSepiaFilter],
                     [self.fabric createBoxBlurFilter],
                     [self.fabric createDiscBlurFilter],
                     [self.fabric createMedianBlurFilter],
                     [self.fabric createZoomBlurFilter]
                     ];
    
    [self setupImageView];
    [self setupTableView];
    [self setupClearButton];
    
    self.context = [CIContext contextWithOptions:nil];
}

- (void)setupImageView
{
    self.imageView = [UIImageView new];
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.imageView];
    
    [self.imageView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor].active=YES;
    [self.imageView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active=YES;
    [self.imageView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active=YES;

    [self.imageView.heightAnchor constraintEqualToAnchor:self.imageView.widthAnchor].active=YES;
    
}

- (void)setupTableView
{
    self.tableView = [UITableView new];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"reuseID"];
    
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.tableView];
    
    [self.tableView.topAnchor constraintEqualToAnchor:self.imageView.bottomAnchor].active=YES;
    [self.tableView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active=YES;
    [self.tableView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active=YES;
    [self.imageView.heightAnchor constraintEqualToAnchor:self.imageView.widthAnchor].active=YES;
}

- (void)setupClearButton
{
    self.clearButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.clearButton setTitle:@"Clear filter" forState:UIControlStateNormal];
    [self.clearButton setTitleColor:UIColor.redColor forState:UIControlStateNormal];
    [self.clearButton addTarget:self action:@selector(clearFilter) forControlEvents:UIControlEventTouchUpInside];
    self.clearButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.clearButton];
    
    [self.clearButton.topAnchor constraintEqualToAnchor:self.tableView.bottomAnchor].active=YES;
    [self.clearButton.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active=YES;
    [self.clearButton.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active=YES;
    [self.clearButton.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active=YES;
}

- (void)clearFilter
{
    if (self.originalImage)
    {
        self.imageView.image = self.originalImage;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.filters.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseID" forIndexPath:indexPath];
    GRPFilterModel *model = self.filters[indexPath.row];
    cell.textLabel.text = model.name;
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Фильтры";
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.imageView.image)
    {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        GRPFilterModel *filterModel = self.filters[indexPath.row];
        
        CIImage *beginImage = [[CIImage alloc] initWithImage:self.originalImage];
        
        CIContext *context = self.context;
        
        NSMutableDictionary<NSString *, id> *parameters = [filterModel.parameters mutableCopy];
        [parameters setObject:beginImage forKey:kCIInputImageKey];
        
        CIFilter *filter = [CIFilter filterWithName:filterModel.name withInputParameters:parameters];
        
        CIImage *outputImage = [filter valueForKey:kCIOutputImageKey];
        
        // Создаем Bitmap
        CGImageRef cgImg = [context createCGImage:outputImage fromRect:[outputImage extent]];
        
        // Создаем изображение
        UIImage *filteredImage = [[UIImage alloc]initWithCGImage:cgImg];
        self.imageView.image = filteredImage;
        
        // Релизим ImageRef, потому как там старое C API, нужно ручками
        CGImageRelease(cgImg);
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark Actions

- (void)leftButtonTapped
{
    if (self.imageView.image)
    {
        UIImageWriteToSavedPhotosAlbum(self.imageView.image, nil, nil, nil);
        self.originalImage = nil;
        self.imageView.image = nil;
    };
}

- (void)rightButtonTapped
{
    UIImagePickerControllerSourceType typeLibrary = UIImagePickerControllerSourceTypePhotoLibrary;

    if ([UIImagePickerController isSourceTypeAvailable:typeLibrary])
    {
        UIImagePickerController *controller = [UIImagePickerController new];
        controller.sourceType = typeLibrary;
        controller.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:typeLibrary];
        [self.navigationController presentViewController:controller animated:YES completion:^{
        }];
        
        controller.delegate = self;
    };
    
}

#pragma mark UIImageViewPickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey, id> *)info
{
    self.imageView.image = info[UIImagePickerControllerOriginalImage];
    self.originalImage = info[UIImagePickerControllerOriginalImage];
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
    }];
}

@end
