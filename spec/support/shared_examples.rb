module SharedExamples
  shared_examples 'redirects to login page' do
    it 'render the login view' do
      expect(response).to redirect_to :new_user_session
    end
  end
end
