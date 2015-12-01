--mouseActivity.lua
package.path = package.path..";/?.lua"
local class = require("pl.class")

--    public delegate void MouseActivityEventHandler(Object sender, MouseActivityArgs me);

--[[

RawMouseEventType =

{
        AttributesChanged = User32.MOUSE_ATTRIBUTES_CHANGED,

        MoveRelative = User32.MOUSE_MOVE_RELATIVE,

        MoveAbsolute = User32.MOUSE_MOVE_ABSOLUTE,

        VirtualDesktop = User32.MOUSE_VIRTUAL_DESKTOP,
}

--]]

MouseCoordinateSpace =

{
        Window = 1,

        Desktop = 2,

        Screen = 3,
}

MouseMovementType =

{
        Relative = 1,

        Absolute = 2,
}

MouseActivityType =

{
        None = 0,       -- No activity

        MouseDown = 1,

        MouseUp = 2,

        MouseMove = 3,

        MouseEnter = 4,

        MouseLeave = 5,

        MouseHover = 6,

        MouseWheel = 7,
}

--===================================================

--      MOUSE ACTIVITY

--===================================================

--[[

iup.isshift(status)

iup.iscontrol(status)

iup.isbutton1(status)

iup.isbutton2(status)

iup.isbutton3(status)

iup.isbutton4(status)

iup.isbutton5(status)

iup.isdouble(status)

iup.isalt(status)

iup.issys(status)

--]]

MouseButton =

{
        None           = 0,

        Left           = 1,

        Middle         = 2,

        Right          = 3,

        Button4        = 4,

        Button5        = 5,

        Wheel          = 6,
}

MouseButtonActivity =

{
        None                = 0,

        LeftButtonDown      = 1,    -- Left Button changed to down.

        LeftButtonUp        = 2,    -- Left Button changed to up.

        RightButtonDown     = 3,    -- Right Button changed to down.

        RightButtonUp       = 4,    -- Right Button changed to up.

        MiddleButtonDown    = 5,    -- Middle Button changed to down.

        MiddleButtonUp      = 6,    -- Middle Button changed to up.

        Button4Down         = 7,    -- Button 4

        Button4Up           = 8,

        Button5Down         = 9,    -- Button 5

        Button5Up           = 10,

        MouseWheel          = 11,   -- Wheel

}

class.MouseActivityArgs()

function MouseActivityArgs:_init(params)

        self.Device = params.Device ;

        self.ActivityType = params.ActivityType;

        self.ButtonActivity = params.ButtonActivity;

        self.CoordinateSpace = params.CoordinateSpace;

        self.MovementType = params.MovementType;

        self.Window = params.Window;

        self.Button = params.Button;

        self.Clicks = params.Clicks;

        self.X = params.X;

        self.Y = params.Y;

        self.Delta = params.Delta;

        self.KeyFlags = params.KeyFlags;

end

function MouseActivityArgs.__tostring(self)

        --return string.format("<MouseActivity X='%s', Y='%s'/>",tostring(self.X), tostring(self.Y));

        return string.format("<MouseActivity \n  Type='%s',\n X='%s', Y='%s', \n  Delta='%s', \n  Clicks='%s', \n  Button='%s'/>",

               tostring(self.ActivityType), tostring(self.X), tostring(self.Y), tostring(self.Delta), tostring(self.Clicks), tostring(self.Button));

end

return class.MouseActivityArgs() 
