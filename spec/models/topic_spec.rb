require 'rails_helper'

RSpec.describe Topic, type: :model do
  
  it{is_expected.to have_many(:posts)}

  it{is_expected.to validate_presence_of(:title)}
end
