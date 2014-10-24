//
//  MainNotesTableViewController.m
//  NotesForGoatsRedux
//
//  Created by Loan Wolf on 10/19/14.
//  Copyright (c) 2014 Mandy. All rights reserved.
//

#import "MainNotesTableViewController.h"
#import "NoteTableViewCell.h"
#import "goatNoteDataStore.h"
#import "goatNote.h"
#import "AddNewNoteViewController.h"

@interface MainNotesTableViewController ()
@property (strong, nonatomic) NSMutableArray *imageArray;
@property (strong, nonatomic) NSMutableArray *noteTitleArray;
@property (strong, nonatomic) NSMutableArray *noteSnippetArray;

@property (strong, nonatomic) goatNoteDataStore *dataStore;

@end

@implementation MainNotesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"view did load");
    
    self.dataStore = [goatNoteDataStore sharedGoatNotesDataStore];
    
    NSData *archivedData = [[NSUserDefaults standardUserDefaults] objectForKey:@"goatNoteArray"];
    self.dataStore.goatNoteArray = [NSKeyedUnarchiver unarchiveObjectWithData:archivedData];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"view will appear");
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.dataStore.goatNoteArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NoteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"goatCell" forIndexPath:indexPath];
    
    NSLog(@"%ld", indexPath.row);
    
    goatNote *noteToDisplay = [self.dataStore.goatNoteArray objectAtIndex: indexPath.row];
    
    
    cell.smallCellImageView.image = noteToDisplay.notePicture;
    cell.smallCellNoteTextLabel.text = noteToDisplay.noteBody;
    cell.smallCellNoteTitleLabel.text = noteToDisplay.noteTitle;
    
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.dataStore.goatNoteArray removeObjectAtIndex:indexPath.row];
    
    NSData *archivedData = [NSKeyedArchiver archivedDataWithRootObject:_dataStore.goatNoteArray];
    [[NSUserDefaults standardUserDefaults] setObject:archivedData forKey:@"goatNoteArray"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self.tableView reloadData];
   /** if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   */
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:@"editNote"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        AddNewNoteViewController *newVC = segue.destinationViewController;
        newVC.selectedNote = [self.dataStore.goatNoteArray objectAtIndex: indexPath.row];
    }
    //NSLog(@"%dl",indexPath.row);
}


@end
