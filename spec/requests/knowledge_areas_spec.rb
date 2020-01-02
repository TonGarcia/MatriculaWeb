require 'rails_helper'

RSpec.describe "KnowledgeAreas", type: :request do
  describe "GET /knowledge_areas" do
    it "works! (now write some real specs)" do
      get knowledge_areas_path
      expect(response).to have_http_status(200)
    end
  end
end
