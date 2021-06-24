require 'rails_helper'

RSpec.describe "knowledge_areas/new", type: :view do
  before(:each) do
    assign(:knowledge_area, KnowledgeArea.new(
      :name => "MyString",
      :knowledge_area => nil
    ))
  end

  it "renders new knowledge_area form" do
    render

    assert_select "form[action=?][method=?]", knowledge_areas_path, "post" do

      assert_select "input[name=?]", "knowledge_area[name]"

      assert_select "input[name=?]", "knowledge_area[knowledge_area_id]"
    end
  end
end
