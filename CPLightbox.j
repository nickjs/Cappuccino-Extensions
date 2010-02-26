/*
 * CPLightbox.j
 * CappuccinoExtensions
 *
 * Created by Nicholas Small.
 * Copyright 2009-2010, 280 North, Inc.
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

@import <Foundation/CPObject.j>


var SharedLightbox;

@implementation CPLightbox : CPObject
{
    CPColor             _backgroundColor;
    CPWindow            _backgroundWindow;
    
    CPWindow            _modalWindow;
    CPWindow            _sheetWindow;
}

+ (id)sharedLightbox
{
    if (!SharedLightbox)
        SharedLightbox = [[CPLightbox alloc] init];
    
    return SharedLightbox;
}

- (id)init
{
    self = [super init];
    
    if (self)
        _backgroundColor = [CPColor colorWithCalibratedRed:209.0/255.0 green:216.0/255.0 blue:227.0/255.0 alpha:0.7];
    
    return self;
}

- (void)runModalForWindow:(CPWindow)aWindow
{
    if (_modalWindow || _sheetWindow)
        [self stopModal];
    
    _modalWindow = aWindow;
    
    [self _show];
    [CPApp runModalForWindow:_modalWindow];
    
    if (![_modalWindow autoresizingMask])
        [_modalWindow setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
}

- (void)runSheetForWindow:(CPWindow)aWindow
{
    if (_modalWindow || _sheetWindow)
        [self stopModal];
    
    _sheetWindow = aWindow;
    
    [self _show];
    [CPApp runModalForWindow:_sheetWindow];
    
    var frame = [_sheetWindow frame];
    [_sheetWindow setFrameOrigin:CGPointMake(CGRectGetMinX(frame), -CGRectGetHeight(frame))];
    [_sheetWindow setFrame:CGRectMake(CGRectGetMinX(frame), -26.0, CGRectGetWidth(frame), CGRectGetHeight(frame)) display:YES animate:YES];
    
    if (![_sheetWindow autoresizingMask])
        [_sheetWindow setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin];
}

- (void)stopModal
{
    [CPApp stopModal];
    [(_modalWindow || _sheetWindow) orderOut:self];
    
    [self _hide];
    
    _modalWindow = nil;
    _sheetWindow = nil;
}

- (CPColor)backgroundColor
{
    return _backgroundColor;
}

- (void)setBackgroundColor:(CPColor)aColor
{
    _backgroundColor = aColor;
    
    [_lightboxWindow setBackgroundColor:_backgroundColor];
}

- (void)_show
{
    if (!_backgroundWindow)
    {
        _backgroundWindow = [[CPWindow alloc] initWithContentRect:[[CPPlatformWindow primaryPlatformWindow] contentBounds] styleMask:CPBorderlessWindowMask];
        [_backgroundWindow setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable];
        
        var contentView = [_backgroundWindow contentView];
        
        [contentView setBackgroundColor:_backgroundColor];
    }
    
    [_backgroundWindow orderFront:self];
}

- (void)_hide
{
    [_backgroundWindow orderOut:self];
}

@end
