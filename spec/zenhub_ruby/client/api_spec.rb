require 'spec_helper'

def api_url(path)
  [ZenhubRuby::Connection::END_POINT, path].join
end

describe ZenhubRuby::Client::Api do
  let(:access_token) { ENV['ACCESS_TOKEN'] || 'access_token' }
  let(:repo_id) { ENV['REPO_ID'] || 7777 }
  let(:issue_number) { ENV['ISSUE_NUMBER'] || 77 }
  let(:client) { ZenhubRuby::Client.new(access_token) }

  describe '#issue_data', vcr: true do
    subject(:data) do
      VCR.use_cassette('Zenhub_Client_Api/_issue_data/gets_own_issue_data') do
        client.issue_data(repo_id, issue_number)
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
        client.issue_events(repo_id, issue_number)
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
        client.board_data(repo_id)
      end
    end

    it 'gets own board data' do
      expect(data.body).to be_kind_of(Hash)
      expect(data.body['pipelines']).to be_truthy
      assert_requested :get, api_url("/p1/repositories/#{repo_id}/board")
    end
  end
end
