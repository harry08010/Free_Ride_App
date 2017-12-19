
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the welcome page$/
      '/'

    when /^the sign up page$/
      '/signup'

    when /^the home page$/
      '/welcome/index'  #not settled

    when /^the new post page$/
      '/ride_posts/new'  #not settled

    when /^the user show page$/
      '/users/1'  #not settled

    when /^the sign in page$/
      '/login'  #not settled

    #when /^the user show page$/
    #  '/users/'  #not settled



    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
