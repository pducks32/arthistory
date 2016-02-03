class AddDateableToDateWithPossibleAmbiguity < ActiveRecord::Migration
  def change
    add_reference :dates_with_possible_ambiguity,
                  :dateable,
                  polymorphic: true,
                  index: { name: "ambiguous_dates_index" }
    add_column :dates_with_possible_ambiguity, :dateable_field_name, :string
  end
end
