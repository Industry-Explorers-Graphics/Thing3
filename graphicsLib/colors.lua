--colors.lua
local ffi = require("ffi")
local pixel = ffi.typeof( "uint32_t" )

local bit = require( "bit" )
local lshift, rshift, band, bar, bor = bit.lshift, bit.rshift, bit.band, bit.bar, bit.bor

local function RGBA( r, g, b, a )
    return bor( lshift( a, 24 ), lshift( r, 16 ), lshift( g, 8 ), b )
end

local function div255( num )
    return rshift( ( num + ( rshift( num, 8 ) ) ), 8 )
end

local function lerp255( background, foreground, alpha )
    local uint8_t = ffi.typeof( "uint8_t" )
    
    return  uint8_t( div255( ( foreground * alpha + background * ( 255 - alpha ) ) ) )
end

local function GET_R( color )
    return band( 0xff, color ) 
end

local function GET_G( color )
    return  rshift( band( 0xff00, color ), 8 ) 
end

local function GET_B( color )
    return rshift( band( 0xff0000, color ), 16 )
end

local function GET_A( color )
    return rshift( band( 0xff000000, color ), 24 )
end

return {
    PINK    = RGBA( 240, 54, 87, 255 );
    RED     = RGBA( 250, 0, 0, 255 );
    ORANGE  = RGBA( 255, 122, 0, 255 );
    YELLOW  = RGBA( 255, 211, 0, 255 );
    GREEN   = RGBA( 0, 250, 0, 255 );
    GREEN_T = RGBA( 255, 211, 0, 100 ); 
    BLUE    = RGBA( 0, 0, 250, 255 );
    PURPLE  = RGBA( 119, 3, 173, 255 );
    WHITE   = RGBA( 255, 255, 255, 255 );
    BLACK   = RGBA( 0, 0, 0, 255 );
}
