# class SaveRecord
#   def save
#     story = Story.new
#     story.title = "new story"
#     story.summary = "new story summary"
#     story.save
#   end
# end

class SavePage
  def save
    story = Page.new
    story.name = "new pagename"
    story.text = "new page"
    story.story_id = 1
    story.parent_id = nil
    story.save
  end
end

s = SavePage.new
s.save
p "it is done"
