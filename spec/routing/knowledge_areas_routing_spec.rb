require "rails_helper"

RSpec.describe KnowledgeAreasController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/knowledge_areas").to route_to("knowledge_areas#index")
    end

    it "routes to #new" do
      expect(:get => "/knowledge_areas/new").to route_to("knowledge_areas#new")
    end

    it "routes to #show" do
      expect(:get => "/knowledge_areas/1").to route_to("knowledge_areas#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/knowledge_areas/1/edit").to route_to("knowledge_areas#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/knowledge_areas").to route_to("knowledge_areas#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/knowledge_areas/1").to route_to("knowledge_areas#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/knowledge_areas/1").to route_to("knowledge_areas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/knowledge_areas/1").to route_to("knowledge_areas#destroy", :id => "1")
    end

  end
end
