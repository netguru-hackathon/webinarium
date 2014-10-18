module ApplicationHelper

  def flash_msg_class(name)
    css_classes_for_flash.fetch(name.to_sym, 'info')
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
