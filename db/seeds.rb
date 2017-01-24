AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

Feed.create(name: 'Google main news', url: "https://news.google.com/news?&output=rss", category: 'politics')
Feed.create(name: 'Google main news', url: "https://news.google.com/news?cf=all&hl=en&ned=us&topic=s&output=rss", category: 'sports')

['Trump', 'Rooney', 'football'].each do |word|
  Keyword.create( content: word, category: 1)
end

['Brexit', 'Syria', 'bank'].each do |word|
  Keyword.create( content: word, category: 2)
end
