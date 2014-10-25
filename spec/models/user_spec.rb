require 'rails_helper'

describe User do

  it { should respond_to(:id) }
  it { should respond_to(:name) }
  it { should respond_to(:provider) }

end
