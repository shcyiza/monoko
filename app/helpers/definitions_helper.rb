module DefinitionsHelper

  def content_if_exist definition
    if definition
      return definition.content
    else
      return nil
    end
  end

  def name_if_exist word
    if word
      return word.name
    else
      return nil
    end
  end

end
