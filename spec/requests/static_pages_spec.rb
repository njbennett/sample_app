require 'rails_helper'

RSpec.describe "StaticPages", type: :feature do

  describe "GET /home" do
    it "returns http success" do
      visit "/static_pages/home"
      expect(page).to have_title("Home | Ruby on Rails Tutorial Sample App")
    end
  end

  describe "GET /help" do
    it "returns http success" do
      visit "/static_pages/help"
      expect(page).to have_title("Help | Ruby on Rails Tutorial Sample App")
    end
  end

end
