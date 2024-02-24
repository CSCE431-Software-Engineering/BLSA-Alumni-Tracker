require "rails_helper"

RSpec.describe FirmTypesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/firm_types").to route_to("firm_types#index")
    end

    it "routes to #new" do
      expect(get: "/firm_types/new").to route_to("firm_types#new")
    end

    it "routes to #show" do
      expect(get: "/firm_types/1").to route_to("firm_types#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/firm_types/1/edit").to route_to("firm_types#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/firm_types").to route_to("firm_types#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/firm_types/1").to route_to("firm_types#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/firm_types/1").to route_to("firm_types#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/firm_types/1").to route_to("firm_types#destroy", id: "1")
    end
  end
end
