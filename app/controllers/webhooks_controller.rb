# app/controllers/webhooks_controller.rb

class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token # Required for webhooks

  # Handle status updates from Copyleaks
  def status
    # Parse the incoming data
    data = request.raw_post
    # Assuming JSON response; parse and store the status update if needed
    status_info = JSON.parse(data)

    # Process status update (e.g., update database record, log the status)
    # Example: logger.info("Received status update: #{status_info}")

    head :ok # Respond with 200 OK
  end

  # Handle completion notifications from Copyleaks
  def completion
    # Parse the incoming data
    data = request.raw_post
    completion_info = JSON.parse(data)

    # Process completion data (e.g., store results in database, notify users)
    # Example: logger.info("Received completion data: #{completion_info}")

    head :ok # Respond with 200 OK
  end
end
