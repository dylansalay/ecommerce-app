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

  def link_to_add_fields(name = nil, form = nil, association = nil, options = nil, html_options = nil, &block)
    # If a block is provided there is no name attribute and the arguments are
    # shifted with one position to the left. This re-assigns those values.
    if block_given?
      html_options = options
      options = association
      association = form
      form = name
    end

    options = {} if options.nil?
    html_options = {} if html_options.nil?

    locals = if options.include? :locals
               options[:locals]
             else
               {}
             end

    partial = if options.include? :partial
                options[:partial]
              else
                "#{association.to_s.singularize}_fields"
              end

    # Render the form fields from a file with the association name provided
    new_object = form.object.class.reflect_on_association(association).klass.new
    fields = form.fields_for(association, new_object, child_index: 'new_record') do |builder|
      render(partial, locals.merge!(f: builder))
    end

    # The rendered fields are sent with the link within the data-form-prepend attr
    html_options['data-form-prepend'] = raw CGI.escapeHTML(fields)
    html_options['href'] = '#'
    html_options['id'] = 'add-style-link'
    html_options['data-inventory-item-target'] = 'add_style'

    content_tag(:a, name, html_options, &block)
  end
end
