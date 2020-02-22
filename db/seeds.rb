# frozen_string_literal: true

25.times do |i|
  Post.create(title: "Title#{i}", summary: "Summary#{i}", body: 'A text file (sometimes spelled textfile; an old alternative name is flatfile)')
end
