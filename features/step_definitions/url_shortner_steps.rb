Given(/^I am on the home page$/) do
  visit "/"
end

Then(/^I should see the URL Shorten form$/) do
  expect(page).to have_content('Please enter your url here')
end

And(/^I enter my long URL in the form$/) do
  fill_in 'link_original_url', with: 'shortly.com'
end

And(/^I click on Shorten button$/) do
  click_button 'shorten'
end

Then(/^I should see a shorten URL$/) do
  expect(page).to have_content('Here Is your short url')
end



Given(/^a Link exists$/) do
  @link = FactoryBot.create(:link)
end

When(/^short URL is visited$/) do
  visit "/#{@link.slug}"
end

Then(/^I should see the redirect to Original Page$/) do
  expect(page.current_path).to eq @link.original_url
end


Given(/^I am on stats page$/) do
  visit '/links/stats'
end

Then(/^I should see stats data$/) do
  @link = FactoryBot.create(:link)
  expect(page).to have_content(@link.original_url)
end