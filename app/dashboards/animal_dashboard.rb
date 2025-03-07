require "administrate/base_dashboard"

class AnimalDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    health_status: Field::Select.with_options(
      collection:
        {
          "sick" => "sick",
          "injured" => "injured",
          "healthy" => "healthy",
        },
      ),
    herd: Field::BelongsTo,
    name: Field::String,
    pen: Field::BelongsTo,
    species: Field::String,
    status: Field::Select.with_options(
      collection:
        {
          "sold" => "sold",
          "available" => "available",
          "not available" => "not available",
        },
      ),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    id
    name
    species
    status
    health_status
    herd
    pen
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    health_status
    herd
    name
    pen
    species
    status

  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    health_status
    herd
    name
    pen
    species
    status
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

  # Overwrite this method to customize how animals are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(animal)
  #   "Animal ##{animal.id}"
  # end
end
