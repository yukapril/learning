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
#import "NormalTableViewCell.h"

static NSString *CUSTOM_REUSE_ID = @"CustomTableViewCell";
static NSString *NORMAL_REUSE_ID = @"NormalTableViewCell";

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
    // 设置分割线颜色
    self.tableView.separatorColor = [UIColor magentaColor];
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 50, 0, 0);
    
    MessageInfo *msgInfo = [[MessageInfo alloc]init];
    msgInfo.title = @"我的资产";
    msgInfo.detail = @"你有一个新的优惠选信息，点击查看。测试测试。";
    msgInfo.hintNum = 5;
    msgInfo.timeString = @"21:35";
    self.sections = @[@"Section A", @"Section B",@"Section C"];
    self.rows = @[
                  @[msgInfo, @"Row 1"],
                  @[@"Row 0", @"Row 1"],
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
    
    [self.tableView registerNib:[UINib nibWithNibName:@"CustomTableViewCell" bundle:nil] forCellReuseIdentifier:CUSTOM_REUSE_ID];
    [self.tableView registerClass:[NormalTableViewCell class] forCellReuseIdentifier:NORMAL_REUSE_ID];
    
    // 设置粗略高度，防止反复调用 tableView: heightForRowAtIndexPath:
    //    self.tableView.estimatedRowHeight = 50;
    
    // 设置为编辑模式
    self.tableView.editing = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
        // CustomTableViewCell *customCell = [self genCustomCell];
        // 使用 dequeue 方式实现
        CustomTableViewCell *customCell = [self.tableView dequeueReusableCellWithIdentifier:CUSTOM_REUSE_ID forIndexPath:indexPath];
        
        [customCell setupMsgInfo:msgInfo];
        return customCell;
    }else{
        NSString *title = rowArray[indexPath.row];
        
        // UITableViewCell *cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
        // 使用 dequeue 方式实现
        UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:NORMAL_REUSE_ID forIndexPath:indexPath];
        
        cell.textLabel.text = title;
        cell.textLabel.numberOfLines = 0;
        cell.textLabel.textColor = [UIColor redColor];
        cell.detailTextLabel.text = @"detail";
        cell.detailTextLabel.textColor = [UIColor grayColor];
        cell.accessoryType = UITableViewCellAccessoryDetailButton;
        cell.imageView.image = [UIImage imageNamed:@"broadcast"];
        // 选中效果
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

- (CustomTableViewCell *)genCustomCell{
    NSArray *toplevelObject = [[NSBundle mainBundle] loadNibNamed:@"CustomTableViewCell" owner:nil options:nil];
    return [toplevelObject objectAtIndex:0];
}

// 区域消息头
//- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    return self.sections[section];
//}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
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

// 设置粗略高度，防止反复调用 tableView: heightForRowAtIndexPath:
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

// 编辑中样式
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0 && indexPath.row == 0){
        return UITableViewCellEditingStyleDelete;
    }else if(indexPath.section == 0 && indexPath.row == 1){
        return UITableViewCellEditingStyleInsert;
    }else if(indexPath.section == 1){
        return UITableViewCellEditingStyleInsert | UITableViewCellEditingStyleDelete;
    }else{
        return UITableViewCellEditingStyleNone;
    }
}

// 处理编辑操作按钮
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if(editingStyle == UITableViewCellEditingStyleDelete){
        NSLog(@"del");
        //        NSMutableArray *sections = [self.rows mutableCopy];
        //        NSMutableArray *rows = [sections[indexPath.section]mutableCopy];
        //        [rows removeObjectAtIndex:indexPath.row];
        //        sections[indexPath.section] = rows;
        //        self.rows = sections;
        //        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"delete" message:@"delete this?" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            // 进行批量操作时候，必需加入 beginUpdates / endUpdates（有动画），或者 reloadData（无动画）
            [self.tableView beginUpdates];
            MessageInfo *msgInfo = [[MessageInfo alloc]init];
            msgInfo.title = @"我的资产";
            msgInfo.detail = @"你有一个新的优惠选信息，点击查看。测试测试。";
            msgInfo.hintNum = 5;
            msgInfo.timeString = @"21:35";
            self.sections = @[@"Section A", @"Section B",@"Section C"];
            self.rows = @[
                          @[msgInfo],
                          @[@"Row 0", @"Row 1", @"Row Add"],
                          @[@"Row 0", @"Row 1"]
                          ];
            [self.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:1 inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
            [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:2 inSection:1]] withRowAnimation:UITableViewRowAnimationAutomatic];
            [self.tableView endUpdates];
            //        [self.tableView reloadData];
        }];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alert addAction:confirmAction];
        [alert addAction:cancelAction];
        [self presentViewController:alert animated:YES completion:nil];
        
    }else if(editingStyle == UITableViewCellEditingStyleInsert){
        NSMutableArray *sections = [self.rows mutableCopy];
        NSMutableArray *rows = [sections[indexPath.section]mutableCopy];
        NSString *value = [rows[indexPath.row] stringByAppendingString:@"copy"];
        [rows addObject:value];
        sections[indexPath.section] = rows;
        self.rows = sections;
        NSIndexPath *insertIndexPath = [NSIndexPath indexPathForRow:rows.count-1 inSection:indexPath.section];
        [self.tableView insertRowsAtIndexPaths:@[insertIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

// 开启移动功能
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 2){
        return YES;
    }
    return NO;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    NSLog(@"move %@ -> %@", sourceIndexPath, destinationIndexPath);
}

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
//- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
//    if(indexPath.section == 0 && indexPath.row == 1){
//        return NO;
//    }
//    return YES;
//}
//- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSLog(@"highlight:%@",indexPath);
//}
//- (void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath {}
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    ViewController *vc = [[ViewController alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
//}

- (void)dealloc{
    // iOS 9 以前，dataSource / delegate 类型为 assgin，需要手动消除
    self.tableView.dataSource = nil;
    self.tableView.delegate = nil;
}

@end

