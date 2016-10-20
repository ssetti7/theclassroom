module HeaderHelper

  def render_top_view
    return login_link unless current_user
    render partial: 'layouts/partial-general/header_menu'
  end

  private

  def login_link
    link_to 'Log in', new_user_session_path
  end
end
