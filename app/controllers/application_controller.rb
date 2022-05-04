class ApplicationController < ActionController::API
rescue_from ActiveRecord::RecordInvalid, with: :error_msg

def summary
    movie = Movie.find(params[:id])
    render json: movie, serializer: MovieSummarySerializer
end

private
    def error_msg(invalid)
        render json: {errors:invalid.errors}
    end

end
