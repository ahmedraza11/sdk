////////////////////////////////////////////////////////////////////////////////
//
//  OpenZoom
//
//  Copyright (c) 2007-2009, Daniel Gasienica <daniel@gasienica.ch>
//
//  OpenZoom is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  OpenZoom is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with OpenZoom. If not, see <http://www.gnu.org/licenses/>.
//
////////////////////////////////////////////////////////////////////////////////
package org.openzoom.flash.descriptors
{

import flash.errors.IllegalOperationError;
import flash.geom.Point;
import flash.geom.Rectangle;

/**
 * @private
 *
 * Base class for classes implementing IMultiScaleImageDescriptor.
 * Provides the basic getter/setter skeletons.
 */
public class MultiScaleImageDescriptorBase
{
    //--------------------------------------------------------------------------
    //
    //  Properties
    //
    //--------------------------------------------------------------------------

    //----------------------------------
    //  uri
    //----------------------------------

    /**
     * @private
     */
    public var uri:String

    //----------------------------------
    //  sources
    //----------------------------------

    /**
     * @copy IMultiScaleImageDescriptor#sources
     */
    public function get sources():Array
    {
        return []
    }

    //----------------------------------
    //  width
    //----------------------------------

    /**
     * @private
     */
    protected var _width:uint

    /**
     * @copy IMultiScaleImageDescriptor#width
     */
    public function get width():uint
    {
        return _width
    }

    //----------------------------------
    //  height
    //----------------------------------

    /**
     * @private
     */
    protected var _height:uint

    /**
     * @copy IMultiScaleImageDescriptor#height
     */
    public function get height():uint
    {
        return _height
    }

    //----------------------------------
    //  numLevels
    //----------------------------------

    /**
     * @private
     */
    protected var _numLevels:int

    /**
     * @copy IMultiScaleImageDescriptor#numLevels
     */
    public function get numLevels():int
    {
        return _numLevels
    }

    //----------------------------------
    //  tileWidth
    //----------------------------------

    /**
     * @private
     */
    protected var _tileWidth:uint

    /**
     * @copy IMultiScaleImageDescriptor#tileWidth
     */
    public function get tileWidth():uint
    {
        return _tileWidth
    }

    //----------------------------------
    //  tileHeight
    //----------------------------------

    /**
     * @private
     */
    protected var _tileHeight:uint

    /**
     * @copy IMultiScaleImageDescriptor#tileHeight
     */
    public function get tileHeight():uint
    {
        return _tileHeight
    }

    //----------------------------------
    //  tileOverlap
    //----------------------------------

    /**
     * @private
     */
    protected var _tileOverlap:uint = 0

    /**
     * @copy IMultiScaleImageDescriptor#tileOverlap
     */
    public function get tileOverlap():uint
    {
        return _tileOverlap
    }

    //----------------------------------
    //  type
    //----------------------------------

    /**
     * @private
     */
    protected var _type:String

    /**
     * @copy IMultiScaleImageDescriptor#type
     */
    public function get type():String
    {
        return _type
    }

    //----------------------------------
    //  origin
    //----------------------------------

    /**
     * @private
     */
    protected var _origin:String = "topLeft"

    /**
     * @copy IMultiScaleImageDescriptor#origin
     */
    public function get origin():String
    {
        return _origin
    }

    //--------------------------------------------------------------------------
    //
    //  Methods: IMultiScaleImageDescriptor
    //
    //--------------------------------------------------------------------------

    /**
     * @copy IMultiScaleImageDescriptor#getTileBounds()
     */
    public function getTileBounds(level:int, column:uint, row:uint):Rectangle
    {
        var bounds:Rectangle = new Rectangle()

        var offsetX:uint = (column == 0) ? 0 : tileOverlap
        var offsetY:uint = (row == 0) ? 0 : tileOverlap

        bounds.x = (column * tileWidth) - offsetX
        bounds.y = (row * tileHeight) - offsetY

        return bounds
    }

    /**
     * @copy IMultiScaleImageDescriptor#existsTile()
     */
    public function existsTile(level:int, column:uint, row:uint):Boolean
    {
        // By default, all tiles exist
        return true
    }

    /**
     * @copy IMultiScaleImageDescriptor#getTileAtPoint()
     */
    public function getTileAtPoint(level:int, point:Point):Point
    {
    	throw new IllegalOperationError("Not implemented.")
    }

    //--------------------------------------------------------------------------
    //
    //  Methods: Debug
    //
    //--------------------------------------------------------------------------

    /**
     * @inheritDoc
     */
    public function toString():String
    {
        return "source:" + uri + "\n" +
               "width:" + width + "\n" +
               "height:" + height + "\n" +
               "tileWidth:" + tileWidth + "\n" +
               "tileHeight:" + tileHeight + "\n" +
               "tileOverlap:" + tileOverlap + "\n" +
               "tileFormat:" + type
    }
}

}
