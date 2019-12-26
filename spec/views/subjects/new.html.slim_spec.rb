require 'rails_helper'

RSpec.describe "subjects/new", type: :view do
  before(:each) do
    assign(:subject, Subject.new(
      :name => "MyString",
      :description => "MyString",
      :workload => 1,
      :online_link => "MyString",
      :class_schedule => "MyString",
      :user => nil
    ))
  end

  it "renders new subject form" do
    render

    assert_select "form[action=?][method=?]", subjects_path, "post" do

      assert_select "input[name=?]", "subject[name]"

      assert_select "input[name=?]", "subject[description]"

      assert_select "input[name=?]", "subject[workload]"

      assert_select "input[name=?]", "subject[online_link]"

      assert_select "input[name=?]", "subject[class_schedule]"

      assert_select "input[name=?]", "subject[user_id]"
    end
  end
end
