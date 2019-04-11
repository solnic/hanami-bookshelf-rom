module Web
  module Controllers
    module Books
      class Destroy
        include Web::Action

        params do
          required(:id).filled(:int?)
        end

        def call(params)
          if params.valid?
            Bookshelf::Repositories[:Book].delete(params[:id])
            redirect_to(routes.books_path)
          else
            self.status = 422
          end
        end
      end
    end
  end
end
