AfterConfiguration do |config|
  puts("Feature specs executed from: #{config.feature_dirs}")
end

Before('not @mock', 'not @manual') do
  browser_context_start
end

After('not @mock', 'not @manual') do
  browser_context_stop
end
