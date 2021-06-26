require 'rails_helper'

RSpec.configure do |config|
  config.include ApplicationHelper
end

RSpec.describe "Users", type: :feature do

  describe "GET /signup" do
    it "gets the sign up page" do
      visit signup_path
      expect(page).to have_title(full_title("Sign up"))
    end
  end
end
