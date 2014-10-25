require 'rails_helper'

describe Webinar do

  it { should respond_to(:id) }
  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should respond_to(:language) }
  it { should respond_to(:translation_available) }
  it { should respond_to(:youtube_url) }
  it { should respond_to(:blogpost_url) }
  it { should respond_to(:doc_url) }
  it { should respond_to(:code_url) }

end
