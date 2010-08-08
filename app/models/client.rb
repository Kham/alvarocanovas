class Client < Category

  attachment_definitions[:image] = {
    :styles => {
      :small => ['50x50', :jpg],
      :large => ['125x125!', :jpg]
    }
  }

end
