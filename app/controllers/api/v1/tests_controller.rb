module Api
  module V1
    class TestsController < Api::BaseAuthController
      before_action :find_test, only: [:show, :commit]

      def index
        @tests = Test.all.order(id: :desc)
        render_json(data: @tests.map{|test| TestSerializer.new(test)})
      end

      def show
        render_json(data: TestDetailSerializer.new(@test))
      end

      def commit
        render_json(data: commit_params)
      end

      private

      def id
        params.require(:id)
      end

      def find_test
        @test = Test.find(id)
      end

      def commit_params
        params.require(:answers)
      end
    end
  end
end

