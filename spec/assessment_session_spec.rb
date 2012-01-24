require 'spec_helper'

module Fraudpointer
  describe AssessmentSession do
    before { Client.key = "API_KEY" }

    describe '.create' do
      subject {
        VCR.use_cassette('create_assessment_session') do
          AssessmentSession.create
        end
      }

      it { should_not be_nil }
      it { should be_kind_of(AssessmentSession) }
      its(:id) { should == 1555077 }
    end
  end
end
