require 'rails_helper'

RSpec.describe "knowledge_areas/edit", type: :view do
  before(:each) do
    @knowledge_area = assign(:knowledge_area, KnowledgeArea.create!(
      :name => "MyString",
      :knowledge_area => nil
    ))
  end

  it "renders the edit knowledge_area form" do
    render

    assert_select "form[action=?][method=?]", knowledge_area_path(@knowledge_area), "post" do

      assert_select "input[name=?]", "knowledge_area[name]"

      assert_select "input[name=?]", "knowledge_area[knowledge_area_id]"
    end
  end
end
