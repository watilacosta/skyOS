# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SettingPolicy, type: :policy do
  subject { described_class.new(user, setting) }

  let(:setting) { Setting.allow_signup }

  context 'being a pilot' do
    let(:user) { create(:pilot) }

    it { is_expected.to forbid_actions(%i[index destroy show]) }
    it { is_expected.to forbid_new_and_create_actions }
    it { is_expected.to forbid_edit_and_update_actions }
  end

  context 'being an administrator' do
    let(:user) { create(:pilot, :admin) }

    it { is_expected.to permit_actions(%i[index]) }
    it { is_expected.to forbid_actions(%i[destroy]) }
    it { is_expected.to permit_edit_and_update_actions }
    it { is_expected.to permit_new_and_create_actions }
  end
end
