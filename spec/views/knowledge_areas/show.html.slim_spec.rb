require 'rails_helper'

RSpec.describe "knowledge_areas/show", type: :view do
  before(:each) do
    @knowledge_area = assign(:knowledge_area, KnowledgeArea.create!(
      :name => "Name",
      :knowledge_area => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
  end
end
