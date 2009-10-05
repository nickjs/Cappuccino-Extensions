class PeopleController < InheritedResources::Base
  respond_to :json, :xml
  actions :all
end
