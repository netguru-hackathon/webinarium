module ApplicationHelper

  def markdown(text)
    options = { hard_wrap: true,
                filter_html: true,
                autolink: true,
                no_intraemphasis: true,
                fenced_code: true,
                gh_blockcode: true
    }
    mdwn = ::Redcarpet::Markdown.new(Redcarpet::Render::HTML, options)
    mdwn.render(text).html_safe
  end

  def flash_msg_class(name)
    css_classes_for_flash.fetch(name.to_sym, 'info')
  end

  def faded_class(var)
    'faded' unless var
  end

  private

  def css_classes_for_flash
    {
      notice: 'success',
      error: 'danger',
      alert: 'warning',
      info: 'info'
    }
  end

end
