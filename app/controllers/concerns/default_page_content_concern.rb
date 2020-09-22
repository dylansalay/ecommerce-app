module DefaultPageContentConcern
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = 'Posy'
    @seo_keywords = 'Posy Jewelry Bracelets'
  end
end
