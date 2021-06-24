require 'rails_helper'

RSpec.describe "subjects/edit", type: :view do
  before(:each) do
    @subject = assign(:subject, Subject.create!(
      :name => "MyString",
      :description => "MyString",
      :workload => 1,
      :online_link => "MyString",
      :class_schedule => "MyString",
      :user => nil
    ))
  end

  it "renders the edit subject form" do
    render

    assert_select "form[action=?][method=?]", subject_path(@subject), "post" do

      assert_select "input[name=?]", "subject[name]"

      assert_select "input[name=?]", "subject[description]"

      assert_select "input[name=?]", "subject[workload]"

      assert_select "input[name=?]", "subject[online_link]"

      assert_select "input[name=?]", "subject[class_schedule]"

      assert_select "input[name=?]", "subject[user_id]"
    end
  end
end
