feature "User views dashboard" do
  before do
    @user = Fabricate(:user,
      uid: "joe",
      name: "Joe Smith",
      provider: "eventful")
    sign_into_eventful_as "joe"
    visit '/'
    click_link "Login with Eventful"
  end
  scenario "User has no items and has not rented any items" do
    expect(page).to have_content("You have no items for rent")
    expect(page).to have_content("You have not rented any items")
  end

  scenario "User has items for rent and rented out" do
    Fabricate(:item, name: "Prom Dress", user: @user)
    Fabricate(:item, name: "Ugg Boots", user: @user, rented: true)
    visit dashboard_path
    within("ul#available") do
      expect(page).to have_content("Prom Dress")
    end
    within("ul#rented") do
      expect(page).to have_content("Ugg Boots")
    end
    expect(page).to have_content("You have not rented any items")
  end

  scenario "User has rented items" do
    user2 = Fabricate(:user)
    item = Fabricate(:item, name: "Prom Dress", user: user2)
    Fabricate(:item, name: "Ugg Boots", user: user2)
    Fabricate(:rented_item, user: @user, item: item)
    visit dashboard_path
    expect(page).to have_content("Prom Dress")
  end
end
