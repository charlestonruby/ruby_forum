require 'rails_helper'

RSpec.describe TopicsController, type: :controller do

  let!(:topic){
    FactoryGirl.create(:topic)
  }

  describe "GET #index" do
    it "returns all topics" do
      get :index
      expect(assigns(:topics)).not_to eq nil
      expect(assigns(:topics)).to eq [topic]
    end
  end

  describe "GET #show" do
    it "returns the requested topic" do
      get :show, id: topic
      expect(assigns(:topic)).to eq topic
    end
  end

  describe "GET #new" do
    it "instantiates a new topic" do
      get :new
      expect(assigns(:topic).new_record?).to eq true
      expect(assigns(:topic).class).to eq Topic
    end
  end

  describe "POST #create" do
    context "with valid data" do
      it "creates a new topic object" do
        topic_params = FactoryGirl.attributes_for(:topic)
        expect{(post :create, topic: topic_params)}.to change(Topic, :count).by(1)
        expect(response).to redirect_to action: :index
      end
    end
    context "with invalid data" do
      it "does not create topic object" do
        expect{(post :create, topic: {title: ''})}.not_to change(Topic, :count)
      end
    end
  end

end
