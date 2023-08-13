#Requires AutoHotkey v2.0

F1::Send("^q")
F3::Send "^{Tab}"
F2::Send "^+{Tab}"
!q::Send("!{F4}")
!w::Send "^w"
!a::Send "^a"

Ctrl:: {
    KeyWait("Ctrl", 0.3) ; 等待0.3秒，如果在这个时间内 Ctrl 被释放，则继续执行下面的代码
    if (GetKeyState("Ctrl") = 0) ; 如果 Ctrl 在0.3秒内被释放
        Send("^l") ; 发送 Ctrl+L 组合键
}

Shift:: {
    KeyWait("Shift", 0.3) ; 等待0.3秒，如果在这个时间内 Shift 被释放，则继续执行下面的代码
    if (GetKeyState("Shift") = 0) { ; 如果 Shift 在0.3秒内被释放
        Send "{Shift down}"
        Send "{Shift up}" ; 模拟按下并释放" Shift 键
        Send("^f") ; 发送 Ctrl+F 组合键
    }
}

RAlt:: {
    StartTime := A_TickCount
    While GetKeyState("RAlt", "P") {
        If (A_TickCount - StartTime) > 500 {
            Send "{Esc}" ; 先发送Esc键
            Sleep 30 ; 稍微等待，确保按键被处理
            Send "^a"
            return
        }
    }
    Send "{Shift down}"
    KeyWait "RAlt"
    Send "{Shift up}"
}



CapsLock::Send("^t")