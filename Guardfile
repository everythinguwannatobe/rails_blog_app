guard "livereload" do
  extensions = {
    css: :css,
    scss: :css,
    sass: :css,
    js: :js,
    coffee: :js,
    html: :html,
    png: :png,
    gif: :gif,
    jpg: :jpg,
    jpeg: :jpeg
    # less: :less, # uncomment if you want LESS stylesheets done in browser
  }

  rails_view_exts = %w[erb haml slim]

  # file types LiveReload may optimize refresh for
  compiled_exts = extensions.values.uniq
  watch(%r{public/.+\.(#{compiled_exts * '|'})})

  extensions.each do |ext, type|
    watch(%r{
          (?:app|vendor)
          (?:/assets/\w+/(?<path>[^.]+) # path+base without extension
           (?<ext>\.#{ext})) # matching extension (must be first encountered)
          (?:\.\w+|$) # other extensions
          }x) do |m|
      path = m[1]
      "/assets/#{path}.#{type}"
    end
  end

  # file needing a full reload of the page anyway
  watch(%r{app/views/.+\.(#{rails_view_exts * '|'})$})
  watch(%r{app/helpers/.+\.rb})
  watch(%r{config/locales/.+\.yml})
end

guard :rspec, cmd: "bundle exec rspec" do
  watch(%r{^spec/(.*)/?(.*)_spec\.rb$})
  watch("spec/test_helper.rb") { "spec" }
  watch("config/routes.rb") { interface_tests }
  watch(%r{app/views/layouts/*}) { interface_tests }
  watch(%r{^app/models/(.*?)\.rb$}) do |matches|
    "spec/models/#{matches[1]}_spec.rb"
  end
  watch(%r{^app/controllers/(.*?)_controller\.rb$}) do |matches|
    resource_tests(matches[1]) + integration_tests(matches[1])
  end
  watch(%r{^app/views/([^/]*?)/.*\.html\.erb$}) do |matches|
    ["spec/controllers/#{matches[1]}_controller_spec.rb"] +
      integration_tests(matches[1])
  end
  watch(%r{^app/helpers/(.*?)_helper\.rb$}) do |matches|
    integration_tests(matches[1])
  end
  watch("app/views/layouts/application.html.erb") do
    "spec/integration/site_layout_spec.rb"
  end
end

# Returns the integration tests corresponding to the given resource.
def integration_tests(resource = :all)
  if resource == :all
    Dir["spec/integration/*"]
  else
    Dir["spec/integration/#{resource}_*.rb"]
  end
end

# Returns all tests that hit the interface.
def interface_tests
  integration_tests << "spec/controllers"
end

# Returns the controller tests corresponding to the given resource.
def controller_test(resource)
  "spec/controllers/#{resource}_controller_spec.rb"
end

# Returns all tests for the given resource.
def resource_tests(resource)
  integration_tests(resource) << controller_test(resource)
end

notification :off
