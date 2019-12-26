require 'rails_helper'

RSpec.describe "subjects/index", type: :view do
  before(:each) do
    assign(:subjects, [
      Subject.create!(
        :name => "Name",
        :description => "Description",
        :workload => 2,
        :online_link => "Online Link",
        :class_schedule => "Class Schedule",
        :user => nil
      ),
      Subject.create!(
        :name => "Name",
        :description => "Description",
        :workload => 2,
        :online_link => "Online Link",
        :class_schedule => "Class Schedule",
        :user => nil
      )
    ])
  end

  it "renders a list of subjects" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Online Link".to_s, :count => 2
    assert_select "tr>td", :text => "Class Schedule".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
