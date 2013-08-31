//
//  SegundaTela.m
//  ListaContatos
//
//  Created by Leonardo on 24/08/13.
//  Copyright (c) 2013 Leonardo. All rights reserved.
//

#import "SegundaTela.h"
#import "AddressBook/AddressBook.h"

@interface SegundaTela ()

@end

@implementation SegundaTela

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self exibeDados];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_txtDados release];
    [_dados release];
    [super dealloc];
}

- (void) exibeDados {
    
    NSString *firstName = (__bridge NSString *) ABRecordCopyValue((__bridge ABRecordRef) self.dados, kABPersonFirstNameProperty);
    
    NSString *lastName = (__bridge NSString *) ABRecordCopyValue((__bridge ABRecordRef) self.dados, kABPersonLastNameProperty);

    
    ABMultiValueRef *listaEmails = (__bridge NSString *) ABRecordCopyValue((__bridge ABRecordRef) self.dados, kABPersonEmailProperty);
    
    NSString *email = [[NSString alloc] init];
    
    if(ABMultiValueGetCount(listaEmails) > 0) {
        NSLog(@"SIM");
        email = (NSString*)ABMultiValueCopyValueAtIndex (listaEmails,1);
    }
    
    
    self.txtDados.text = [[NSString alloc] initWithFormat:@"%@ %@, %@",firstName,lastName, email];
}


@end
