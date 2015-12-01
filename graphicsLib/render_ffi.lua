--render_ffi.lua

local ffi = require( "ffi" )
local bit = require( "bit" )

ffi.cdef[[
typedef uint32_t pixel;

typedef struct _frameBuffer
{
    int width;
    int height;
    pixel *data;
    int x;
    int y;
    int ownsData;
    int pixelStride;
} frameBuffer;
]]

ffi.cdef[[
frameBuffer *createFrameBuffer ( int width, int height, int x, int y, pixel *data, int pixelStride );

void drawHorizontalLine( frameBuffer *fb, int length, int x, int y, pixel color );
void drawVerticalLine( frameBuffer *fb, int length, int x,  int y, pixel color );
void drawDiagonalLine( frameBuffer *fb, int x1, int y1, int x2, int y2, pixel color );

void drawRectFrame( frameBuffer *fb, int length, int width, int x, int y, pixel color );
void drawRectFill( frameBuffer * fb, int x, int y, int width, int length, pixel color );

void drawTriangleFrame( frameBuffer *fb, int ax1, int ay1, int ax2, int ay2, int bx1, int by1, int bx2, int by2, int cx1,  int cy1, int cx2, int cy2, pixel color );
void drawTriangleFill( frameBuffer *fb, int x1, int y1, int x2, int y2, int x3, int y3, pixel color );

void drawCircleFrame( frameBuffer *fb, int x0, int y0, int radius, pixel color );
void drawCircleFill( frameBuffer *fb, int x0, int y0, int radius, pixel color );
void drawEllipseFrame( frameBuffer * fb, int xc, int yc, int width, int height, pixel color );

void bezier( frameBuffer *fb, int x1, int y1, int x2, int y2, int x3, int y3, pixel color );

//void polygonFill( frameBuffer *fb, float *vertices, int numOfVerts, int yMax, pixel color);

void bitBlt(frameBuffer *dst, int dstx, int dsty, frameBuffer *src, int srcx, int srcy, int srcWidth, int srcHeight );

void drawText(frameBuffer *fb, int px, int py, const char* text, pixel color);

]]

if ffi.os == "Linux" then
    Lib_drawLib = ffi.load("kandrawer")
end

return Lib_drawLib;
