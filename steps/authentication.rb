Given(/^(?:a|an|the) (.*) user can (?:log|sign) in to the application$/) do |type|
  on_view(Home).login_as_user(type)
end

Given(/^an authenticated user on the planets page$/) do
  on_view(Home).login_as_authenticated_user

  # One way to navigate
  on(Navigation).navigate.to_planet_page

  # Another way to do it.
  #on(Navigation).navigate_to("planet weight calculator")
end
