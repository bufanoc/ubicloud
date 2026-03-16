# frozen_string_literal: true

Sequel.migration do
  up do
    run "DROP INDEX IF EXISTS private_subnet_project_firewall_priority_idx"
    run "CREATE UNIQUE INDEX private_subnet_project_location_firewall_priority_idx ON private_subnet (project_id, location_id, firewall_priority) WHERE firewall_priority IS NOT NULL"
  end

  down do
    run "DROP INDEX IF EXISTS private_subnet_project_location_firewall_priority_idx"
    run "CREATE UNIQUE INDEX private_subnet_project_firewall_priority_idx ON private_subnet (project_id, firewall_priority) WHERE firewall_priority IS NOT NULL"
  end
end
