require 'spec_helper'

describe Movie do
  it { should validate_uniqueness_of(:title)}
  it { should validate_presence_of(:title)}
  it { should validate_uniqueness_of(:description)}
  it { should validate_presence_of(:description)}
end
