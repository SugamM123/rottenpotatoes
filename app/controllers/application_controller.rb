class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting info
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes
end
