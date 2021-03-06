# frozen_string_literal: true

require 'administrate/base_dashboard'

class ShoppingCartItemDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    inventory_item: Field::BelongsTo,
    shopping_cart: Field::BelongsTo,
    id: Field::Number,
    quantity: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    title: Field::String
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    inventory_item
    shopping_cart
    id
    quantity
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    inventory_item
    shopping_cart
    id
    quantity
    created_at
    updated_at
    title
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    inventory_item
    shopping_cart
    quantity
    title
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

  # Overwrite this method to customize how shopping cart items are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(shopping_cart_item)
  #   "ShoppingCartItem ##{shopping_cart_item.id}"
  # end
end
