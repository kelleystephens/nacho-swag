feature "User adds an email address" do
  before do
    Fabricate(:user, email: "joe@example.com")
    @user = Fabricate(:user,
      uid: "joe",
      name: "Joe Smith",
      provider: "eventful")
    sign_into_eventful_as "joe"
    visit '/'
    click_link "Eventful"
    visit dashboard_path
    # click_link "Add Email"
  end

  scenario "successfully adds email" do
    pending "implementaion"
    fill_in "Email", :with => "joesmith@example.com"
    click_button "Submit"
    expect(page).to have_content("Email successfully added")
    expect(page).to_not have_link("Add Email")
    expect(current_path).to eq dashboard_path
    expect(@user.email).to eq "joesmith@example.com"
  end

  scenario "adds email already in database" do
    pending "implementaion"
    fill_in "Email", :with => "joe@example.com"
    click_button "Submit"
    expect(page).to have_content("Email already registered")
    expect(current_path).to eq edit_user_path
    expect(@user.email).to be_nil
  end

  scenario "user submits blank form" do
    pending "implementaion"
    click_button "Submit"
    expect(page).to have_content("Must Enter an Email")
    expect(current_path).to eq edit_user_path(@user)
  end
end
