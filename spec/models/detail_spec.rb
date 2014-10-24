require 'rails_helper'

RSpec.describe Detail, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
  # it 'path should not be empty' do
  #   detail = Detail.new(
  #       path: '////',
  #       bitcasa_created_at: '2004-10-19 10:23:54',
  #       bitcasa_modified_at: '2004-10-19 10:23:54',
  #       bitcasa_changed_at: '2004-10-19 10:23:54',
  #       size: 4
  #   )
  #   expect(detail).not_to be_valid
  #   expect(detail.errors[:path]).to be_present
  # end

  # it "path include /, return error" do
  #   detail = Detail.new
  #   detail.path = "/hogehoge"
  #   expect(detail.have_path(detail.path)).not_to be_include "/"
  # end

  # it "path string over 22, return error" do
  #   detail = Detail.new
  #   detail.path = "FOPqySw3ToK_25y-gagUfgs"
  #   expect(detail.have_path(detail.path)).to be < 23
  # end

end
