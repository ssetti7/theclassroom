require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  let(:valid_attributes) {
    {
      name: 'MyText',
      description: 'MyText',
      start_time: '2016-10-21 23:51:38',
      end_time: '2016-10-21 23:51:38'
    }
  }

  let(:invalid_attributes) do
    {
        name: '',
        description: '',
        start_time: '2016-10-21 23:51:38',
        end_time: '2016-10-21 23:51:38'
    }
  end

  let(:valid_event){ Event.create! valid_attributes }

  context 'user is not authenticated' do
    describe 'GET :index' do
      before do
        get :index
      end
      it_behaves_like 'redirects to login page'
    end

    describe 'GET #show' do
      before do
        get :show, params: { id: valid_event.to_param }
      end
      it_behaves_like 'redirects to login page'
    end

    describe 'GET #new' do
      before do
        get :new
      end
      it_behaves_like 'redirects to login page'
    end

    describe 'GET edit' do
      before do
        get :edit, params: { id: valid_event.id }
      end
      it_behaves_like 'redirects to login page'
    end

    describe 'POST create' do
      before do
        post :create, params: { event: valid_event.to_param }
      end
      it_behaves_like 'redirects to login page'
    end

    describe 'PUT update' do
      before do
        put :update, params: { id: valid_event.id, event: valid_event.to_param }
      end
      it_behaves_like 'redirects to login page'
    end

    describe 'DELETE destroy' do
      before do
        delete :destroy, params: { id: valid_event.id }
      end
      it_behaves_like 'redirects to login page'
    end
  end

  context 'user is authenticated' do
    before :each do
      login_with create( :user )
    end
    describe "GET #index" do
      it "assigns all events as @events" do
        event = Event.create! valid_attributes
        get :index, params: {}
        expect(assigns(:events)).to eq([event])
      end
    end

    describe 'GET #show' do
      it 'assigns the requested event as @event' do
        event = Event.create! valid_attributes
        get :show, params: { id: event.to_param }
        expect(assigns(:event)).to eq(event)
      end
    end

    describe' "GET #new"' do
      it "assigns a new event as @event" do
        get :new, params: {}
        expect(assigns(:event)).to be_a_new(Event)
      end
    end

    describe "GET #edit" do
      it "assigns the requested event as @event" do
        event = Event.create! valid_attributes
        get :edit, params: {id: event.to_param}
        expect(assigns(:event)).to eq(event)
      end
    end

    describe 'POST #create' do
      context 'with valid params' do
        it 'creates a new Event' do
          expect {
            post :create, params: {event: valid_attributes}
          }.to change(Event, :count).by(1)
        end

        it 'assigns a newly created event as @event' do
          post :create, params: {event: valid_attributes}
          expect(assigns(:event)).to be_a(Event)
          expect(assigns(:event)).to be_persisted
        end

        it 'redirects to the created event' do
          post :create, params: {event: valid_attributes}
          expect(response).to redirect_to(Event.last)
        end
      end

      context 'with invalid params' do
        it 'assigns a newly created but unsaved event as @event' do
          post :create, params: { event: invalid_attributes }
          expect(assigns(:event)).to be_a_new(Event)
        end

        it 're-renders the template for new' do
          post :create, params: { event: invalid_attributes }
          expect(response).to render_template("new")
        end
      end
    end

    describe 'PUT #update' do
      context 'with valid params' do
        let(:new_attributes) do
          { name: 'New name' }
        end

        it 'updates the requested event' do
          event = Event.create! valid_attributes
          put :update, params: { id: event.to_param, event: new_attributes }
          event.reload
          expect(event.name).to be_eql 'New name'
        end

        it 'assigns the requested event as @event' do
          event = Event.create! valid_attributes
          put :update, params: { id: event.to_param, event: valid_attributes }
          expect(assigns(:event)).to eq(event)
        end

        it 'redirects to the event' do
          event = Event.create! valid_attributes
          put :update, params: { id: event.to_param, event: valid_attributes }
          expect(response).to redirect_to(event)
        end
      end

      context 'with invalid params' do
        it "assigns the event as @event" do
          event = Event.create! valid_attributes
          put :update, params: { id: event.to_param, event: invalid_attributes }
          expect(assigns(:event)).to eq(event)
        end

        it 're-renders the edit template' do
          event = Event.create! valid_attributes
          put :update, params: { id: event.to_param, event: invalid_attributes }
          expect(response).to render_template("edit")
        end
      end
    end

    describe 'DELETE #destroy' do
      it 'destroys the requested event' do
        event = Event.create! valid_attributes
        expect {
          delete :destroy, params: { id: event.to_param }
        }.to change(Event, :count).by(-1)
      end

      it 'redirects to the events list' do
        event = Event.create! valid_attributes
        delete :destroy, params: {id: event.to_param}
        expect(response).to redirect_to(events_url)
      end
    end
  end
end
