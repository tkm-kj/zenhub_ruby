module ZenhubRuby
  class Client
    module Api
      def issue_data(repo_name, issue_number)
        get "/p1/repositories/#{github.repo_id(repo_name)}/issues/#{issue_number}"
      end

      def issue_events(repo_name, issue_number)
        get "/p1/repositories/#{github.repo_id(repo_name)}/issues/#{issue_number}/events"
      end

      def board_data(repo_name)
        get "/p1/repositories/#{github.repo_id(repo_name)}/board"
      end
    end
  end
end
