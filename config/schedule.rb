every 10.minutes do
  runner "Services::ScheduleChecker.send_notifs_for_near_webinars"
end
