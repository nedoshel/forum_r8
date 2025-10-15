class ApplicationController < ActionController::Base
  include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action do
    add_breadcrumb '<i class="bi bi-house"></i>'.html_safe, root_path
  end
end
