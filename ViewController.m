//
//  ViewController.m
//  ListaContatos
//
//  Created by Leonardo on 24/08/13.
//  Copyright (c) 2013 Leonardo. All rights reserved.
//

#import "ViewController.h"
#import "SegundaTela.h"
#import "AddressBook/AddressBook.h"


@interface ViewController ()

@end

@implementation ViewController

@synthesize tabela,contatos;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self setTitle:@"Primeira"];
    
    ABAddressBookRef addressBook = ABAddressBookCreate();
    ABRecordRef copiaAddressBook = ABAddressBookCopyDefaultSource(addressBook);
    contatos = (__bridge NSArray*) ABAddressBookCopyArrayOfAllPeopleInSourceWithSortOrdering(addressBook, copiaAddressBook, kABPersonSortByLastName);
    
    //[self.tabela reloadData];
}

- (void)viewDidAppear:(BOOL)animated
{
    [self.tabela reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [tabela release];
    [contatos release];
    [super dealloc];
}


- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return  1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return contatos.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"leo";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = (__bridge NSString *) ABRecordCopyValue((__bridge ABRecordRef) [contatos objectAtIndex:indexPath.row], kABPersonFirstNameProperty);
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *nome = (__bridge NSString *) ABRecordCopyValue((__bridge ABRecordRef) [contatos objectAtIndex:indexPath.row], kABPersonFirstNameProperty);
    
    
    
    SegundaTela *c = [[SegundaTela alloc] init];
    c.dados = [contatos objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:c animated:YES];
    [c release];
    
    /*
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Alerta"
                          message:nome
                          delegate:self
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil];
    
    [alert show];
     */
}


@end
