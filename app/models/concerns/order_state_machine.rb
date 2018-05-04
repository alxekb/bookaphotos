module OrderStateMachine
  extend ActiveSupport::Concern

  included do
    include AASM

    aasm do
      state :created, initial: true
      state :paid
      state :editing
      state :edited
      state :sorting
      state :sorted
      state :processing
      state :processed
      state :sent
      state :client_received
      state :client_reviewed
      state :client_service_extended
      state :order_closed
      state :archived

      event :pay do
        transitions from: :created, to: :paid
      end

      event :start_editing do
        transitions from: :paid, to: :editing
      end

      event :finish_editing do
        transitions from: :editing, to: :edited
      end

      event :start_sorting do
        transitions from: :edited, to: :sorting
      end

      event :finish_sorting do
        transitions from: :sorting, to: :sorted
      end

      event :start_processing do
        transitions from: :sorted, to: :processing
      end

      event :finish_processing do
        transitions from: :processing, to: :processed
      end

      event :sending do
        transitions from: :processed, to: :sent
      end

      event :client_receiving do
        transitions from: :sent, to: :client_received
      end

      event :client_reviewing do
        transitions from: :client_receiving, to: :client_reviewed
      end

      event :client_extend_service do
        transitions from: :client_received, to: :client_service_extended
      end

      event :close_order do
        transitions from: [:client_reviewed, :client_service_extended], to: :order_closed
      end

      event :archive_order do
        transitions from: :order_closed, to: :archived
      end
    end
  end
end
