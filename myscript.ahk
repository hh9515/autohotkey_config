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
    if (GetKeyState("Shift") = 0) ; 如果 Shift 在0.3秒内被释放
        Send("^f") ; 发送 Ctrl+F 组合键
}

CapsLock::Return
RAlt::Shift