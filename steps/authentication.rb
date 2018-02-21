Given(/^(?:a|an|the) (.*) user can (?:log|sign) in to the application$/) do |type|
  on_view(Home).login_as_user(type)
end
