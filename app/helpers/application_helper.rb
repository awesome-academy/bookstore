module ApplicationHelper

  def index_for object, index, per_page
    (object.to_i - 1)*per_page + index + 1
  end
end
