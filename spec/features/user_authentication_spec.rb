feature "User authentication" do

  scenario "Sign up with Eventful" do
    sign_into_eventful_as "joe"
    visit '/'
    click_link "Eventful"
    expect(page).to have_content "Successfully authenticated from Eventful account."
    expect(page).to have_content "Logout"
    expect(page).not_to have_content "Login"
    expect(User.count).to eq 1
    expect(current_path).to eq user_path
  end

  scenario "Login and Logout with Eventful" do
    Fabricate(:user,
      uid: "joe",
      name: "Joe Smith",
      provider: "eventful")
    sign_into_eventful_as "joe"
    visit '/'
    click_link "Eventful"
    expect(page).to have_content "Successfully authenticated from Eventful account."
    expect(page).to have_content "Logout"
    expect(page).not_to have_link "Eventful"
    click_link "Logout"
    expect(page).not_to have_content "Logout"
    expect(page).to have_content "Eventful"
    expect(User.count).to eq 1
  end
end
