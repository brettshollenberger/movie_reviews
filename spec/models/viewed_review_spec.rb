require 'spec_helper'

describe ViewedReview do
  it { should belong_to(:user) }
  it { should belong_to(:review) }
  
end
