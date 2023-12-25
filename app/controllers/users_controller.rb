class UsersController < ApplicationController
    before_action :authenticate_user!

    def meetings
        @user_meetings = current_user.user_meetings.map(&:meeting)
    end
end
