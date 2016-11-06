require 'rails_helper'

RSpec.describe CalendarController, type: :controller do
  let(:args_date) { Time.zone.yesterday }

  describe 'GET show' do
    context 'user is not authenticated' do
      before do
        get :show
      end
      it_behaves_like 'redirects to login page'
    end

    context 'user is authenticated' do
      before do
        login_with create( :user )
      end

      it 'renders show view' do
        get :show
        expect(response).to render_template(:show)
      end

      context 'date is passed as argument' do
        describe 'get show' do

          it 'instance date with date params' do
            get :show, params: { date: args_date }
            expect(assigns(:date)).to be_eql args_date
          end
        end
      end

      context 'no arguments passed' do
        it 'instance date with today' do
          get :show
          expect(assigns(:date)).to be_eql Time.zone.today
        end
      end
    end
  end
end
