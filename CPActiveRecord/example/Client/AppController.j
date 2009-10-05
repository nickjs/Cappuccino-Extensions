/*
 * AppController.j
 * Client
 *
 * Created by Nicholas Small on October 5, 2009.
 */

@import <Foundation/CPObject.j>

// Models
@import "Person.j"


@implementation AppController : CPObject
{
    CPTableView         tableView;
    
    CPArray             people;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    var theWindow = [[CPWindow alloc] initWithContentRect:CGRectMakeZero() styleMask:CPBorderlessBridgeWindowMask],
        contentView = [theWindow contentView];

    var nameColumn = [[CPTableColumn alloc] initWithIdentifier:@"PersonName"];
    [nameColumn setWidth:150.0];
    
    tableView = [[CPTableView alloc] initWithFrame:[contentView bounds]];
    [tableView setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable];
    [tableView addTableColumn:nameColumn];
    [tableView setDelegate:self];
    [tableView setDataSource:self];
    [contentView addSubview:tableView];
    
    [theWindow orderFront:self];
    
    // This will observe the collection of people and notify us when it changes.
    // Adding an observer will also send the collection a -loadIfNeeded message, so this will load all of our people.
    [Person addObserver:self selector:@selector(peopleDidLoad:)];
}

- (void)peopleDidLoad:(CPNotification)aNotification
{
    // Cache our model
    people = [Person all];
    
    [tableView reloadData];
}

@end

@implementation AppController (CPTableViewDataSource)

- (int)numberOfRowsInTableView:(CPTableView)aTableView
{
    return [people count];
}

- (id)tableView:(CPTableView)aTableView objectValueForTableColumn:(CPTableColumn)aColumn row:(int)aRow
{
    return [people[aRow] name];
}

@end
