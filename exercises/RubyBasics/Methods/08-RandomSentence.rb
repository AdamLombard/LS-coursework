def day(days)
  days.sample
end

def name(names)
  names.sample
end

def activity(activities)
  activities.sample
end

def sentence(day, name, activity)
  "On #{day} #{name} enjoys #{activity}."
end

days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
names = ['Dave', 'Sally', 'George', 'Jessica']
activities = ['walking', 'running', 'cycling']

puts sentence(day(days), name(names), activity(activities))