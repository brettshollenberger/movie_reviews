require 'spec_helper'

describe ViewedMovie do
  it { should belong_to(:user) }
  it { should belong_to(:movie) }
  
end
