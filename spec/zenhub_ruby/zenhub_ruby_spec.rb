require 'spec_helper'

describe ZenhubRuby do
  let(:zenhub_access_token) { 'wfg9zzixmpcblst36gbzsvv00an3f7ey9w9njv8c94ur415r9gbygzgor0uadcvpkhpr0c2s79vmwfs6' }
  let(:github_access_token) { '9hpukb0o794qu7mp2pfhu11hks6e5b34ak4gzw4y' }

  describe '.new' do
    subject { ZenhubRuby.new(zenhub_access_token, github_access_token) }

    it { is_expected.to be_kind_of(ZenhubRuby::Client) }
  end
end
