# frozen_string_literal: true

require 'administrate/base_dashboard'

class BillingAddressDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    addressable: Field::Polymorphic,
    id: Field::Number,
    name: Field::String,
    street1: Field::String,
    street2: Field::String,
    city: Field::String,
    state: Field::String,
    zipcode: Field::String,
    country: Field::String,
    phone: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    type: Field::String
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    addressable
    id
    name
    type
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    addressable
    id
    name
    street1
    street2
    city
    state
    zipcode
    country
    phone
    created_at
    updated_at
    type
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    addressable
    name
    street1
    street2
    city
    state
    zipcode
    country
    phone
    type
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how billing addresses are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(billing_address)
  #   "BillingAddress ##{billing_address.id}"
  # end
end
