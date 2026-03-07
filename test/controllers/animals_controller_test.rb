require 'test_helper'

class AnimalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @animal = animals(:animal_one)
  end

  test 'should get index' do
    get animals_url
    assert_response :success
  end

  test 'should get new' do
    get new_animal_url
    assert_response :success
  end

  test 'should create animal' do
    assert_difference('Animal.count') do
      post animals_url, params: { animal: { unique_tag: '1234',
                                            species: 'Domestic Cattle',
                                            breed: 'Red Angus' } }
    end

    assert_redirected_to animal_url(Animal.last)
  end

  test 'should show animal' do
    get animal_url(@animal)
    assert_response :success
  end

  test 'should get edit' do
    get edit_animal_url(@animal)
    assert_response :success
  end

  test 'should update animal' do
    patch animal_url(@animal), params: { animal: { unique_tag: '356-543',
                                                   species: 'Domestic Cattle',
                                                   breed: 'Red Angus' } }
    assert_redirected_to animal_url(@animal)
  end

     test 'soft delete Animals' do
          x = animals(:animal_one)
          delete animal_path(x)
          x.reload
          assert_not_nil x.is_deleted
     end

     test 'do not show Animals' do
          x = animals(:animal_one)
          x.update(is_deleted: true)
          get animals_url
          assert_response :success
     end
end
