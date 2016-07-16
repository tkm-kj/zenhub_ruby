require 'spec_helper'

def api_url(path)
  [ZenhubRuby::Connection::END_POINT, path].join
end

describe ZenhubRuby::Client::Api do
  let(:zenhub_access_token) { 'wfg9zzixmpcblst36gbzsvv00an3f7ey9w9njv8c94ur415r9gbygzgor0uadcvpkhpr0c2s79vmwfs6' }
  let(:github_access_token) { '9hpukb0o794qu7mp2pfhu11hks6e5b34ak4gzw4y' }
  let(:repo_name) { 'tkm-kj/zenhub_ruby' }
  let(:repo_id) { 7777 }
  let(:issue_number) { 77 }
  let(:client) { ZenhubRuby::Client.new(zenhub_access_token, github_access_token) }

  before { allow(client.github).to receive(:repo_id).with(repo_name).and_return(repo_id) }

  describe '#issue_data', vcr: true do
    subject(:data) do
      VCR.use_cassette('Zenhub_Client_Api/_issue_data/gets_own_issue_data') do
        client.issue_data(repo_name, issue_number)
      end
    end

    it 'gets own issue data' do
      expect(data.body).to be_kind_of(Hash)
      expect(data.body['estimate']).to be_truthy
      assert_requested :get, api_url("/p1/repositories/#{repo_id}/issues/#{issue_number}")
    end
  end

  describe '#issue_events', vcr: true do
    subject(:data) do
      VCR.use_cassette('Zenhub_Client_Api/_issue_events/gets_own_issue_events') do
        client.issue_events(repo_name, issue_number)
      end
    end

    it 'gets own issue events' do
      expect(data.body).to be_kind_of(Array)
      expect(data.body.first['user_id']).to be_truthy
      assert_requested :get, api_url("/p1/repositories/#{repo_id}/issues/#{issue_number}/events")
    end
  end

  describe '#board_data', vcr: true do
    subject(:data) do
      VCR.use_cassette('Zenhub_Client_Api/_board_data/gets_own_board_data') do
        client.board_data(repo_name)
      end
    end

    it 'gets own board data' do
      expect(data.body).to be_kind_of(Hash)
      expect(data.body['pipelines']).to be_truthy
      assert_requested :get, api_url("/p1/repositories/#{repo_id}/board")
    end
  end
end
