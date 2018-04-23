module DefinitionsHelper

  def content_if_exist definition
    if definition
      return definition.content
    else
      return nil
    end
  end

end
