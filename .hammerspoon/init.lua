hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
  hs.notify.new({
    title="Hammerspoon",
    informativeText="Hello World",
    hasActionButton=true,
    autoWithdraw=false,
    withdrawAfter=0,
    additionalActions={"Join meeting", "Snooze until start time"}
  }):send()
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
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
