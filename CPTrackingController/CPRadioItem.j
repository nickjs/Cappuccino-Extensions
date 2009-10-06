/*
 * CPRadioItem.j
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

@import <Foundation/CPObject.j>


@implementation CPRadioItem : CPObject
{
    CPImage         _image;
    CPString        _title;
    
    id              _representedObject;
}

- (void)setImage:(CPImage)anImage
{
    _image = anImage;
    
    if ([_representedObject class] == CPMenuItem)
    {
        [_representedObject setImage:_image];
        // [_representedObject setAlternateImage:_image];
    }
}

- (CPImage)image
{
    return _image;
}

- (void)setTitle:(CPString)aTitle
{
    _title = aTitle;
    
    if ([_representedObject class] == CPMenuItem)
        [_representedObject setTitle:_title];
    else if ([_representedObject class] == CPTabViewItem)
        [_representedObject setLabel:_title];
}

- (CPString)title
{
    return _title;
}

- (void)setRepresentedObject:(id)anObject
{
    if (_representedObject == anObject)
        return;
    
    _representedObject = anObject;
    
    [self setTitle:[self title]];
    [self setImage:[self image]];
}

- (id)representedObject
{
    return _representedObject;
}

@end
