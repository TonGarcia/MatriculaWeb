require 'rails_helper'

RSpec.describe "subscriptions/edit", type: :view do
  before(:each) do
    @subscription = assign(:subscription, Subscription.create!(
      :access_type => "MyString",
      :user => nil,
      :subject => nil
    ))
  end

  it "renders the edit subscription form" do
    render

    assert_select "form[action=?][method=?]", subscription_path(@subscription), "post" do

      assert_select "input[name=?]", "subscription[access_type]"

      assert_select "input[name=?]", "subscription[user_id]"

      assert_select "input[name=?]", "subscription[subject_id]"
    end
  end
end
