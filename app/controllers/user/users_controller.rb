UsersController < ApplicationController
    before_action :authenticate_user!
    
    # TODO #1 Add Pagination to Application
    def index
        @users.last(10)
    end

end