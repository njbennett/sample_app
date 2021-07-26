require 'rails_helper'

RSpec.describe Writer, type: :model do
  def writer(name: "Example Writer", email: "writer@example.com", 
             password: "myfavoritefruit", password_confirmation: "myfavoritefruit")
    Writer.new(name: name, email: email, password: password, password_confirmation: password_confirmation)
  end

  it "is valid when created with an email and name" do
    expect(writer).to be_valid
  end 

  it "requires a name" do
    expect(writer(name: "      ")).not_to be_valid
  end

  it "requires an email address" do
    expect(writer(email: "      ")).not_to be_valid
  end
  
  it "requires a password" do
    password = password_confirmation = " " * 6
    expect(writer(password: password, password_confirmation: password_confirmation)).not_to be_valid
  end

  it "requires a password with at least 6 characters" do
    password = password_confirmation = "a" * 5
    expect(writer(password: password, password_confirmation: password_confirmation)).not_to be_valid
  end

  it "doesn't allow very long names" do
    name = "a" * 51 
    expect(writer(name: name)).not_to be_valid
  end

  it "doesn't allow very long email addresses" do
    email = "a" * 244 + "@example.com" 
    expect(writer(email: email)).not_to be_valid
  end

  it "allows valid email addresses" do
    valid_addresses = [ "a@example.com",
                        "nat.bennett@example.com", 
                        "nat-bennett@example.com", 
                        "nat+ben@example.com",
                        "nat@EXAMPLE.com" ]
    @writer = writer
    valid_addresses.each do |valid_address|
      @writer.email = valid_address
      expect(@writer).to be_valid
    end

  end

  it "doesn't allow invalid email addresses" do
    invalid_addresses = [ "writerexample.com", "@", "a@", "$@a", "$a@a",
                          "writer@examplecom", "writer@example.", "writer@example.c$",
                          "writer@example.com_" ]
    @writer = writer
    invalid_addresses.each do |invalid_address|
      @writer.email = invalid_address
      expect(@writer).not_to be_valid
    end
  end

  it "requires email addresses to be unique" do
   @writer = writer
   @duplicate_writer = writer(email: @writer.email.upcase)
   @writer.save
   expect { @duplicate_writer.save }.to raise_error(ActiveRecord::RecordNotUnique)
  end
end
