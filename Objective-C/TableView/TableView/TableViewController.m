//
//  TableViewController.m
//  TableView
//
//  Created by yukaPriL on 2017/10/28.
//  Copyright © 2017年 yukaPriL. All rights reserved.
//

#import "TableViewController.h"
#import "ViewController.h"
#import "MessageInfo.h"
#import "CustomTableViewCell.h"

@interface TableViewController ()
@property (nonatomic, strong) NSArray *sections;
@property (nonatomic, strong) NSArray *rows;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //    self.sections = @[@"Section A", @"Section B", @"Section C", @"Section D"];
    //    self.rows = @[
    //                  @[@"Row 0\nNext Line\nNext Line", @"Row 1"],
    //                  @[@"Row 0", @"Row 1", @"Row 2"],
    //                  @[],
    //                  @[@"Row 0", @"Row 1", @"Row 2", @"Row 3"]
    //                  ];
    //
    //    // 设置分割线颜色
    //    self.tableView.separatorColor = [UIColor magentaColor];
    
    MessageInfo *msgInfo = [[MessageInfo alloc]init];
    msgInfo.title = @"我的资产";
    msgInfo.detail = @"你有一个新的优惠选信息，点击查看。测试测试。";
    msgInfo.hintNum = 5;
    msgInfo.timeString = @"21:35";
    self.sections = @[@"Section A", @"Section B"];
    self.rows = @[
                  @[msgInfo, @"Row 1"],
                  @[@"Row 0", @"Row 1"]
                  ];
    
    // 设置右侧索引样式
    self.tableView.sectionIndexBackgroundColor = [UIColor clearColor];
    self.tableView.sectionIndexColor = [UIColor grayColor];
    self.tableView.sectionIndexTrackingBackgroundColor = [UIColor clearColor];
    
    // 设置全局 header
    UIView *header = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 40)];
    header.backgroundColor = [UIColor greenColor];
    self.tableView.tableHeaderView = header;
    
    // 当内容没有footer 时候，会显示多余横线，设置 footer 即可解决
//    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *rowArray = self.rows[section];
    return rowArray.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *rowArray = self.rows[indexPath.section];
    if(indexPath.section == 0 && indexPath.row == 0){
        MessageInfo *msgInfo = rowArray[indexPath.row];
        CustomTableViewCell *customCell = [self genCustomCell];
        [customCell setupMsgInfo:msgInfo];
        return customCell;
    }else{
        NSString *title = rowArray[indexPath.row];
        UITableViewCell *cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
        cell.textLabel.text = title;
        cell.textLabel.numberOfLines = 0;
        cell.textLabel.textColor = [UIColor redColor];
        cell.detailTextLabel.text = @"detail";
        cell.detailTextLabel.textColor = [UIColor grayColor];
        cell.accessoryType = UITableViewCellAccessoryDetailButton;
        cell.imageView.image = [UIImage imageNamed:@"broadcast"];
        return cell;
    }
}

- (CustomTableViewCell *)genCustomCell{
    NSArray *toplevelObject = [[NSBundle mainBundle] loadNibNamed:@"CustomTableViewCell" owner:nil options:nil];
    return [toplevelObject objectAtIndex:0];
}

// 区域消息头
- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return self.sections[section];
}

// 区域消息尾
- (nullable NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    return [NSString stringWithFormat:@"%@ END",self.sections[section]];
}

// 右侧显示索引
- (nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return self.sections;
}

# pragma mark - Table view delegate
// 设置高度
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if(indexPath.section == 0 && indexPath.row == 0){
//        return 80;
//    }
//    return 40;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return 30;
//}
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    return 30;
//}


// 自定义 Header / Footer
//- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 30)];
//    [view setBackgroundColor:[UIColor redColor]];
//    UILabel *label = [[UILabel alloc]initWithFrame:view.bounds];
//    [label setText:self.sections[section]];
//    [view addSubview:label];
//    return view;
//}
//- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
//    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 30)];
//    [view setBackgroundColor:[UIColor grayColor]];
//    UILabel *label = [[UILabel alloc]initWithFrame:view.bounds];
//    [label setText: [self.sections[section] stringByAppendingString:@" END"] ];
//    [view addSubview:label];
//    return view;
//}

// 控制选中
- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0 && indexPath.row == 1){
        return NO;
    }
    return YES;
}
- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"highlight:%@",indexPath);
}
- (void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath {}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ViewController *vc = [[ViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


@end

