/*
 * CPTrackingController.j
 * AppKit
 *
 * Created by Nicholas Small.
 * Copyright 2009, 280 North, Inc.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 */

@import "CPViewController.j"
@import "CPRadioItem.j"


CPTrackingSegmentedMode = 0;
CPTrackingRadioMode = 1;

@implementation CPTrackingController : CPViewController
{
    CPArray             _viewControllers;
    CPViewController    _currentViewController;
    
    CPControl           _trackingControl;
}

- (id)initWithViewControllers:(CPArray)viewControllers
{
    if (!viewControllers)
        return nil;
    
    self = [super init];
    
    if (self)
    {
        _viewControllers = viewControllers;
    }
    
    return self;
}

- (void)loadView
{
    var view = [[_CPLayoutView alloc] init];
    [self setView:view];
}

- (CPControl)trackingControl
{
    if (_trackingControl)
        return _trackingControl;
    
    var count = [_viewControllers count];
    if (!count)
        return nil;
    
    _trackingControl = [[CPSegmentedControl alloc] initWithFrame:CGRectMake(0.0, 0.0, 96.0, 24.0)];
    [_trackingControl setSegmentCount:count];
    [_trackingControl setTrackingMode:CPSegmentSwitchTrackingSelectOne];
    [_trackingControl setTarget:self];
    [_trackingControl setAction:@selector(trackingControlDidChange:)];
    
    for (var i = 0; i < count; i++)
    {
        var controller = _viewControllers[i],
            radioItem = [controller radioItem];
        
        [_trackingControl setWidth:32.0 forSegment:i];
        
        if ([radioItem image])
            [_trackingControl setImage:[radioItem image] forSegment:i];
        else
            [_trackingControl setLabel:[[radioItem title] characterAtIndex:0] forSegment:i];
    }
    
    return _trackingControl;
}

- (@action)trackingControlDidChange:(id)aSender
{
    if (!aSender)
        return;
    
    [_currentViewController viewWillDisappear:NO];
    [[_currentViewController view] removeFromSuperview];
    [_currentViewController viewDidDisappear:NO];
    
    _currentViewController = _viewControllers[[aSender selectedSegment]];
    
    [_currentViewController viewWillAppear:NO];
    
    var view = [_currentViewController view];
    [view setFrame:CGRectMakeCopy([_view bounds])];
    [view setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable];
    
    [_view addSubview:view];
    
    [_currentViewController viewDidAppear:NO];
}

@end
