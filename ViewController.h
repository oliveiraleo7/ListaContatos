//
//  ViewController.h
//  ListaContatos
//
//  Created by Leonardo on 24/08/13.
//  Copyright (c) 2013 Leonardo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    UITableView *tabela;
    NSArray *contatos;
}

@property (retain, nonatomic) IBOutlet UITableView *tabela;
@property (nonatomic, retain) NSArray * contatos;


@end
