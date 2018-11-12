require 'rails_helper'

RSpec.describe Page, type: :model do
  context 'factories' do
    it { expect(build(:page)).to be_valid }
  end

  context 'invalid content page' do
    it { expect(build(:page, content: nil)).not_to be_valid }
  end
end
