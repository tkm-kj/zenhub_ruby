module ZenhubRuby
  class Client
    module Api
      def issue_data(repo_id: nil, issue_number: nil)
        get "/p1/repositories/#{repo_id}/issues/#{issue_number}"
      end

      def issue_events(repo_id: nil, issue_number: nil)
        get "/p1/repositories/#{repo_id}/issues/#{issue_number}/events"
      end

      def board_data(repo_id: nil)
        get "/p1/repositories/#{repo_id}/board"
      end
    end
  end
end
