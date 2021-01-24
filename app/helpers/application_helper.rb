# frozen_string_literal: true

module ApplicationHelper
  def login_helper(style = '')
    if current_or_guest_user.guest?
      (link_to 'register', new_user_registration_path, class: style) +
        ' '.html_safe +
        (link_to 'login', new_user_session_path, class: style)
    else
      link_to 'logout', destroy_user_session_path, method: :get, class: style
    end
  end

  def admin_link_helper
    return unless current_or_guest_user.roles.include?(:site_admin)

    (link_to 'Admin Dashboard', admin_root_path, class: 'btn btn-primary')
  end

  def copyright_generator
    @copyright = CopyrightGeneratorConcern::Renderer.copyright 'Haley Knox', 'All rights reserved'
  end
end
