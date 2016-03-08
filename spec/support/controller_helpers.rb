module ControllerHelpers
  def login_admin(admin=nil)
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    admin ||= FactoryGirl.create(:admin)
    sign_in(admin)
  end
end