hs.hotkey.bind({"shift", "ctrl"}, "W", function()
  hs.notify.new({
    title="Hammerspoon",
    informativeText="Hello World",
    hasActionButton=true,
    autoWithdraw=false,
    withdrawAfter=0,
    additionalActions={"Join meeting", "Snooze until start time"}
  }):send()
end)

hs.hotkey.bind({"shift", "ctrl"}, "R", function()
  hs.reload()
end)

hs.hotkey.bind({"ctrl", "alt"}, "delete", function()
  hs.task
    .new("/usr/bin/osascript", nil, {
      "-l",
      "JavaScript",
      os.getenv("HOME") .. "/.automation/close_notifications.js",
    })
    :start()
end)

hs.hotkey.bind({"ctrl", "alt"}, "tab", function()
  hs.task
    .new("/usr/bin/osascript", nil, {
      "-l",
      "JavaScript",
      os.getenv("HOME") .. "/.automation/close_notifications.js",
    })
    :start()
end)

hs.hotkey.bind({"shift", "ctrl"}, "A", function()
  hs.application.launchOrFocus("Safari")
end)

hs.hotkey.bind({"shift", "ctrl"}, "S", function()
  hs.application.launchOrFocus("Slack")
end)

hs.hotkey.bind({"shift", "ctrl"}, "D", function()
  hs.application.launchOrFocus("iTerm")
end)

hs.hotkey.bind({"shift", "ctrl"}, "F", function()
  hs.application.launchOrFocus("Cursor")
end)
