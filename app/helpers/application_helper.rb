module ApplicationHelper
  def current_here?(pathname)
    request.fullpath.split('/')[1] == pathname
  end

  def markdown(text)
    render_options = {
      filter_html: false,
      hard_wrap: true
    }
    renderer = CustomMarkdownRenderer.new(render_options)

    extensions = {
      autolink: true,
      fenced_code_blocks: true,
      lax_spacing: true,
      no_intra_emphasis: true,
      strikethrough: true,
      superscript: true,
      tables: true,
    }
    Redcarpet::Markdown.new(renderer, extensions).render(text).html_safe
  end
end
