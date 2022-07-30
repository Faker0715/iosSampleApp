//
//  GTNewsViewController.m
//  SampleApp
//
//  Created by faker on 2022/7/25.
//

#import "GTNewsViewController.h"
#import "GTNormalTableViewCell.h"
#import "GTDetailViewController.h"
#import "GTDeleteCellView.h"
//@interface TestView : UIView
//@end

//@implementation TestView
//
//- (instancetype)init{
//    self = [super init];
//    if (self){
//
//    }
//    return self;
//}
//
//-(void)willMoveToSuperview:(nullable UIView *)newSuperview{
//    [super willMoveToSuperview:newSuperview];
//}
//
//-(void)didMoveToSuperview{
//    [super didMoveToSuperview];
//}
//
//-(void)willMoveToWindow:(nullable UIWindow *)newWindow{
//    [super willMoveToWindow: newWindow];
//}
//
//-(void)didMoveToWindow{
//    [super didMoveToWindow];
//}
//
//@end




@interface GTNewsViewController () <UITableViewDataSource,UITableViewDelegate,GTNormalTableViewCellDelegate>
@property(nonatomic,strong,readwrite) UITableView *tableView;
@property(nonatomic,strong,readwrite) NSMutableArray *dataArray;
@end


@implementation GTNewsViewController

- (instancetype)init{
    self = [super init];
    if(self){
        _dataArray = @[].mutableCopy;
        for(int i = 0;i < 20;++i){
            [_dataArray addObject:@(i)];
        }
    }
    return self;
}

//- (void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear: animated];
//}
//- (void)viewDidAppear:(BOOL)animated{
//    [super viewDidAppear: animated];
//}
//- (void)viewWillDisappear:(BOOL)animated{
//    [super viewWillDisappear: animated];
//}
//- (void)viewDidDisappear:(BOOL)animated{
//    [super viewDidDisappear: animated];
//}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self.view addSubview:({
//            UILabel *label = [[UILabel alloc] init];
//            label.text = @"hello world";
//            [label sizeToFit];
//            label.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
//            label;
//        })];
//    UIView *view = [[UIView alloc] init];
//    view.backgroundColor = [UIColor redColor];
//    view.frame = CGRectMake(100,100,100,100);
//    [self.view addSubview:view];
    
//    TestView *view = [[TestView alloc] init];
//    view.backgroundColor = [UIColor greenColor];
//    view.frame = CGRectMake(150,150,100,100);
//    [self.view addSubview:view];
//    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushController)];
//    [view addGestureRecognizer:tapGesture];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GTNormalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    // 没有cell才生成
    if (!cell){
        cell = [[GTNormalTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
        cell.delegate = self;
    }
    [cell layoutTableViewCell];
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;{
    
//    UIViewController *controller = [[UIViewController alloc] init];
    GTDetailViewController *controller = [[GTDetailViewController alloc] init];
    controller.title = [NSString stringWithFormat:@"%@",@(indexPath.row)];
    self.navigationController.view.backgroundColor = [UIColor whiteColor];

    [self.navigationController pushViewController:controller animated:YES];
}

//-(void)pushController{
//    UIViewController *viewcontroller = [[UIViewController alloc] init];
//    viewcontroller.view.backgroundColor = [UIColor whiteColor];
//    viewcontroller.navigationItem.title = @"内容";
//
//    viewcontroller.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle: @"右侧标题"
//                                                                                        style:UIBarButtonItemStylePlain  target:self action:nil];
//    [self.navigationController pushViewController:viewcontroller animated:YES];
//}

-(void) tableViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton*) deleteButton{
    GTDeleteCellView *deleteView = [[GTDeleteCellView alloc] initWithFrame:self.view.bounds];
    
    CGRect rect = [tableViewCell convertRect:deleteButton.frame toView:nil];
    __weak typeof(self) wself = self;
    [deleteView showDeleteViewFromPoint:rect.origin clickBlock:^{
        __strong typeof(self) strongSelf = wself;
        [strongSelf.dataArray removeLastObject];
        [strongSelf.tableView deleteRowsAtIndexPaths:@[[self.tableView indexPathForCell:tableViewCell]] withRowAnimation:UITableViewRowAnimationAutomatic];
    }];
}
@end
