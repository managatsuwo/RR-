class PeopleController < ApplicationController
  def index
    @msg = 'Person date'
    @date = Person.all
  end
end
