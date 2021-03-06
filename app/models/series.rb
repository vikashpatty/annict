# frozen_string_literal: true
# == Schema Information
#
# Table name: series
#
#  id                 :integer          not null, primary key
#  name               :string           not null
#  name_ro            :string           default(""), not null
#  name_en            :string           default(""), not null
#  aasm_state         :string           default("published"), not null
#  series_works_count :integer          default(0), not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_series_on_name  (name) UNIQUE
#

class Series < ApplicationRecord
  include AASM
  include DbActivityMethods
  include RootResourceCommon

  DIFF_FIELDS = %i(name name_en).freeze

  aasm do
    state :published, initial: true
    state :hidden

    event :hide do
      transitions from: :published, to: :hidden
    end
  end

  has_many :series_works, dependent: :destroy
end
