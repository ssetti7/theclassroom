def should_see_message(text)
  expect(page).to have_content(text)
end
