require 'rails_helper'

RSpec.describe "subjects/show", type: :view do
  before(:each) do
    @subject = assign(:subject, Subject.create!(
      :name => "Name",
      :description => "Description",
      :workload => 2,
      :online_link => "Online Link",
      :class_schedule => "Class Schedule",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Online Link/)
    expect(rendered).to match(/Class Schedule/)
    expect(rendered).to match(//)
  end
end
