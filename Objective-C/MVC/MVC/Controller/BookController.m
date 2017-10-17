//
//  BookController.m
//  MVC
//
//  Created by yukaPriL on 2017/10/17.
//  Copyright © 2017年 yukaPriL. All rights reserved.
//

#import "BookController.h"
#import "BookView.h"
#import "Book.h"


@interface BookController ()
@property NSArray<Book *> *books;
@end

@implementation BookController

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];

    if (self) {
        [self setupBookModel];
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupBookView];
}

- (void)setupBookModel {
    Book *book0 = [Book bookWithName:@"javascript 入门" type:@"js" price:45.0];
    Book *book1 = [Book bookWithName:@"css 入门" type:@"css" price:28.0];
    self.books = @[book0, book1];
}

- (void)setupBookView {
    BookView *bookView = [[NSBundle mainBundle] loadNibNamed:@"BookView" owner:nil options:nil][0];

    bookView.frame = CGRectMake(0, 80, self.view.frame.size.width, 300);

    for (int i = 0; i < self.books.count; i++) {
        Book *item = self.books[i];
        [bookView.bookName[i] setText:item.name];
        [bookView.bookType[i] setText:item.type];
        [bookView.bookPrice[i] setText:[NSString stringWithFormat:@("%g"), item.price]];
    }

    // 添加到self.view上
    [self.view addSubview:bookView];
}


@end

