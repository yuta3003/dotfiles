----------------------------------------------------
-- Hammerspoon init.lua
----------------------------------------------------

----------------------------------------------------
-- WezTerm トグル（Ctrl+I）
----------------------------------------------------
hs.hotkey.bind({"ctrl"}, "i", function()
  local app = hs.application.find("WezTerm")
  if app == nil then
    hs.application.launchOrFocus("WezTerm")
    return
  end
  if app:isFrontmost() then
    app:hide()
  else
    app:activate()
    local win = app:mainWindow()
    if win then
      win:unminimize()
      win:focus()
    end
  end
end)

----------------------------------------------------
-- プレフィックスモード定義
----------------------------------------------------
local prefix = hs.hotkey.modal.new()

function prefix:entered()
  hs.alert.show("⌨", 0.8)
  hs.timer.doAfter(2, function() prefix:exit() end)
end

local function bind(key, appName)
  prefix:bind({}, key, function()
    hs.application.launchOrFocus(appName)
    prefix:exit()
  end)
end

bind("c", "Google Chrome")
bind("s", "Slack")
bind("v", "Visual Studio Code")
bind("w", "WezTerm")
bind("f", "Finder")

prefix:bind({}, "escape", function() prefix:exit() end)

----------------------------------------------------
-- Right Command タップ → プレフィックスモード突入
----------------------------------------------------
local skipApps = {
}

hs.hotkey.bind({"ctrl"}, "k", function()
  local frontApp = hs.application.frontmostApplication()
  if skipApps[frontApp:name()] then
    return true
  end
  prefix:enter()
end)

----------------------------------------------------
-- ウィンドウ管理（Shift+Command+矢印）
----------------------------------------------------
local function moveWindow(x, y, w, h)
  local win = hs.window.focusedWindow()
  if not win then return end
  local screen = win:screen():frame()
  win:setFrame({
    x = screen.x + screen.w * x,
    y = screen.y + screen.h * y,
    w = screen.w * w,
    h = screen.h * h,
  })
end

-- 左半分
hs.hotkey.bind({"shift", "cmd"}, "left", function()
  moveWindow(0, 0, 0.5, 1)
end)

-- 右半分
hs.hotkey.bind({"shift", "cmd"}, "right", function()
  moveWindow(0.5, 0, 0.5, 1)
end)

-- 全画面
hs.hotkey.bind({"shift", "cmd"}, "up", function()
  moveWindow(0, 0, 1, 1)
end)
