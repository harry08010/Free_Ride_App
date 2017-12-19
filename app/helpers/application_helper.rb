module ApplicationHelper
  def javascript(*files)
    external_resources = files - Rails.application.config.assets.included_js
    if not external_resources.empty?
      Rails.application.config.assets.included_js.concat files
      content_for(:body_javascript) { javascript_include_tag(*external_resources) }
    end
  end

  def stylesheet(*files)
    external_resources = files - Rails.application.config.assets.included_css
    if not external_resources.empty?
      Rails.application.config.assets.included_css.concat files
      content_for(:head_stylesheet) { stylesheet_link_tag(*external_resources) }
    end
  end

  def full_title(page_title = '')
    base_title = "UFreeRide"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def gravatar_for(user)
    if user.gender == 'male'
      index = (user.id % 129) + 1
      gravatar_url = "male/#{index}.png"
    elsif user.gender == 'female'
      index = (user.id % 114) +1
      gravatar_url = "female/#{index}.png"
    end
    image_tag(gravatar_url, alt: user.nickname, class: "gravatar avatar")
  end

  def gravatar_for_id(id, gender)
    if gender == 'male'
      index = (id % 129) + 1
      gravatar_url = "male/#{index}.png"
    elsif gender == 'female'
      index = (id % 114) +1
      gravatar_url = "female/#{index}.png"
    end
    asset_url(gravatar_url)
  end
end
