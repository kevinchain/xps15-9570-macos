// Type-C hotplug
// Patch: Rename RP17.PXSX._RMV to XRMV
// Find: UlAxN1BYU1gUM19STVY=
// Replace: UlAxN1BYU1gUM1hSTVY=
// References:
// [1] https://www.insanelymac.com/forum/topic/324366-dell-xps-15-9560-4k-touch-1tb-ssd-32gb-ram-100-adobergb%E2%80%8B/
// [2] https://www.tonymacx86.com/threads/usb-c-hotplug-questions.211313/
// [3] https://github.com/the-darkvoid/XPS9360-macOS/issues/118

DefinitionBlock ("", "SSDT", 2, "hack", "TYPC", 0x00000000)
{
    External (_SB_.PCI0.RP17.PXSX, DeviceObj)
    External (_SB_.PCI0.RP17.PXSX.XRMV, MethodObj)

    Scope (\_SB.PCI0.RP17.PXSX)
    {
        // key method to make type-c removable
        Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
        {
            If (_OSI ("Darwin"))
            {
                Return (One)
            }
            Else
            {
                Return (XRMV ())
            }
        }
    }
}

