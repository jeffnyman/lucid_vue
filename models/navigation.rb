class Navigation
  include Tapestry

  element :page_list, id: 'navlist'
  element :overlord,  id: 'overlord'
  element :planets,   id: 'planets'

  link    :planet_weight_calculator, id: 'planets'

  element :planet_logo,   id:  'planet-logo'

  image   :overlord_logo, src: 'images/mad-scientist.png'

  element :error, id: 'flash'

  def navigate
    self
  end

  def to_overlord_page(expect_fail = nil)
    open_page_list
    overlord.click
    expect(overlord_logo.exists?).to be true unless expect_fail
    admin_only_error if expect_fail
  end

  def to_planet_page
    open_page_list
    planets.click
    expect(planet_logo.exists?).to be true
  end

  private

  def open_page_list
    page_list.wait_until(&:dom_updated?).click
  end

  def admin_only_error
    expect(error.text).to eq('This content requires admin access.')
  end
end
