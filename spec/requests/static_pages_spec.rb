require 'rails_helper'

RSpec.describe "StaticPages", type: :feature do

  describe "GET /home" do
    it "returns a page with the base title" do
      visit "/static_pages/home"
      expect(page).to have_title("Ruby on Rails Tutorial Sample App")
    end

    it "does not contain extraneous characters" do
      visit "/static_pages/home"
      expect(page).to have_no_title(" | ")
    end

    it "only contains the base title" do
      visit "/static_pages/home"
      expect(page).to have_no_title("Home")
    end
  end

  describe "GET /help" do
    it "returns http success" do
      visit "/static_pages/help"
      expect(page).to have_title("Help | Ruby on Rails Tutorial Sample App")
    end
  end

end
