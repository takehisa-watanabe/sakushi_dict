class Kanren < ApplicationRecord
  belongs_to :moto,  class_name: "Word"
  belongs_to :saki,  class_name: "Word"
end
