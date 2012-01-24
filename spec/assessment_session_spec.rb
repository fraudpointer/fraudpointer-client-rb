require 'spec_helper'

module Fraudpointer
  describe AssessmentSession do
    describe '.create' do
      before { Client.key = "API_KEY" }

      subject {
        VCR.use_cassette('create_assessment_session') do
          AssessmentSession.create
        end
      }

      it { should_not be_nil }
      it { should be_kind_of(AssessmentSession) }
      its(:id) { should == 1555077 }
    end

    describe '.with_key' do
      let(:key) { 'CUSTOM_KEY' }

      subject { AssessmentSession.with_key(key) }

      its(:key) { should == key }
      specify { Client.key.should_not == key }

      describe '.create' do
        subject {
          VCR.use_cassette('create_assessment_session_with_custom_key') do
            AssessmentSession.with_key(key).create
          end
        }

        it { should_not be_nil }
        it { should be_kind_of(AssessmentSession) }
        its(:id) { should == 1555077 }
      end
    end
  end
end
