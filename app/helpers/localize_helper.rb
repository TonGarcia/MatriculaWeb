module LocalizeHelper
  def current_locale
    I18n.locale[3,4].to_sym
  end

  def locale_action
    return 'new' if params[:action] == 'create'
    return 'edit' if params[:action] == 'update'
    params[:action]
  end

  def self.states_from(country)
    hash_states = CS.states(country)
    inverted_hash_states = hash_states.invert
    array_states = inverted_hash_states.to_a
    array_states.sort # sorted_states
  end

  def self.cities_from(state, country)
    array_cities = CS.cities(state, country)
    # inverted_hash_cities = hash_cities.invert
    # array_cities = inverted_hash_cities.to_a
    array_cities.sort # sorted_states
  end
end