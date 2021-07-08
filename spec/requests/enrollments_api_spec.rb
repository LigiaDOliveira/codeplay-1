require 'rails_helper'

describe 'Erollments endpoint' do
  it 'return all enrollments' do
    enrollment = create(:enrollment)
    get '/api/v1/enrollments'
    expect(response).to have_http_status(200)
    parsed_body = JSON.parse(response.body)
    expect(parsed_body[0]['course']['code']).to eq(enrollment.course.code)
    expect(parsed_body[0]['student']['email']).to eq(enrollment.student.email)
    expect(parsed_body[0]['student']).to_not include('password')
    expect(parsed_body[0]['price']).to eq(enrollment.price.to_s)
  end

  it 'return a enrollment' do
    enrollment = create(:enrollment)

    get "/api/v1/enrollments/#{enrollment.id}"
    expect(response).to have_http_status(200)
    parsed_body = JSON.parse(response.body)
    expect(parsed_body['course']['code']).to eq(enrollment.course.code)
    expect(parsed_body['student']['email']).to eq(enrollment.student.email)
    expect(parsed_body['student']).to_not include('password')
    expect(parsed_body['price']).to eq(enrollment.price.to_s)
  end
end