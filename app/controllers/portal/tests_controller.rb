module Portal
  class TestsController < BaseController
    before_action :find_test, only: [:edit, :destroy, :show, :update]
    
    def index
      @tests = Test.all.order(id: :desc).page(params[:page]).per(10)
    end

    def new
      @test = Test.new
    end

    def create
      @test = Test.new(test_params)
  
      if @test.save
        redirect_to portal_tests_path, notice: 'Test has been created.'
      else
        render :new
      end
    end

    def update
      if @test.update(test_params)
        redirect_back fallback_location: portal_tests_path, notice: 'Test has been updated.'
      else
        render :edit
      end
    end

    def edit; end

    def destroy
      if @test.destroy
        flash[:notice] = 'Test has been deleted.'
      else
        flash[:error] = @test.errors.full_messages
      end
      redirect_to portal_tests_path
    end

    private

    def id
      params.require(:id)
    end

    def find_test
      @test ||= Test.find(id)
    end

    def test_params
      params.require(:test).permit(
        :name,
        :description
      )
    end
  end
end