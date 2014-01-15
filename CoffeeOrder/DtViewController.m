//
//  DtViewController.m
//  CoffeeOrder
//
//  Created by SDT-1 on 2014. 1. 15..
//  Copyright (c) 2014년 T. All rights reserved.
//

#import "DtViewController.h"
#import "ViewController.h"
#import <FacebookSDK/FacebookSDK.h>
#import <Parse/Parse.h>
#import "OrderCell.h"

@interface DtViewController ()
@property (strong, nonatomic) IBOutlet UITableView *table;

@end

@implementation DtViewController
{
    NSMutableData *_buffer;
    NSArray *_result;
    NSInteger *orderNum;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"count %d", _result.count);
    return _result.count;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
        NSDictionary *order = _result[indexPath.row];
        OrderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ORDERER_CELL"];
    
        //Product *product = [[Catalog defaultCatalog]productAt:indexPath.row];
        cell.userImage =nil;
        cell.userName.text =order[@"orderer"];
        cell.coffeName.text =order[@"coffee"];
    
        return cell;
    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSURL *url = [NSURL URLWithString:@"https://api.parse.com/1/classes/Order"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url] ;
    [request addValue:@"T4JC47GMzVl5a19lIQokMxxE8Nx5WheSeptT8346" forHTTPHeaderField:@"X-Parse-Application-Id"];
    [request addValue:@"2mvT9BGUhPDAOBhKEJbdE3UhWVnyBEhKmgiybXUt" forHTTPHeaderField:@"X-Parse-REST-API-Key"];
    [NSURLConnection connectionWithRequest:request delegate:self];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    _buffer = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [_buffer appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSUInteger option = kNilOptions;
    __autoreleasing NSError *error;
    // JSON 파싱:응답 데이터를 NSDictionary
    id result = [NSJSONSerialization JSONObjectWithData:_buffer options:option error:&error];
    NSLog(@"Result : %@", result);
    _result = result[@"results"];
    [self.table reloadData];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
