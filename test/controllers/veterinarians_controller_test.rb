require 'test_helper'

class VeterinariansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @veterinarian = veterinarians(:veterinarian_one)
  end

  test 'should get index' do
    get veterinarians_url
    assert_response :success
  end

  test 'should get new' do
    get new_veterinarian_url
    assert_response :success
  end

  test 'should create veterinarian' do
    assert_difference('Veterinarian.count') do
      post veterinarians_url, params: { veterinarian: { name: 'Karl',
                                                        status: 'available',
                                                        admin: false,
                                                        number: '+449876589365' } }
    end

    assert_redirected_to veterinarian_url(Veterinarian.last)
  end

  test 'should show veterinarian' do
    get veterinarian_url(@veterinarian)
    assert_response :success
  end

  test 'should get edit' do
    get edit_veterinarian_url(@veterinarian)
    assert_response :success
  end

  test 'should update veterinarian' do
    patch veterinarian_url(@veterinarian), params: { veterinarian: { name: 'Karl',
                                                                     status: 'unavailable',
                                                                     admin: false,
                                                                     number: '+449876989365' } }
    assert_redirected_to veterinarian_url(@veterinarian)
  end

     test 'soft delete veterinarians' do
          x = veterinarians(:veterinarian_one)
          delete veterinarian_path(x)
          x.reload
          assert_not_nil x.is_deleted
     end

     test 'do not show veterinarians' do
          x = veterinarians(:veterinarian_one)
          x.update(is_deleted: true)
          get veterinarian_url(@veterinarian)
          assert_response :success
     end

     test 'vet number is international' do
          x = veterinarians(:veterinarian_one)
          assert x.valid?, "Number is valid"
     end

     test 'vet number is not international' do
          x = Veterinarian.new(
               name: "Invalid",
               status: "Busy",
               admin: false,
               number: "12345"
          )
          assert_not x.valid?, "Number is not international"
     end
end
