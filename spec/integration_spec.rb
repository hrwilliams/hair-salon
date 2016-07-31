require("pry")
require('capybara/rspec')
require('./app')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new stylist', {:type => :feature}) do
  it('allows a user to click a stylist to see the clients and details for it') do
    visit('/')
    fill_in('stylist_name', :with => 'Tommy RR Barber')
    click_button('Add stylist')
    expect(page).to have_content('Tommy RR Barber')
  end
end

describe('viewing all of the stylists', {:type => :feature}) do
  it('allows a user to see all of the stylists that have been created') do
    stylist = Stylist.new({:name => 'Tommy RR Barber', :id => nil})
    stylist.save()
    visit('/')
    expect(page).to have_content(stylist.name)
  end
end

describe('seeing details for a single stylist', {:type => :feature}) do
  it('allows a user to click a stylist to see the clients and details for it') do
    test_stylist = Stylist.new({:name => 'Tommy RR Barber', :id => nil})
    test_stylist.save()
    test_client= Client.new({:name => "Hair Bag", :id => nil, :stylist_id => test_stylist.id()})
    test_client.save()
    visit('/')
    click_link(test_stylist.name())
    expect(page).to have_content(test_client.name())
  end
end

describe('adding clients to a stylist', {:type => :feature}) do
  it('allows a user to add a client to a stylist') do
    test_stylist = Stylist.new({:name => 'Tommy RR Barber', :id => nil})
    test_stylist.save()
    visit("/")
    select("Tommy RR Barber", :from => "stylist_id")
    fill_in("Name", {:with => "Hair Bag"})
    click_button("Add client")
    expect(page).to have_content("Hair Bag")
  end
end

describe('update a stylist', {:type => :feature}) do
  it("allows the user to edit the stylist name")do
  test_stylist = Stylist.new({:name => 'barber', :id => nil})
  test_stylist.save()
  visit("/")
  click_link 'barber'
  click_link 'Edit barber stylist'
  fill_in('name', :with => 'BARBER')
  click_button 'Update'
  expect(page).to have_content 'BARBER'
  end

  it("allows the user to delete a stylist") do
    test_stylist = Stylist.new({:name => 'barber', :id => nil})
    test_stylist.save()
    visit '/'
    click_link 'barber'
    click_link 'Edit barber stylist'
    click_button 'Delete stylist'
    expect(page).to have_no_content 'barber'
  end
end
