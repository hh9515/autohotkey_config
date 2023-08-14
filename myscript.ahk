#Requires AutoHotkey v2.0

; f1 映射为ctrlq(配合Chrome的 previous tab插件)
F1::Send("^q")
; f3 映射为ctrl tab方便Chrome中下一页
F3::Send "^{Tab}"
; f2 映射为 ctrl shift tab 方便chrome中上一页
F2::Send "^+{Tab}"
; alt q 映射为 alt f4
!q::Send("!{F4}")
; alt w 映射为 ctrl w 关闭当前(模仿macos)
!w::Send "^w"
; alt a 映射为 ctrl a
!a::Send "^a"

; ctrl 映射为 ctrl+l 便于在Chrome中控制地址栏
Ctrl:: {
    KeyWait("Ctrl", 0.3) ; 等待0.3秒，如果在这个时间内 Ctrl 被释放，则继续执行下面的代码
    if (GetKeyState("Ctrl") = 0) ; 如果 Ctrl 在0.3秒内被释放
        Send("^l") ; 发送 Ctrl+L 组合键
}

; shift映射为 ctrl+f 便于在Chrome中搜索查找
Shift:: {
    KeyWait("Shift", 0.3) ; 等待0.3秒，如果在这个时间内 Shift 被释放，则继续执行下面的代码
    if (GetKeyState("Shift") = 0) { ; 如果 Shift 在0.3秒内被释放
        Send "{Shift down}"
        Send "{Shift up}" ; 模拟按下并释放" Shift 键
        Send("^f") ; 发送 Ctrl+F 组合键
    }
}

; 右alt一直按住会映射为 ctrl + a,全选当前内容
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

; capslock会映射为ctrl+t 便于在Chrome中开启新标签
CapsLock::Send("^t")

; 右shift会映射为win+tab, 配合 alt-tab terminator 这个软件使用
RShift:: {
    Send "{LWin down}{Tab down}"
    KeyWait "RShift"
    Send "{LWin up}{Tab up}"
}
