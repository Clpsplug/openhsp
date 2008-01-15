;(user32.as)
#ifdef __hsp30__
#ifndef __USER32__
#define global __USER32__
#uselib "USER32.DLL"
	#func global ActivateKeyboardLayout "ActivateKeyboardLayout" sptr,sptr
	#func global AdjustWindowRect "AdjustWindowRect" sptr,sptr,sptr
	#func global AdjustWindowRectEx "AdjustWindowRectEx" sptr,sptr,sptr,sptr
	#func global AllowSetForegroundWindow "AllowSetForegroundWindow" sptr
	#func global AnimateWindow "AnimateWindow" sptr,sptr,sptr
	#func global AnyPopup "AnyPopup"
	#define global AppendMenu AppendMenuA
	#func global AppendMenuA "AppendMenuA" sptr,sptr,sptr,sptr
	#func global AppendMenuW "AppendMenuW" wptr,wptr,wptr,wptr
	#func global ArrangeIconicWindows "ArrangeIconicWindows" sptr
	#func global AttachThreadInput "AttachThreadInput" sptr,sptr,sptr
	#func global BeginDeferWindowPos "BeginDeferWindowPos" sptr
	#func global BeginPaint "BeginPaint" sptr,sptr
	#func global BlockInput "BlockInput" sptr
	#func global BringWindowToTop "BringWindowToTop" sptr
	#func global BroadcastSystemMessage "BroadcastSystemMessage" sptr,sptr,sptr,sptr,sptr
	#func global BroadcastSystemMessageA "BroadcastSystemMessageA" sptr,sptr,sptr,sptr,sptr
	#func global BroadcastSystemMessageW "BroadcastSystemMessageW" wptr,wptr,wptr,wptr,wptr
	#func global CallMsgFilter "CallMsgFilter" sptr,sptr
	#func global CallMsgFilterA "CallMsgFilterA" sptr,sptr
	#func global CallMsgFilterW "CallMsgFilterW" wptr,wptr
	#func global CallNextHookEx "CallNextHookEx" sptr,sptr,sptr,sptr
	#define global CallWindowProc CallWindowProcA
	#func global CallWindowProcA "CallWindowProcA" sptr,sptr,sptr,sptr,sptr
	#func global CallWindowProcW "CallWindowProcW" wptr,wptr,wptr,wptr,wptr
	#func global CascadeChildWindows "CascadeChildWindows" sptr,sptr
	#func global CascadeWindows "CascadeWindows" sptr,sptr,sptr,sptr,sptr
	#func global ChangeClipboardChain "ChangeClipboardChain" sptr,sptr
	#define global ChangeDisplaySettings ChangeDisplaySettingsA
	#func global ChangeDisplaySettingsA "ChangeDisplaySettingsA" sptr,sptr
	#define global ChangeDisplaySettingsEx ChangeDisplaySettingsExA
	#func global ChangeDisplaySettingsExA "ChangeDisplaySettingsExA" sptr,sptr,sptr,sptr,sptr
	#func global ChangeDisplaySettingsExW "ChangeDisplaySettingsExW" wptr,wptr,wptr,wptr,wptr
	#func global ChangeDisplaySettingsW "ChangeDisplaySettingsW" wptr,wptr
	#define global ChangeMenu ChangeMenuA
	#func global ChangeMenuA "ChangeMenuA" sptr,sptr,sptr,sptr,sptr
	#func global ChangeMenuW "ChangeMenuW" wptr,wptr,wptr,wptr,wptr
	#define global CharLower CharLowerA
	#func global CharLowerA "CharLowerA" sptr
	#define global CharLowerBuff CharLowerBuffA
	#func global CharLowerBuffA "CharLowerBuffA" sptr,sptr
	#func global CharLowerBuffW "CharLowerBuffW" wptr,wptr
	#func global CharLowerW "CharLowerW" wptr
	#define global CharNext CharNextA
	#func global CharNextA "CharNextA" sptr
	#define global CharNextEx CharNextExA
	#func global CharNextExA "CharNextExA" sptr,sptr,sptr
	#func global CharNextW "CharNextW" wptr
	#define global CharPrev CharPrevA
	#func global CharPrevA "CharPrevA" sptr,sptr
	#define global CharPrevEx CharPrevExA
	#func global CharPrevExA "CharPrevExA" sptr,sptr,sptr,sptr
	#func global CharPrevW "CharPrevW" wptr,wptr
	#define global CharToOem CharToOemA
	#func global CharToOemA "CharToOemA" sptr,sptr
	#define global CharToOemBuff CharToOemBuffA
	#func global CharToOemBuffA "CharToOemBuffA" sptr,sptr,sptr
	#func global CharToOemBuffW "CharToOemBuffW" wptr,wptr,wptr
	#func global CharToOemW "CharToOemW" wptr,wptr
	#define global CharUpper CharUpperA
	#func global CharUpperA "CharUpperA" sptr
	#define global CharUpperBuff CharUpperBuffA
	#func global CharUpperBuffA "CharUpperBuffA" sptr,sptr
	#func global CharUpperBuffW "CharUpperBuffW" wptr,wptr
	#func global CharUpperW "CharUpperW" wptr
	#func global CheckDlgButton "CheckDlgButton" sptr,sptr,sptr
	#func global CheckMenuItem "CheckMenuItem" sptr,sptr,sptr
	#func global CheckMenuRadioItem "CheckMenuRadioItem" sptr,sptr,sptr,sptr,sptr
	#func global CheckRadioButton "CheckRadioButton" sptr,sptr,sptr,sptr
	#func global ChildWindowFromPoint "ChildWindowFromPoint" sptr,sptr,sptr
	#func global ChildWindowFromPointEx "ChildWindowFromPointEx" sptr,sptr,sptr,sptr
	#func global ClientToScreen "ClientToScreen" sptr,sptr
	#func global ClipCursor "ClipCursor" sptr
	#func global CloseClipboard "CloseClipboard"
	#func global CloseDesktop "CloseDesktop" sptr
	#func global CloseWindow "CloseWindow" sptr
	#func global CloseWindowStation "CloseWindowStation" sptr
	#define global CopyAcceleratorTable CopyAcceleratorTableA
	#func global CopyAcceleratorTableA "CopyAcceleratorTableA" sptr,sptr,sptr
	#func global CopyAcceleratorTableW "CopyAcceleratorTableW" wptr,wptr,wptr
	#func global CopyIcon "CopyIcon" sptr
	#func global CopyImage "CopyImage" sptr,sptr,sptr,sptr,sptr
	#func global CopyRect "CopyRect" sptr,sptr
	#func global CountClipboardFormats "CountClipboardFormats"
	#define global CreateAcceleratorTable CreateAcceleratorTableA
	#func global CreateAcceleratorTableA "CreateAcceleratorTableA" sptr,sptr
	#func global CreateAcceleratorTableW "CreateAcceleratorTableW" wptr,wptr
	#func global CreateCaret "CreateCaret" sptr,sptr,sptr,sptr
	#func global CreateCursor "CreateCursor" sptr,sptr,sptr,sptr,sptr,sptr,sptr
	#define global CreateDesktop CreateDesktopA
	#func global CreateDesktopA "CreateDesktopA" sptr,sptr,sptr,sptr,sptr,sptr
	#func global CreateDesktopW "CreateDesktopW" wptr,wptr,wptr,wptr,wptr,wptr
	#define global CreateDialogIndirectParam CreateDialogIndirectParamA
	#func global CreateDialogIndirectParamA "CreateDialogIndirectParamA" sptr,sptr,sptr,sptr,sptr
	#func global CreateDialogIndirectParamW "CreateDialogIndirectParamW" wptr,wptr,wptr,wptr,wptr
	#define global CreateDialogParam CreateDialogParamA
	#func global CreateDialogParamA "CreateDialogParamA" sptr,sptr,sptr,sptr,sptr
	#func global CreateDialogParamW "CreateDialogParamW" wptr,wptr,wptr,wptr,wptr
	#func global CreateIcon "CreateIcon" sptr,sptr,sptr,sptr,sptr,sptr,sptr
	#func global CreateIconFromResource "CreateIconFromResource" sptr,sptr,sptr,sptr
	#func global CreateIconFromResourceEx "CreateIconFromResourceEx" sptr,sptr,sptr,sptr,sptr,sptr,sptr
	#func global CreateIconIndirect "CreateIconIndirect" sptr
	#define global CreateMDIWindow CreateMDIWindowA
	#func global CreateMDIWindowA "CreateMDIWindowA" sptr,sptr,sptr,sptr,sptr,sptr,sptr,sptr,sptr,sptr
	#func global CreateMDIWindowW "CreateMDIWindowW" wptr,wptr,wptr,wptr,wptr,wptr,wptr,wptr,wptr,wptr
	#func global CreateMenu "CreateMenu"
	#func global CreatePopupMenu "CreatePopupMenu"
	#define global CreateWindowEx CreateWindowExA
	#func global CreateWindowExA "CreateWindowExA" sptr,sptr,sptr,sptr,sptr,sptr,sptr,sptr,sptr,sptr,sptr,sptr
	#func global CreateWindowExW "CreateWindowExW" wptr,wptr,wptr,wptr,wptr,wptr,wptr,wptr,wptr,wptr,wptr,wptr
	#define global CreateWindowStation CreateWindowStationA
	#func global CreateWindowStationA "CreateWindowStationA" sptr,sptr,sptr,sptr
	#func global CreateWindowStationW "CreateWindowStationW" wptr,wptr,wptr,wptr
	#func global DdeAbandonTransaction "DdeAbandonTransaction" sptr,sptr,sptr
	#func global DdeAccessData "DdeAccessData" sptr,sptr
	#func global DdeAddData "DdeAddData" sptr,sptr,sptr,sptr
	#func global DdeClientTransaction "DdeClientTransaction" sptr,sptr,sptr,sptr,sptr,sptr,sptr,sptr
	#func global DdeCmpStringHandles "DdeCmpStringHandles" sptr,sptr
	#func global DdeConnect "DdeConnect" sptr,sptr,sptr,sptr
	#func global DdeConnectList "DdeConnectList" sptr,sptr,sptr,sptr,sptr
	#func global DdeCreateDataHandle "DdeCreateDataHandle" sptr,sptr,sptr,sptr,sptr,sptr,sptr
	#define global DdeCreateStringHandle DdeCreateStringHandleA
	#func global DdeCreateStringHandleA "DdeCreateStringHandleA" sptr,sptr,sptr
	#func global DdeCreateStringHandleW "DdeCreateStringHandleW" wptr,wptr,wptr
	#func global DdeDisconnect "DdeDisconnect" sptr
	#func global DdeDisconnectList "DdeDisconnectList" sptr
	#func global DdeEnableCallback "DdeEnableCallback" sptr,sptr,sptr
	#func global DdeFreeDataHandle "DdeFreeDataHandle" sptr
	#func global DdeFreeStringHandle "DdeFreeStringHandle" sptr,sptr
	#func global DdeGetData "DdeGetData" sptr,sptr,sptr,sptr
	#func global DdeGetLastError "DdeGetLastError" sptr
	#func global DdeImpersonateClient "DdeImpersonateClient" sptr
	#define global DdeInitialize DdeInitializeA
	#func global DdeInitializeA "DdeInitializeA" sptr,sptr,sptr,sptr
	#func global DdeInitializeW "DdeInitializeW" wptr,wptr,wptr,wptr
	#func global DdeKeepStringHandle "DdeKeepStringHandle" sptr,sptr
	#func global DdeNameService "DdeNameService" sptr,sptr,sptr,sptr
	#func global DdePostAdvise "DdePostAdvise" sptr,sptr,sptr
	#func global DdeQueryConvInfo "DdeQueryConvInfo" sptr,sptr,sptr
	#func global DdeQueryNextServer "DdeQueryNextServer" sptr,sptr
	#define global DdeQueryString DdeQueryStringA
	#func global DdeQueryStringA "DdeQueryStringA" sptr,sptr,sptr,sptr,sptr
	#func global DdeQueryStringW "DdeQueryStringW" wptr,wptr,wptr,wptr,wptr
	#func global DdeReconnect "DdeReconnect" sptr
	#func global DdeSetQualityOfService "DdeSetQualityOfService" sptr,sptr,sptr
	#func global DdeSetUserHandle "DdeSetUserHandle" sptr,sptr,sptr
	#func global DdeUnaccessData "DdeUnaccessData" sptr
	#func global DdeUninitialize "DdeUninitialize" sptr
	#define global DefDlgProc DefDlgProcA
	#func global DefDlgProcA "DefDlgProcA" sptr,sptr,sptr,sptr
	#func global DefDlgProcW "DefDlgProcW" wptr,wptr,wptr,wptr
	#define global DefFrameProc DefFrameProcA
	#func global DefFrameProcA "DefFrameProcA" sptr,sptr,sptr,sptr,sptr
	#func global DefFrameProcW "DefFrameProcW" wptr,wptr,wptr,wptr,wptr
	#define global DefMDIChildProc DefMDIChildProcA
	#func global DefMDIChildProcA "DefMDIChildProcA" sptr,sptr,sptr,sptr
	#func global DefMDIChildProcW "DefMDIChildProcW" wptr,wptr,wptr,wptr
	#define global DefWindowProc DefWindowProcA
	#func global DefWindowProcA "DefWindowProcA" sptr,sptr,sptr,sptr
	#func global DefWindowProcW "DefWindowProcW" wptr,wptr,wptr,wptr
	#func global DeferWindowPos "DeferWindowPos" sptr,sptr,sptr,sptr,sptr,sptr,sptr,sptr
	#func global DeleteMenu "DeleteMenu" sptr,sptr,sptr
	#func global DestroyAcceleratorTable "DestroyAcceleratorTable" sptr
	#func global DestroyCaret "DestroyCaret"
	#func global DestroyCursor "DestroyCursor" sptr
	#func global DestroyIcon "DestroyIcon" sptr
	#func global DestroyMenu "DestroyMenu" sptr
	#func global DestroyWindow "DestroyWindow" sptr
	#define global DialogBoxIndirectParam DialogBoxIndirectParamA
	#func global DialogBoxIndirectParamA "DialogBoxIndirectParamA" sptr,sptr,sptr,sptr,sptr
	#func global DialogBoxIndirectParamW "DialogBoxIndirectParamW" wptr,wptr,wptr,wptr,wptr
	#define global DialogBoxParam DialogBoxParamA
	#func global DialogBoxParamA "DialogBoxParamA" sptr,sptr,sptr,sptr,sptr
	#func global DialogBoxParamW "DialogBoxParamW" wptr,wptr,wptr,wptr,wptr
	#define global DispatchMessage DispatchMessageA
	#func global DispatchMessageA "DispatchMessageA" sptr
	#func global DispatchMessageW "DispatchMessageW" wptr
	#define global DlgDirList DlgDirListA
	#func global DlgDirListA "DlgDirListA" sptr,sptr,sptr,sptr,sptr
	#define global DlgDirListComboBox DlgDirListComboBoxA
	#func global DlgDirListComboBoxA "DlgDirListComboBoxA" sptr,sptr,sptr,sptr,sptr
	#func global DlgDirListComboBoxW "DlgDirListComboBoxW" wptr,wptr,wptr,wptr,wptr
	#func global DlgDirListW "DlgDirListW" wptr,wptr,wptr,wptr,wptr
	#define global DlgDirSelectComboBoxEx DlgDirSelectComboBoxExA
	#func global DlgDirSelectComboBoxExA "DlgDirSelectComboBoxExA" sptr,sptr,sptr,sptr
	#func global DlgDirSelectComboBoxExW "DlgDirSelectComboBoxExW" wptr,wptr,wptr,wptr
	#define global DlgDirSelectEx DlgDirSelectExA
	#func global DlgDirSelectExA "DlgDirSelectExA" sptr,sptr,sptr,sptr
	#func global DlgDirSelectExW "DlgDirSelectExW" wptr,wptr,wptr,wptr
	#func global DragDetect "DragDetect" sptr,sptr,sptr
	#func global DragObject "DragObject" sptr,sptr,sptr,sptr,sptr
	#func global DrawAnimatedRects "DrawAnimatedRects" sptr,sptr,sptr,sptr
	#func global DrawCaption "DrawCaption" sptr,sptr,sptr,sptr
	#func global DrawEdge "DrawEdge" sptr,sptr,sptr,sptr
	#func global DrawFocusRect "DrawFocusRect" sptr,sptr
	#func global DrawFrame "DrawFrame" sptr,sptr,sptr,sptr
	#func global DrawFrameControl "DrawFrameControl" sptr,sptr,sptr,sptr
	#func global DrawIcon "DrawIcon" sptr,sptr,sptr,sptr
	#func global DrawIconEx "DrawIconEx" sptr,sptr,sptr,sptr,sptr,sptr,sptr,sptr,sptr
	#func global DrawMenuBar "DrawMenuBar" sptr
	#define global DrawState DrawStateA
	#func global DrawStateA "DrawStateA" sptr,sptr,sptr,sptr,sptr,sptr,sptr,sptr,sptr,sptr
	#func global DrawStateW "DrawStateW" wptr,wptr,wptr,wptr,wptr,wptr,wptr,wptr,wptr,wptr
	#define global DrawText DrawTextA
	#func global DrawTextA "DrawTextA" sptr,sptr,sptr,sptr,sptr
	#define global DrawTextEx DrawTextExA
	#func global DrawTextExA "DrawTextExA" sptr,sptr,sptr,sptr,sptr,sptr
	#func global DrawTextExW "DrawTextExW" wptr,wptr,wptr,wptr,wptr,wptr
	#func global DrawTextW "DrawTextW" wptr,wptr,wptr,wptr,wptr
	#func global EditWndProc "EditWndProc" sptr,sptr,sptr,sptr
	#func global EmptyClipboard "EmptyClipboard"
	#func global EnableMenuItem "EnableMenuItem" sptr,sptr,sptr
	#func global EnableScrollBar "EnableScrollBar" sptr,sptr,sptr
	#func global EnableWindow "EnableWindow" sptr,sptr
	#func global EndDeferWindowPos "EndDeferWindowPos" sptr
	#func global EndDialog "EndDialog" sptr,sptr
	#func global EndMenu "EndMenu"
	#func global EndPaint "EndPaint" sptr,sptr
	#func global EnumChildWindows "EnumChildWindows" sptr,sptr,sptr
	#func global EnumClipboardFormats "EnumClipboardFormats" sptr
	#func global EnumDesktopWindows "EnumDesktopWindows" sptr,sptr,sptr
	#define global EnumDesktops EnumDesktopsA
	#func global EnumDesktopsA "EnumDesktopsA" sptr,sptr,sptr
	#func global EnumDesktopsW "EnumDesktopsW" wptr,wptr,wptr
	#define global EnumDisplayDevices EnumDisplayDevicesA
	#func global EnumDisplayDevicesA "EnumDisplayDevicesA" sptr,sptr,sptr,sptr
	#func global EnumDisplayDevicesW "EnumDisplayDevicesW" wptr,wptr,wptr,wptr
	#func global EnumDisplayMonitors "EnumDisplayMonitors" sptr,sptr,sptr,sptr
	#define global EnumDisplaySettings EnumDisplaySettingsA
	#func global EnumDisplaySettingsA "EnumDisplaySettingsA" sptr,sptr,sptr
	#define global EnumDisplaySettingsEx EnumDisplaySettingsExA
	#func global EnumDisplaySettingsExA "EnumDisplaySettingsExA" sptr,sptr,sptr,sptr
	#func global EnumDisplaySettingsExW "EnumDisplaySettingsExW" wptr,wptr,wptr,wptr
	#func global EnumDisplaySettingsW "EnumDisplaySettingsW" wptr,wptr,wptr
	#define global EnumProps EnumPropsA
	#func global EnumPropsA "EnumPropsA" sptr,sptr
	#define global EnumPropsEx EnumPropsExA
	#func global EnumPropsExA "EnumPropsExA" sptr,sptr,sptr
	#func global EnumPropsExW "EnumPropsExW" wptr,wptr,wptr
	#func global EnumPropsW "EnumPropsW" wptr,wptr
	#func global EnumThreadWindows "EnumThreadWindows" sptr,sptr,sptr
	#define global EnumWindowStations EnumWindowStationsA
	#func global EnumWindowStationsA "EnumWindowStationsA" sptr,sptr
	#func global EnumWindowStationsW "EnumWindowStationsW" wptr,wptr
	#func global EnumWindows "EnumWindows" sptr,sptr
	#func global EqualRect "EqualRect" sptr,sptr
	#func global ExcludeUpdateRgn "ExcludeUpdateRgn" sptr,sptr
	#func global ExitWindowsEx "ExitWindowsEx" sptr,sptr
	#func global FillRect "FillRect" sptr,sptr,sptr
	#define global FindWindow FindWindowA
	#func global FindWindowA "FindWindowA" sptr,sptr
	#define global FindWindowEx FindWindowExA
	#func global FindWindowExA "FindWindowExA" sptr,sptr,sptr,sptr
	#func global FindWindowExW "FindWindowExW" wptr,wptr,wptr,wptr
	#func global FindWindowW "FindWindowW" wptr,wptr
	#func global FlashWindow "FlashWindow" sptr,sptr
	#func global FlashWindowEx "FlashWindowEx" sptr
	#func global FrameRect "FrameRect" sptr,sptr,sptr
	#func global FreeDDElParam "FreeDDElParam" sptr,sptr
	#func global GetActiveWindow "GetActiveWindow"
	#func global GetAltTabInfo "GetAltTabInfo" sptr,sptr,sptr,sptr,sptr
	#func global GetAltTabInfoA "GetAltTabInfoA" sptr,sptr,sptr,sptr,sptr
	#func global GetAltTabInfoW "GetAltTabInfoW" wptr,wptr,wptr,wptr,wptr
	#func global GetAncestor "GetAncestor" sptr,sptr
	#func global GetAsyncKeyState "GetAsyncKeyState" sptr
	#func global GetCapture "GetCapture"
	#func global GetCaretBlinkTime "GetCaretBlinkTime"
	#func global GetCaretPos "GetCaretPos" sptr
	#define global GetClassInfo GetClassInfoA
	#func global GetClassInfoA "GetClassInfoA" sptr,sptr,sptr
	#define global GetClassInfoEx GetClassInfoExA
	#func global GetClassInfoExA "GetClassInfoExA" sptr,sptr,sptr
	#func global GetClassInfoExW "GetClassInfoExW" wptr,wptr,wptr
	#func global GetClassInfoW "GetClassInfoW" wptr,wptr,wptr
	#define global GetClassLong GetClassLongA
	#func global GetClassLongA "GetClassLongA" sptr,sptr
	#func global GetClassLongW "GetClassLongW" wptr,wptr
	#define global GetClassName GetClassNameA
	#func global GetClassNameA "GetClassNameA" sptr,sptr,sptr
	#func global GetClassNameW "GetClassNameW" wptr,wptr,wptr
	#func global GetClassWord "GetClassWord" sptr,sptr
	#func global GetClientRect "GetClientRect" sptr,sptr
	#func global GetClipCursor "GetClipCursor" sptr
	#func global GetClipboardData "GetClipboardData" sptr
	#define global GetClipboardFormatName GetClipboardFormatNameA
	#func global GetClipboardFormatNameA "GetClipboardFormatNameA" sptr,sptr,sptr
	#func global GetClipboardFormatNameW "GetClipboardFormatNameW" wptr,wptr,wptr
	#func global GetClipboardOwner "GetClipboardOwner"
	#func global GetClipboardSequenceNumber "GetClipboardSequenceNumber"
	#func global GetClipboardViewer "GetClipboardViewer"
	#func global GetComboBoxInfo "GetComboBoxInfo" sptr,sptr
	#func global GetCursor "GetCursor"
	#func global GetCursorInfo "GetCursorInfo" sptr
	#func global GetCursorPos "GetCursorPos" sptr
	#func global GetDC "GetDC" sptr
	#func global GetDCEx "GetDCEx" sptr,sptr,sptr
	#func global GetDesktopWindow "GetDesktopWindow"
	#func global GetDialogBaseUnits "GetDialogBaseUnits"
	#func global GetDlgCtrlID "GetDlgCtrlID" sptr
	#func global GetDlgItem "GetDlgItem" sptr,sptr
	#func global GetDlgItemInt "GetDlgItemInt" sptr,sptr,sptr,sptr
	#define global GetDlgItemText GetDlgItemTextA
	#func global GetDlgItemTextA "GetDlgItemTextA" sptr,sptr,sptr,sptr
	#func global GetDlgItemTextW "GetDlgItemTextW" wptr,wptr,wptr,wptr
	#func global GetDoubleClickTime "GetDoubleClickTime"
	#func global GetFocus "GetFocus"
	#func global GetForegroundWindow "GetForegroundWindow"
	#func global GetGUIThreadInfo "GetGUIThreadInfo" sptr,sptr
	#func global GetGuiResources "GetGuiResources" sptr,sptr
	#func global GetIconInfo "GetIconInfo" sptr,sptr
	#func global GetInputDesktop "GetInputDesktop"
	#func global GetInputState "GetInputState"
	#func global GetKBCodePage "GetKBCodePage"
	#define global GetKeyNameText GetKeyNameTextA
	#func global GetKeyNameTextA "GetKeyNameTextA" sptr,sptr,sptr
	#func global GetKeyNameTextW "GetKeyNameTextW" wptr,wptr,wptr
	#func global GetKeyState "GetKeyState" sptr
	#func global GetKeyboardLayout "GetKeyboardLayout" sptr
	#func global GetKeyboardLayoutList "GetKeyboardLayoutList" sptr,sptr
	#define global GetKeyboardLayoutName GetKeyboardLayoutNameA
	#func global GetKeyboardLayoutNameA "GetKeyboardLayoutNameA" sptr
	#func global GetKeyboardLayoutNameW "GetKeyboardLayoutNameW" wptr
	#func global GetKeyboardState "GetKeyboardState" sptr
	#func global GetKeyboardType "GetKeyboardType" sptr
	#func global GetLastActivePopup "GetLastActivePopup" sptr
	#func global GetLastInputInfo "GetLastInputInfo" sptr
	#func global GetListBoxInfo "GetListBoxInfo" sptr
	#func global GetMenu "GetMenu" sptr
	#func global GetMenuBarInfo "GetMenuBarInfo" sptr,sptr,sptr,sptr
	#func global GetMenuCheckMarkDimensions "GetMenuCheckMarkDimensions"
	#func global GetMenuContextHelpId "GetMenuContextHelpId" sptr
	#func global GetMenuDefaultItem "GetMenuDefaultItem" sptr,sptr,sptr
	#func global GetMenuInfo "GetMenuInfo" sptr,sptr
	#func global GetMenuItemCount "GetMenuItemCount" sptr
	#func global GetMenuItemID "GetMenuItemID" sptr,sptr
	#define global GetMenuItemInfo GetMenuItemInfoA
	#func global GetMenuItemInfoA "GetMenuItemInfoA" sptr,sptr,sptr,sptr
	#func global GetMenuItemInfoW "GetMenuItemInfoW" wptr,wptr,wptr,wptr
	#func global GetMenuItemRect "GetMenuItemRect" sptr,sptr,sptr,sptr
	#func global GetMenuState "GetMenuState" sptr,sptr,sptr
	#define global GetMenuString GetMenuStringA
	#func global GetMenuStringA "GetMenuStringA" sptr,sptr,sptr,sptr,sptr
	#func global GetMenuStringW "GetMenuStringW" wptr,wptr,wptr,wptr,wptr
	#define global GetMessage GetMessageA
	#func global GetMessageA "GetMessageA" sptr,sptr,sptr,sptr
	#func global GetMessageExtraInfo "GetMessageExtraInfo"
	#func global GetMessagePos "GetMessagePos"
	#func global GetMessageTime "GetMessageTime"
	#func global GetMessageW "GetMessageW" wptr,wptr,wptr,wptr
	#define global GetMonitorInfo GetMonitorInfoA
	#func global GetMonitorInfoA "GetMonitorInfoA" sptr,sptr
	#func global GetMonitorInfoW "GetMonitorInfoW" wptr,wptr
	#func global GetMouseMovePointsEx "GetMouseMovePointsEx" sptr,sptr,sptr,sptr,sptr
	#func global GetNextDlgGroupItem "GetNextDlgGroupItem" sptr,sptr,sptr
	#func global GetNextDlgTabItem "GetNextDlgTabItem" sptr,sptr,sptr
	#func global GetOpenClipboardWindow "GetOpenClipboardWindow"
	#func global GetParent "GetParent" sptr
	#func global GetPriorityClipboardFormat "GetPriorityClipboardFormat" sptr,sptr
	#func global GetProcessDefaultLayout "GetProcessDefaultLayout" sptr
	#func global GetProcessWindowStation "GetProcessWindowStation"
	#define global GetProp GetPropA
	#func global GetPropA "GetPropA" sptr,sptr
	#func global GetPropW "GetPropW" wptr,wptr
	#func global GetQueueStatus "GetQueueStatus" sptr
	#func global GetScrollBarInfo "GetScrollBarInfo" sptr,sptr,sptr
	#func global GetScrollInfo "GetScrollInfo" sptr,sptr,sptr
	#func global GetScrollPos "GetScrollPos" sptr,sptr
	#func global GetScrollRange "GetScrollRange" sptr,sptr,sptr,sptr
	#func global GetShellWindow "GetShellWindow"
	#func global GetSubMenu "GetSubMenu" sptr,sptr
	#func global GetSysColor "GetSysColor" sptr
	#func global GetSysColorBrush "GetSysColorBrush" sptr
	#func global GetSystemMenu "GetSystemMenu" sptr,sptr
	#func global GetSystemMetrics "GetSystemMetrics" sptr
	#define global GetTabbedTextExtent GetTabbedTextExtentA
	#func global GetTabbedTextExtentA "GetTabbedTextExtentA" sptr,sptr,sptr,sptr,sptr
	#func global GetTabbedTextExtentW "GetTabbedTextExtentW" wptr,wptr,wptr,wptr,wptr
	#func global GetThreadDesktop "GetThreadDesktop" sptr
	#func global GetTitleBarInfo "GetTitleBarInfo" sptr,sptr
	#func global GetTopWindow "GetTopWindow" sptr
	#func global GetUpdateRect "GetUpdateRect" sptr,sptr,sptr
	#func global GetUpdateRgn "GetUpdateRgn" sptr,sptr,sptr
	#define global GetUserObjectInformation GetUserObjectInformationA
	#func global GetUserObjectInformationA "GetUserObjectInformationA" sptr,sptr,sptr,sptr,sptr
	#func global GetUserObjectInformationW "GetUserObjectInformationW" wptr,wptr,wptr,wptr,wptr
	#func global GetUserObjectSecurity "GetUserObjectSecurity" sptr,sptr,sptr,sptr,sptr
	#func global GetWindow "GetWindow" sptr,sptr
	#func global GetWindowContextHelpId "GetWindowContextHelpId" sptr
	#func global GetWindowDC "GetWindowDC" sptr
	#func global GetWindowInfo "GetWindowInfo" sptr,sptr
	#define global GetWindowLong GetWindowLongA
	#func global GetWindowLongA "GetWindowLongA" sptr,sptr
	#func global GetWindowLongW "GetWindowLongW" wptr,wptr
	#func global GetWindowModuleFileName "GetWindowModuleFileNameA" sptr,sptr,sptr
	#func global GetWindowModuleFileNameA "GetWindowModuleFileNameA" sptr,sptr,sptr
	#func global GetWindowModuleFileNameW "GetWindowModuleFileNameW" wptr,wptr,wptr
	#func global GetWindowPlacement "GetWindowPlacement" sptr,sptr
	#func global GetWindowRect "GetWindowRect" sptr,sptr
	#func global GetWindowRgn "GetWindowRgn" sptr,sptr
	#define global GetWindowText GetWindowTextA
	#func global GetWindowTextA "GetWindowTextA" sptr,sptr,sptr
	#define global GetWindowTextLength GetWindowTextLengthA
	#func global GetWindowTextLengthA "GetWindowTextLengthA" sptr
	#func global GetWindowTextLengthW "GetWindowTextLengthW" wptr
	#func global GetWindowTextW "GetWindowTextW" wptr,wptr,wptr
	#func global GetWindowThreadProcessId "GetWindowThreadProcessId" sptr,sptr
	#func global GetWindowWord "GetWindowWord" sptr,sptr
	#define global GrayString GrayStringA
	#func global GrayStringA "GrayStringA" sptr,sptr,sptr,sptr,sptr,sptr,sptr,sptr,sptr
	#func global GrayStringW "GrayStringW" wptr,wptr,wptr,wptr,wptr,wptr,wptr,wptr,wptr
	#func global HideCaret "HideCaret" sptr
	#func global HiliteMenuItem "HiliteMenuItem" sptr,sptr,sptr,sptr
	#define global IMPGetIME IMPGetIMEA
	#func global IMPGetIMEA "IMPGetIMEA" sptr,sptr
	#func global IMPGetIMEW "IMPGetIMEW" wptr,wptr
	#define global IMPQueryIME IMPQueryIMEA
	#func global IMPQueryIMEA "IMPQueryIMEA" sptr
	#func global IMPQueryIMEW "IMPQueryIMEW" wptr
	#define global IMPSetIME IMPSetIMEA
	#func global IMPSetIMEA "IMPSetIMEA" sptr,sptr
	#func global IMPSetIMEW "IMPSetIMEW" wptr,wptr
	#func global ImpersonateDdeClientWindow "ImpersonateDdeClientWindow" sptr,sptr
	#func global InSendMessage "InSendMessage"
	#func global InSendMessageEx "InSendMessageEx" sptr
	#func global InflateRect "InflateRect" sptr,sptr,sptr
	#define global InsertMenu InsertMenuA
	#func global InsertMenuA "InsertMenuA" sptr,sptr,sptr,sptr,sptr
	#define global InsertMenuItem InsertMenuItemA
	#func global InsertMenuItemA "InsertMenuItemA" sptr,sptr,sptr,sptr
	#func global InsertMenuItemW "InsertMenuItemW" wptr,wptr,wptr,wptr
	#func global InsertMenuW "InsertMenuW" wptr,wptr,wptr,wptr,wptr
	#func global IntersectRect "IntersectRect" sptr,sptr,sptr
	#func global InvalidateRect "InvalidateRect" sptr,sptr,sptr
	#func global InvalidateRgn "InvalidateRgn" sptr,sptr,sptr
	#func global InvertRect "InvertRect" sptr,sptr
	#define global IsCharAlpha IsCharAlphaA
	#func global IsCharAlphaA "IsCharAlphaA" sptr
	#define global IsCharAlphaNumeric IsCharAlphaNumericA
	#func global IsCharAlphaNumericA "IsCharAlphaNumericA" sptr
	#func global IsCharAlphaNumericW "IsCharAlphaNumericW" wptr
	#func global IsCharAlphaW "IsCharAlphaW" wptr
	#define global IsCharLower IsCharLowerA
	#func global IsCharLowerA "IsCharLowerA" sptr
	#func global IsCharLowerW "IsCharLowerW" wptr
	#define global IsCharUpper IsCharUpperA
	#func global IsCharUpperA "IsCharUpperA" sptr
	#func global IsCharUpperW "IsCharUpperW" wptr
	#func global IsChild "IsChild" sptr,sptr
	#func global IsClipboardFormatAvailable "IsClipboardFormatAvailable" sptr
	#func global IsDialogMessage "IsDialogMessage" sptr,sptr
	#func global IsDialogMessageA "IsDialogMessageA" sptr,sptr
	#func global IsDialogMessageW "IsDialogMessageW" wptr,wptr
	#func global IsDlgButtonChecked "IsDlgButtonChecked" sptr,sptr
	#func global IsIconic "IsIconic" sptr
	#func global IsMenu "IsMenu" sptr
	#func global IsRectEmpty "IsRectEmpty" sptr
	#func global IsWindow "IsWindow" sptr
	#func global IsWindowEnabled "IsWindowEnabled" sptr
	#func global IsWindowUnicode "IsWindowUnicode" sptr
	#func global IsWindowVisible "IsWindowVisible" sptr
	#func global IsZoomed "IsZoomed" sptr
	#func global KillTimer "KillTimer" sptr,sptr
	#define global LoadAccelerators LoadAcceleratorsA
	#func global LoadAcceleratorsA "LoadAcceleratorsA" sptr,sptr
	#func global LoadAcceleratorsW "LoadAcceleratorsW" wptr,wptr
	#define global LoadBitmap LoadBitmapA
	#func global LoadBitmapA "LoadBitmapA" sptr,sptr
	#func global LoadBitmapW "LoadBitmapW" wptr,wptr
	#define global LoadCursor LoadCursorA
	#func global LoadCursorA "LoadCursorA" sptr,sptr
	#define global LoadCursorFromFile LoadCursorFromFileA
	#func global LoadCursorFromFileA "LoadCursorFromFileA" sptr
	#func global LoadCursorFromFileW "LoadCursorFromFileW" wptr
	#func global LoadCursorW "LoadCursorW" wptr,wptr
	#define global LoadIcon LoadIconA
	#func global LoadIconA "LoadIconA" sptr,sptr
	#func global LoadIconW "LoadIconW" wptr,wptr
	#define global LoadImage LoadImageA
	#func global LoadImageA "LoadImageA" sptr,sptr,sptr,sptr,sptr,sptr
	#func global LoadImageW "LoadImageW" wptr,wptr,wptr,wptr,wptr,wptr
	#define global LoadKeyboardLayout LoadKeyboardLayoutA
	#func global LoadKeyboardLayoutA "LoadKeyboardLayoutA" sptr,sptr
	#func global LoadKeyboardLayoutW "LoadKeyboardLayoutW" wptr,wptr
	#define global LoadMenu LoadMenuA
	#func global LoadMenuA "LoadMenuA" sptr,sptr
	#define global LoadMenuIndirect LoadMenuIndirectA
	#func global LoadMenuIndirectA "LoadMenuIndirectA" sptr
	#func global LoadMenuIndirectW "LoadMenuIndirectW" wptr
	#func global LoadMenuW "LoadMenuW" wptr,wptr
	#define global LoadString LoadStringA
	#func global LoadStringA "LoadStringA" sptr,sptr,sptr,sptr
	#func global LoadStringW "LoadStringW" wptr,wptr,wptr,wptr
	#func global LockSetForegroundWindow "LockSetForegroundWindow" sptr
	#func global LockWindowUpdate "LockWindowUpdate" sptr
	#func global LockWorkStation "LockWorkStation"
	#func global LookupIconIdFromDirectory "LookupIconIdFromDirectory" sptr,sptr
	#func global LookupIconIdFromDirectoryEx "LookupIconIdFromDirectoryEx" sptr,sptr,sptr,sptr,sptr
	#func global MapDialogRect "MapDialogRect" sptr,sptr
	#define global MapVirtualKey MapVirtualKeyA
	#func global MapVirtualKeyA "MapVirtualKeyA" sptr,sptr
	#define global MapVirtualKeyEx MapVirtualKeyExA
	#func global MapVirtualKeyExA "MapVirtualKeyExA" sptr,sptr,sptr
	#func global MapVirtualKeyExW "MapVirtualKeyExW" wptr,wptr,wptr
	#func global MapVirtualKeyW "MapVirtualKeyW" wptr,wptr
	#func global MapWindowPoints "MapWindowPoints" sptr,sptr,sptr,sptr
	#func global MenuItemFromPoint "MenuItemFromPoint" sptr,sptr,sptr,sptr
	#func global MessageBeep "MessageBeep" sptr
	#define global MessageBox MessageBoxA
	#func global MessageBoxA "MessageBoxA" sptr,sptr,sptr,sptr
	#define global MessageBoxEx MessageBoxExA
	#func global MessageBoxExA "MessageBoxExA" sptr,sptr,sptr,sptr,sptr
	#func global MessageBoxExW "MessageBoxExW" wptr,wptr,wptr,wptr,wptr
	#define global MessageBoxIndirect MessageBoxIndirectA
	#func global MessageBoxIndirectA "MessageBoxIndirectA" sptr
	#func global MessageBoxIndirectW "MessageBoxIndirectW" wptr
	#func global MessageBoxW "MessageBoxW" wptr,wptr,wptr,wptr
	#define global ModifyMenu ModifyMenuA
	#func global ModifyMenuA "ModifyMenuA" sptr,sptr,sptr,sptr,sptr
	#func global ModifyMenuW "ModifyMenuW" wptr,wptr,wptr,wptr,wptr
	#func global MonitorFromPoint "MonitorFromPoint" sptr,sptr,sptr
	#func global MonitorFromRect "MonitorFromRect" sptr,sptr
	#func global MonitorFromWindow "MonitorFromWindow" sptr,sptr
	#func global MoveWindow "MoveWindow" sptr,sptr,sptr,sptr,sptr,sptr
	#func global MsgWaitForMultipleObjects "MsgWaitForMultipleObjects" sptr,sptr,sptr,sptr,sptr
	#func global MsgWaitForMultipleObjectsEx "MsgWaitForMultipleObjectsEx" sptr,sptr,sptr,sptr,sptr
	#func global NotifyWinEvent "NotifyWinEvent" sptr,sptr,sptr,sptr
	#func global OemKeyScan "OemKeyScan" sptr
	#define global OemToChar OemToCharA
	#func global OemToCharA "OemToCharA" sptr,sptr
	#define global OemToCharBuff OemToCharBuffA
	#func global OemToCharBuffA "OemToCharBuffA" sptr,sptr,sptr
	#func global OemToCharBuffW "OemToCharBuffW" wptr,wptr,wptr
	#func global OemToCharW "OemToCharW" wptr,wptr
	#func global OffsetRect "OffsetRect" sptr,sptr,sptr
	#func global OpenClipboard "OpenClipboard" sptr
	#define global OpenDesktop OpenDesktopA
	#func global OpenDesktopA "OpenDesktopA" sptr,sptr,sptr,sptr
	#func global OpenDesktopW "OpenDesktopW" wptr,wptr,wptr,wptr
	#func global OpenIcon "OpenIcon" sptr
	#func global OpenInputDesktop "OpenInputDesktop" sptr,sptr,sptr
	#define global OpenWindowStation OpenWindowStationA
	#func global OpenWindowStationA "OpenWindowStationA" sptr,sptr,sptr
	#func global OpenWindowStationW "OpenWindowStationW" wptr,wptr,wptr
	#func global PackDDElParam "PackDDElParam" sptr,sptr,sptr
	#func global PaintDesktop "PaintDesktop" sptr
	#define global PeekMessage PeekMessageA
	#func global PeekMessageA "PeekMessageA" sptr,sptr,sptr,sptr,sptr
	#func global PeekMessageW "PeekMessageW" wptr,wptr,wptr,wptr,wptr
	#define global PostMessage PostMessageA
	#func global PostMessageA "PostMessageA" sptr,sptr,sptr,sptr
	#func global PostMessageW "PostMessageW" wptr,wptr,wptr,wptr
	#func global PostQuitMessage "PostQuitMessage" sptr
	#define global PostThreadMessage PostThreadMessageA
	#func global PostThreadMessageA "PostThreadMessageA" sptr,sptr,sptr,sptr
	#func global PostThreadMessageW "PostThreadMessageW" wptr,wptr,wptr,wptr
	#func global PtInRect "PtInRect" sptr,sptr,sptr
	#func global RealChildWindowFromPoint "RealChildWindowFromPoint" sptr,sptr,sptr
	#func global RealGetWindowClass "RealGetWindowClass" sptr,sptr,sptr
	#func global RealGetWindowClassA "RealGetWindowClassA" sptr,sptr,sptr
	#func global RealGetWindowClassW "RealGetWindowClassW" wptr,wptr,wptr
	#func global RedrawWindow "RedrawWindow" sptr,sptr,sptr,sptr
	#define global RegisterClass RegisterClassA
	#func global RegisterClassA "RegisterClassA" sptr
	#define global RegisterClassEx RegisterClassExA
	#func global RegisterClassExA "RegisterClassExA" sptr
	#func global RegisterClassExW "RegisterClassExW" wptr
	#func global RegisterClassW "RegisterClassW" wptr
	#define global RegisterClipboardFormat RegisterClipboardFormatA
	#func global RegisterClipboardFormatA "RegisterClipboardFormatA" sptr
	#func global RegisterClipboardFormatW "RegisterClipboardFormatW" wptr
	#define global RegisterDeviceNotification RegisterDeviceNotificationA
	#func global RegisterDeviceNotificationA "RegisterDeviceNotificationA" sptr,sptr,sptr
	#func global RegisterDeviceNotificationW "RegisterDeviceNotificationW" wptr,wptr,wptr
	#func global RegisterHotKey "RegisterHotKey" sptr,sptr,sptr,sptr
	#define global RegisterWindowMessage RegisterWindowMessageA
	#func global RegisterWindowMessageA "RegisterWindowMessageA" sptr
	#func global RegisterWindowMessageW "RegisterWindowMessageW" wptr
	#func global ReleaseCapture "ReleaseCapture"
	#func global ReleaseDC "ReleaseDC" sptr,sptr
	#func global RemoveMenu "RemoveMenu" sptr,sptr,sptr
	#define global RemoveProp RemovePropA
	#func global RemovePropA "RemovePropA" sptr,sptr
	#func global RemovePropW "RemovePropW" wptr,wptr
	#func global ReplyMessage "ReplyMessage" sptr
	#func global ReuseDDElParam "ReuseDDElParam" sptr,sptr,sptr,sptr,sptr
	#func global ScreenToClient "ScreenToClient" sptr,sptr
	#func global ScrollDC "ScrollDC" sptr,sptr,sptr,sptr,sptr,sptr,sptr
	#func global ScrollWindow "ScrollWindow" sptr,sptr,sptr,sptr,sptr
	#func global ScrollWindowEx "ScrollWindowEx" sptr,sptr,sptr,sptr,sptr,sptr,sptr,sptr
	#define global SendDlgItemMessage SendDlgItemMessageA
	#func global SendDlgItemMessageA "SendDlgItemMessageA" sptr,sptr,sptr,sptr,sptr
	#func global SendDlgItemMessageW "SendDlgItemMessageW" wptr,wptr,wptr,wptr,wptr
	#define global SendIMEMessageEx SendIMEMessageExA
	#func global SendIMEMessageExA "SendIMEMessageExA" sptr,sptr
	#func global SendIMEMessageExW "SendIMEMessageExW" wptr,wptr
	#func global SendInput "SendInput" sptr,sptr,sptr
	#define global SendMessage SendMessageA
	#func global SendMessageA "SendMessageA" sptr,sptr,sptr,sptr
	#define global SendMessageCallback SendMessageCallbackA
	#func global SendMessageCallbackA "SendMessageCallbackA" sptr,sptr,sptr,sptr,sptr,sptr
	#func global SendMessageCallbackW "SendMessageCallbackW" wptr,wptr,wptr,wptr,wptr,wptr
	#define global SendMessageTimeout SendMessageTimeoutA
	#func global SendMessageTimeoutA "SendMessageTimeoutA" sptr,sptr,sptr,sptr,sptr,sptr,sptr
	#func global SendMessageTimeoutW "SendMessageTimeoutW" wptr,wptr,wptr,wptr,wptr,wptr,wptr
	#func global SendMessageW "SendMessageW" wptr,wptr,wptr,wptr
	#define global SendNotifyMessage SendNotifyMessageA
	#func global SendNotifyMessageA "SendNotifyMessageA" sptr,sptr,sptr,sptr
	#func global SendNotifyMessageW "SendNotifyMessageW" wptr,wptr,wptr,wptr
	#func global SetActiveWindow "SetActiveWindow" sptr
	#func global SetCapture "SetCapture" sptr
	#func global SetCaretBlinkTime "SetCaretBlinkTime" sptr
	#func global SetCaretPos "SetCaretPos" sptr,sptr
	#define global SetClassLong SetClassLongA
	#func global SetClassLongA "SetClassLongA" sptr,sptr,sptr
	#func global SetClassLongW "SetClassLongW" wptr,wptr,wptr
	#func global SetClassWord "SetClassWord" sptr,sptr,sptr
	#func global SetClipboardData "SetClipboardData" sptr,sptr
	#func global SetClipboardViewer "SetClipboardViewer" sptr
	#func global SetCursor "SetCursor" sptr
	#func global SetCursorPos "SetCursorPos" sptr,sptr
	#func global SetDebugErrorLevel "SetDebugErrorLevel" sptr
	#func global SetDeskWallpaper "SetDeskWallpaper" sptr
	#func global SetDlgItemInt "SetDlgItemInt" sptr,sptr,sptr,sptr
	#define global SetDlgItemText SetDlgItemTextA
	#func global SetDlgItemTextA "SetDlgItemTextA" sptr,sptr,sptr
	#func global SetDlgItemTextW "SetDlgItemTextW" wptr,wptr,wptr
	#func global SetDoubleClickTime "SetDoubleClickTime" sptr
	#func global SetFocus "SetFocus" sptr
	#func global SetForegroundWindow "SetForegroundWindow" sptr
	#func global SetKeyboardState "SetKeyboardState" sptr
	#func global SetLastErrorEx "SetLastErrorEx" sptr,sptr
	#func global SetLayeredWindowAttributes "SetLayeredWindowAttributes" sptr,sptr,sptr,sptr
	#func global SetMenu "SetMenu" sptr,sptr
	#func global SetMenuContextHelpId "SetMenuContextHelpId" sptr,sptr
	#func global SetMenuDefaultItem "SetMenuDefaultItem" sptr,sptr,sptr
	#func global SetMenuInfo "SetMenuInfo" sptr,sptr
	#func global SetMenuItemBitmaps "SetMenuItemBitmaps" sptr,sptr,sptr,sptr,sptr
	#define global SetMenuItemInfo SetMenuItemInfoA
	#func global SetMenuItemInfoA "SetMenuItemInfoA" sptr,sptr,sptr,sptr
	#func global SetMenuItemInfoW "SetMenuItemInfoW" wptr,wptr,wptr,wptr
	#func global SetMessageExtraInfo "SetMessageExtraInfo" sptr
	#func global SetMessageQueue "SetMessageQueue" sptr
	#func global SetParent "SetParent" sptr,sptr
	#func global SetProcessDefaultLayout "SetProcessDefaultLayout" sptr
	#func global SetProcessWindowStation "SetProcessWindowStation" sptr
	#define global SetProp SetPropA
	#func global SetPropA "SetPropA" sptr,sptr,sptr
	#func global SetPropW "SetPropW" wptr,wptr,wptr
	#func global SetRect "SetRect" sptr,sptr,sptr,sptr,sptr
	#func global SetRectEmpty "SetRectEmpty" sptr
	#func global SetScrollInfo "SetScrollInfo" sptr,sptr,sptr,sptr
	#func global SetScrollPos "SetScrollPos" sptr,sptr,sptr,sptr
	#func global SetScrollRange "SetScrollRange" sptr,sptr,sptr,sptr,sptr
	#func global SetShellWindow "SetShellWindow" sptr
	#func global SetSysColors "SetSysColors" sptr,sptr,sptr
	#func global SetSystemCursor "SetSystemCursor" sptr,sptr
	#func global SetThreadDesktop "SetThreadDesktop" sptr
	#func global SetTimer "SetTimer" sptr,sptr,sptr,sptr
	#define global SetUserObjectInformation SetUserObjectInformationA
	#func global SetUserObjectInformationA "SetUserObjectInformationA" sptr,sptr,sptr,sptr
	#func global SetUserObjectInformationW "SetUserObjectInformationW" wptr,wptr,wptr,wptr
	#func global SetUserObjectSecurity "SetUserObjectSecurity" sptr,sptr,sptr
	#func global SetWinEventHook "SetWinEventHook" sptr,sptr,sptr,sptr,sptr,sptr,sptr
	#func global SetWindowContextHelpId "SetWindowContextHelpId" sptr,sptr
	#define global SetWindowLong SetWindowLongA
	#func global SetWindowLongA "SetWindowLongA" sptr,sptr,sptr
	#func global SetWindowLongW "SetWindowLongW" wptr,wptr,wptr
	#func global SetWindowPlacement "SetWindowPlacement" sptr,sptr
	#func global SetWindowPos "SetWindowPos" sptr,sptr,sptr,sptr,sptr,sptr,sptr
	#func global SetWindowRgn "SetWindowRgn" sptr,sptr,sptr
	#define global SetWindowText SetWindowTextA
	#func global SetWindowTextA "SetWindowTextA" sptr,sptr
	#func global SetWindowTextW "SetWindowTextW" wptr,wptr
	#func global SetWindowWord "SetWindowWord" sptr,sptr,sptr
	#define global SetWindowsHook SetWindowsHookA
	#func global SetWindowsHookA "SetWindowsHookA" sptr,sptr
	#define global SetWindowsHookEx SetWindowsHookExA
	#func global SetWindowsHookExA "SetWindowsHookExA" sptr,sptr,sptr,sptr
	#func global SetWindowsHookExW "SetWindowsHookExW" wptr,wptr,wptr,wptr
	#func global SetWindowsHookW "SetWindowsHookW" wptr,wptr
	#func global ShowCaret "ShowCaret" sptr
	#func global ShowCursor "ShowCursor" sptr
	#func global ShowOwnedPopups "ShowOwnedPopups" sptr,sptr
	#func global ShowScrollBar "ShowScrollBar" sptr,sptr,sptr
	#func global ShowWindow "ShowWindow" sptr,sptr
	#func global ShowWindowAsync "ShowWindowAsync" sptr,sptr
	#func global SubtractRect "SubtractRect" sptr,sptr,sptr
	#func global SwapMouseButton "SwapMouseButton" sptr
	#func global SwitchDesktop "SwitchDesktop" sptr
	#define global SystemParametersInfo SystemParametersInfoA
	#func global SystemParametersInfoA "SystemParametersInfoA" sptr,sptr,sptr,sptr
	#func global SystemParametersInfoW "SystemParametersInfoW" wptr,wptr,wptr,wptr
	#define global TabbedTextOut TabbedTextOutA
	#func global TabbedTextOutA "TabbedTextOutA" sptr,sptr,sptr,sptr,sptr,sptr,sptr,sptr
	#func global TabbedTextOutW "TabbedTextOutW" wptr,wptr,wptr,wptr,wptr,wptr,wptr,wptr
	#func global TileChildWindows "TileChildWindows" sptr,sptr
	#func global TileWindows "TileWindows" sptr,sptr,sptr,sptr,sptr
	#func global ToAscii "ToAscii" sptr,sptr,sptr,sptr,sptr
	#func global ToAsciiEx "ToAsciiEx" sptr,sptr,sptr,sptr,sptr,sptr
	#func global ToUnicode "ToUnicode" sptr,sptr,sptr,sptr,sptr,sptr
	#func global ToUnicodeEx "ToUnicodeEx" sptr,sptr,sptr,sptr,sptr,sptr,sptr
	#func global TrackMouseEvent "TrackMouseEvent" sptr
	#func global TrackPopupMenu "TrackPopupMenu" sptr,sptr,sptr,sptr,sptr,sptr,sptr
	#func global TrackPopupMenuEx "TrackPopupMenuEx" sptr,sptr,sptr,sptr,sptr,sptr
	#func global TranslateAccelerator "TranslateAccelerator" sptr,sptr,sptr
	#func global TranslateAcceleratorA "TranslateAcceleratorA" sptr,sptr,sptr
	#func global TranslateAcceleratorW "TranslateAcceleratorW" wptr,wptr,wptr
	#func global TranslateMDISysAccel "TranslateMDISysAccel" sptr,sptr
	#func global TranslateMessage "TranslateMessage" sptr
	#func global UnhookWinEvent "UnhookWinEvent" sptr
	#func global UnhookWindowsHook "UnhookWindowsHook" sptr,sptr
	#func global UnhookWindowsHookEx "UnhookWindowsHookEx" sptr
	#func global UnionRect "UnionRect" sptr,sptr,sptr
	#func global UnloadKeyboardLayout "UnloadKeyboardLayout" sptr
	#func global UnpackDDElParam "UnpackDDElParam" sptr,sptr,sptr,sptr
	#define global UnregisterClass UnregisterClassA
	#func global UnregisterClassA "UnregisterClassA" sptr,sptr
	#func global UnregisterClassW "UnregisterClassW" wptr,wptr
	#func global UnregisterDeviceNotification "UnregisterDeviceNotification" sptr
	#func global UnregisterHotKey "UnregisterHotKey" sptr,sptr
	#func global UpdateLayeredWindow "UpdateLayeredWindow" sptr,sptr,sptr,sptr,sptr,sptr,sptr,sptr,sptr
	#func global UpdateWindow "UpdateWindow" sptr
	#func global UserHandleGrantAccess "UserHandleGrantAccess" sptr,sptr,sptr
	#func global ValidateRect "ValidateRect" sptr,sptr
	#func global ValidateRgn "ValidateRgn" sptr,sptr
	#define global VkKeyScan VkKeyScanA
	#func global VkKeyScanA "VkKeyScanA" sptr
	#define global VkKeyScanEx VkKeyScanExA
	#func global VkKeyScanExA "VkKeyScanExA" sptr,sptr
	#func global VkKeyScanExW "VkKeyScanExW" wptr,wptr
	#func global VkKeyScanW "VkKeyScanW" wptr
	#func global WINNLSEnableIME "WINNLSEnableIME" sptr,sptr
	#func global WINNLSGetEnableStatus "WINNLSGetEnableStatus" sptr
	#func global WINNLSGetIMEHotkey "WINNLSGetIMEHotkey" sptr
	#func global WaitForInputIdle "WaitForInputIdle" sptr,sptr
	#func global WaitMessage "WaitMessage"
	#func global Win32PoolAllocationStats "Win32PoolAllocationStats" sptr,sptr,sptr,sptr,sptr,sptr
	#define global WinHelp WinHelpA
	#func global WinHelpA "WinHelpA" sptr,sptr,sptr,sptr
	#func global WinHelpW "WinHelpW" wptr,wptr,wptr,wptr
	#func global WindowFromDC "WindowFromDC" sptr
	#func global WindowFromPoint "WindowFromPoint" sptr,sptr
	#func global keybd_event "keybd_event" sptr,sptr,sptr,sptr
	#func global mouse_event "mouse_event" sptr,sptr,sptr,sptr,sptr
	#define global wsprintf wsprintfA
	#func global wsprintfA "wsprintfA" sptr,sptr,sptr,sptr,sptr,sptr,sptr,sptr,sptr,sptr,sptr,sptr,sptr,sptr,sptr,sptr
	#func global wsprintfW "wsprintfW" wptr,wptr,wptr,wptr,wptr,wptr,wptr,wptr,wptr,wptr,wptr,wptr,wptr,wptr,wptr,wptr
	#define global wvsprintf wvsprintfA
	#func global wvsprintfA "wvsprintfA" sptr,sptr,sptr
	#func global wvsprintfW "wvsprintfW" wptr,wptr,wptr
#endif
#endif
