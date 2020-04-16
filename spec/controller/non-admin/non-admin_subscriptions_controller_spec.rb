# frozen_string_literal: true

require 'rails_helper'
model_name = 'Subscription'
controller_name = "#{model_name.pluralize}Controller".camelize.constantize

RSpec.describe controller_name, type: :controller do
  login_user # This depends on the spec/support/controller_macros.rb for devise

  before(:each) do
    @user = FactoryBot.create(:user)
    request.env['HTTP_ACCEPT'] = 'application/json'
  end

  describe 'GET #index' do
    describe 'valid: ' do
      it "should return an index of #{model_name}s" do
        @object = FactoryBot.create(model_name.to_s.underscore.downcase.to_sym, user_id: @logged_in_user.id)
        get :index

        expect(response).to have_http_status(200)
      end
    end

    describe 'invalid: ' do
    end
  end

  describe 'GET #show' do
    describe 'valid: ' do
      it "should show a valid #{model_name} with an ID" do
        @object = FactoryBot.create(model_name.to_s.underscore.downcase.to_sym)
        get :show, params: { id: @object.id }

        expect(response).to have_http_status(200)
      end
    end

    describe 'invalid: ' do
      it "should not get a non existent #{model_name}" do
        get :show, params: { id: '8675309' }
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'POST #create' do
    describe 'valid: ' do
      it "should be able to create a valid #{model_name}" do
        @article = FactoryBot.create(:article)
        params = {
          "#{model_name.parameterize.underscore.to_sym}": {
            article_id: @article.id
          }
        }

        post :create, params: params
        expect(response).to have_http_status(403)
      end
    end

    describe 'invalid: ' do
      it "should not be able to create an invalid #{model_name}" do
        params = {
          "#{model_name.parameterize.underscore.to_sym}": {
            article_id: '12345'
          }
        }

        post :create, params: params
        expect(response).to have_http_status(403)
        # expect(returning_data['title'][0]).to eq("can't be blank")
      end
    end
  end

  describe 'PUT #update' do
    describe 'valid: ' do
      it "'should be able to change the #{model_name}'s data via ID'" do
        @object = FactoryBot.create(model_name.to_s.underscore.downcase.to_sym)
        @article = FactoryBot.create(:article)
        params = {
          id: @object.id,
          "#{model_name.parameterize.underscore.to_sym}": {
            article_id: @article.id
          }
        }

        put :update, params: params
        expect(response).to have_http_status(403)
      end
    end

    describe 'invalid: ' do
      it "'should not be able to change the #{model_name}'s data with bad data'" do
        @object = FactoryBot.create(model_name.to_s.underscore.downcase.to_sym)
        params = {
          id: @object.id,
          "#{model_name.parameterize.underscore.to_sym}": {
            article_id: '12345'
          }
        }

        post :update, params: params
        expect(response).to have_http_status(403)
      end
    end
  end

  describe 'DELETE #destroy' do
    describe 'valid: ' do
      it "should be able to delete an #{model_name} via ID" do
        @object = FactoryBot.create(model_name.to_s.underscore.downcase.to_sym)

        post :destroy, params: { id: @object.id }
        expect(response).to have_http_status(403)
      end
    end
  end
end
