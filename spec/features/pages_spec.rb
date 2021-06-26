require 'rails_helper'

RSpec.describe "StaticPages", type: :feature do

  describe "GET /home" do
    before(:each) do
      visit root_path
    end

    it "gets the title page" do
      expect(page).to have_title("Ruby on Rails Tutorial Sample App")
    end

    it "does not have extra characters in the page title" do
      expect(page).to have_no_title(" | ")
    end

    it "only contains the base title" do
      expect(page).to have_no_title("Home")
    end

    it "has a link to the 'About' page" do
      click_on "About"
      expect(page).to have_title("About | Ruby on Rails Tutorial Sample App")
    end

    it "has a link to the 'Contact' page" do
      click_on "Contact"
      expect(page).to have_title("Contact | Ruby on Rails Tutorial Sample App")
    end

    it "has a link to the 'Help' page" do
      click_on "Help"
      expect(page).to have_title("Help | Ruby on Rails Tutorial Sample App")
    end

    it "has a link to the 'Sign Up' page" do
      click_on "Sign up now!"
      expect(page).to have_title("Sign up | Ruby on Rails Tutorial Sample App")
    end
  end

  describe "GET /about" do
    it "gets the about page" do
      visit about_path 
      expect(page).to have_title("About | Ruby on Rails Tutorial Sample App")
    end

    it "has a link to the 'Home' page" do
      visit about_path 
      click_on "Home"
      expect(page).to have_title("Ruby on Rails Tutorial Sample App")
    end
  end

  describe "GET /help" do
    it "gets the help page" do
      visit help_path 
      expect(page).to have_title("Help | Ruby on Rails Tutorial Sample App")
    end
  end

  describe "GET /contact" do
    it "gets the contact page" do
      visit contact_path
      expect(page).to have_title("Contact | Ruby on Rails Tutorial Sample App")
    end
  end
end
