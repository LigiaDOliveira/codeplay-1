class Api::V1::EnrollmentsController < Api::V1::ApiController
  def index
    @enrollments = Enrollment.all
    render json: @enrollments
      .as_json(except: %i[id created_at updated_at course_id student_id],
             include: %i[course student])
  end
  def show
    @enrollment = Enrollment.find(params[:id])
    render json: @enrollment
      .as_json(
        except: %i[id created_at updated_at course_id student_id],
        include: %i[course student]
      )
  end
end