# frozen_string_literal: true

Sequel.migration do
  up do
    create_table(:heart_rates) do
      primary_key :id
      column :time_stamp, 'timestamptz', null: false, unique: true
      Integer :bpm, null: false
      Integer :confidence, null: false
    end
  end

  down do
    drop_table(:heart_rates)
  end
end
