# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include DeviseWhitelist
  include CurrentUserConcern
  include DefaultPageContentConcern
end
