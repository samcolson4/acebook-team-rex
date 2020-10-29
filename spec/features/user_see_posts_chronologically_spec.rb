require 'rails_helper'

feature "View posts chronologically" do
  scenario "posts are shown newest first on the newsfeed" do
    sign_up_as_potato
    make_post
    fill_in "Message", with: "Hello, planet!"
    click_button "Submit"
    expect("Hello, planet!").to appear_before("Hello, world!", only_text: true)
  end

  scenario "posts are shown newest first on the user profile" do
    sign_up_as_potato
    user = User.find_by(name: "Potato")
    make_post
    fill_in "Message", with: "Hello, planet!"
    click_button "Submit"
    visit "/users/#{user.id}"
    expect("Hello, planet!").to appear_before("Hello, world!", only_text: true)
  end
end