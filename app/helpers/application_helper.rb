module ApplicationHelper
  def locales_for_select
    LocaleName.all.order(:name).select do |locale|
      I18n.available_locales.include? locale.tag.to_sym
    end.map do |locale|
      [locale.name, locale.tag]
    end
  end
  
  def browser
    @browser ||= Browser.new(ua: request.user_agent, accept_language: request.env['HTTP_ACCEPT_LANGUAGE'])
  end
end
