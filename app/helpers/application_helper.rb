module ApplicationHelper
  def current_here?(pathname)
    request.fullpath.split('/')[1] == pathname
  end
end
