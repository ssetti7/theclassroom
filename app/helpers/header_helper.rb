module HeaderHelper

  def render_top_view
    return top_link unless current_user
    render partial: 'layouts/partial-general/header_user'
  end

  private

  def top_link
    link_to 'Log in', new_user_session_path
  end
end
