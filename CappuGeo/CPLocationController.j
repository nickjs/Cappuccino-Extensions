/*
 * CPLocationController.j
 * CappuGeo
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

@import "CPLocation.j"


var SharedController;

CurrentLocationDidChange = @"CurrentLocationDidChange";
geoip_region = nil;

@implementation CPLocationController : CPObject
{
    CPLocation              currentLocation     @accessors;
}

+ (id)sharedController
{
    if (!SharedController)
        SharedController = [[[self class] alloc] init];
    
    return SharedController;
}

- (void)locateWithNativeAPI
{
    if (!navigator || !navigator.geolocation)
        return [CPException raise:@"NativeAPINotSupported" reason:@"Browser does not support native location API."];
    
    navigator.geolocation.getCurrentPosition(
        function(position)
        {
            if (!position.coords)
                return;
            
            var location = [CPLocation new];
            [location setLat:position.coords.latitude];
            [location setLon:position.coords.longitude];
            
            [location _setSensorLat:[location lat]];
            [location _setSensorLon:[location lon]];
            
            [self setCurrentLocation:location];
        },
        
        function(error)
        {
            
        }
    );
}

- (void)locateWithIPAddress
{
    var script = document.createElement('script');
    script.type = "text/javascript";
    script.src = "http://j.maxmind.com/app/geoip.js";
    
    document.body.appendChild(script);
    
    var interval = window.setInterval(function(){
        if (geoip_region)
        {
            window.clearInterval(interval);
            
            var location = [CPLocation new];
            [location setCity:geoip_city()];
            [location setRegion:geoip_region()];
            [location setPostal:geoip_postal_code()];
            
            [location _setSensorLat:geoip_latitude()];
            [location _setSensorLon:geoip_longitude()];
            
            [self setCurrentLocation:location];
            
            geoip_region = nil;
            document.body.removeChild(script);
        }
    },100);
}

- (void)locate
{
    if (navigator && navigator.geolocation)
        [self locateWithNativeAPI];
    else
        [self locateWithIPAddress];
}

- (void)setCurrentLocation:(CPLocation)aLocation
{
    var center = [CPNotificationCenter defaultCenter];
    
    if (currentLocation)
        [center removeObserver:self name:LocationDidGeocode object:currentLocation];
    
    currentLocation = aLocation;
    [currentLocation probe];
    
    [center addObserver:self selector:@selector(locationDidGeocode:) name:LocationDidGeocode object:currentLocation];
    [center postNotificationName:CurrentLocationDidChange object:self];
}

- (void)locationDidGeocode:(CPNotification)aNotification
{
    [[CPNotificationCenter defaultCenter] postNotificationName:CurrentLocationDidChange object:self];
}

@end
