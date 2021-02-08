class HomeController < ApplicationController
    # TODO #5 implement pagination
    def index
        @welcome_msg = "Hello, World"
        @post = Post.new
        @forums = Forum.all
    end

    def about
        # about this application
    end
    
    def legals
    end

    def contact
    end
end
