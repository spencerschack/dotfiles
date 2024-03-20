"use strict";

function run() {
  const SystemEvents = Application("System Events");
  const NotificationCenter = SystemEvents.processes.byName("NotificationCenter");
  const notificationGroups =
    NotificationCenter.windows.length === 0
      ? []
      : NotificationCenter.windows.at(0).groups.at(0).scrollAreas.at(0).uiElements.at(0).groups();

  for (const group of notificationGroups) {
    for (const action of group.actions()) {
      switch (action.description()) {
        case "Snooze until start time":
        case "Join meeting":
          action.perform()
          return
      }
    }
  }
}
