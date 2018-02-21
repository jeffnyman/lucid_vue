require "tapestry"
World(Tapestry::Factory)

def browser_context_start
  target = (ENV['BROWSER'] || 'chrome').to_sym
  Tapestry.start_browser target
end

def browser_context_stop
  Tapestry.quit_browser
end
