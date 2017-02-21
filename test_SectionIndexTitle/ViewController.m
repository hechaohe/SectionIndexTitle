//
//  ViewController.m
//  test_SectionIndexTitle
//
//  Created by hc on 2017/2/21.
//  Copyright © 2017年 hc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>
{
//    NSArray *animals;
    
    NSDictionary *animalsDic;
    NSArray *animalSectionTitles;
    NSArray *animalIndexTitles;
    
}
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    animals = @[@"Bear", @"Black Swan", @"Buffalo", @"Camel", @"Cockatoo", @"Dog", @"Donkey", @"Emu", @"Giraffe", @"Greater Rhea", @"Hippopotamus", @"Horse", @"Koala", @"Lion", @"Llama", @"Manatus", @"Meerkat", @"Panda", @"Peacock", @"Pig", @"Platypus", @"Polar Bear", @"Rhinoceros", @"Seagull", @"Tasmania Devil", @"Whale", @"Whale Shark", @"Wombat"];
     animalIndexTitles = @[@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z"];
    
    animalsDic = @{@"B" : @[@"Bear",@"Black Swan",@"Buffalo"],
                   @"C" : @[@"Camel",@"Cockatoo"],
                   @"D" : @[@"Dog",@"Donkey"],
                   @"E" : @[@"Emu"],
                   @"G" : @[@"Giraffe",@"Greater Rhea"],
                   @"H" : @[@"Hippopotamus",@"Horse"],
                   @"K" : @[@"Koala"],
                   @"L" : @[@"Lion",@"Llama"],
                   @"M" : @[@"Manatus",@"Meerkat"],
                   @"P" : @[@"Panda",@"Peacock",@"Pig",@"Platypus",@"Polar Bear"],
                   @"R" : @[@"Rhinoceros"],
                   @"S" : @[@"Seagull"],
                   @"T" : @[@"Tasmania Devil"],
                   @"W" : @[@"Whale",@"Whale Shark",@"Wombat"]};
    
    
    animalSectionTitles = [[animalsDic allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return [animalSectionTitles count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [animalSectionTitles objectAtIndex:section];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    
    NSString *sectionTitle = [animalSectionTitles objectAtIndex:section];
    NSArray *sectionAnimals = [animalsDic objectForKey:sectionTitle];
    return [sectionAnimals count];
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    
    NSString *sectionTitles = [animalSectionTitles objectAtIndex:indexPath.section];
    NSArray *sectionAnimals = [animalsDic objectForKey:sectionTitles];
    NSString *animal = [sectionAnimals objectAtIndex:indexPath.row];
    cell.textLabel.text = animal;
    
    
    return cell;
}

- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return animalIndexTitles;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    return [animalSectionTitles indexOfObject:title];
}

@end
