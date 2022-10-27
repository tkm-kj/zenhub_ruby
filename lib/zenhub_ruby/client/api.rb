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

      def workspace_data(repo_name, workspace_id)
        get "/p2/workspaces/#{workspace_id}/repositories/#{github.repo_id(repo_name)}/board"
      end

      def repo_releases(repo_name)
        get "/p1/repositories/#{github.repo_id(repo_name)}/reports/releases"
      end

      def release_issues(release_id)
        get "/p1/reports/release/#{release_id}/issues"
      end
    end
  end
end
