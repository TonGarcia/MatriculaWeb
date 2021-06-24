module ApplicationHelper
  # Must return it product name
  def product_name
    t('descriptions.product_name')
  end

  def product_name_short
    t('descriptions.product_name').split('. ')[0]
  end

  # Must return it app name based on user locale (default is pt-BR)
  def app_name
    'MatriculaWeb'
  end

  # Must return ittem app slogan phrase based on user locale (default is pt-BR)
  def slogan
    # 'A maneira mais fácil de pré-qualificar ao Atlas.'
    ''
  end

  # Return it app_name with it slogan
  def app_name_slogan
    "#{app_name} - #{slogan}"
  end

  def app_footer_description
    "#{app_name} - #{slogan}"
  end

  # Check if it page allow default card
  def card_page?
    current_act = params[:action]
    current_ctrl = params[:controller]
    dashboard_ctrl = (current_ctrl == 'dashboard')
    researcher_card_act = (current_ctrl == 'researchers' && current_act != 'index')
    # degree_card_act = (current_ctrl == 'degrees' && current_act != 'index')
    !(dashboard_ctrl || researcher_card_act) # || degree_card_act
  end

  def company_footer_description
    "Copyright© & Registered® #{Date.today.year}."
  end

  # Return the current screen Title/Header name: CONTROLLER / ACTION
  def screen_name
    controller_name = t("controllers.#{params[:controller]}").upcase
    action_name = t("actions.controllers.#{params[:action]}").upcase
    "#{controller_name} / #{action_name}"
  end

  def read_only?
    params[:action] == 'show'
  end

  def staff_role?
    @current_user.admin? #|| @current_user.moderator?
  end

  def teacher_role?
    #@current_user.teacher?
  end

  def admin?
    @current_user.admin?
  end

  def current_page_includes?(path)
    !request.fullpath.index(path).nil?
  end

  def default_action_path
    action = params[:action]
    case action
    when 'index'
      "new_#{params[:controller].singularize}_path"
    when 'show'
      "edit_#{params[:controller].singularize}_path"
    else
      nil
    end
  end
end