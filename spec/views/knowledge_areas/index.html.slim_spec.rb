require 'rails_helper'

RSpec.describe "knowledge_areas/index", type: :view do
  before(:each) do
    assign(:knowledge_areas, [
      KnowledgeArea.create!(
        :name => "Name",
        :knowledge_area => nil
      ),
      KnowledgeArea.create!(
        :name => "Name",
        :knowledge_area => nil
      )
    ])
  end

  it "renders a list of knowledge_areas" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
