module Web
  module Controllers
    module Books
      class Index
        include Web::Action

        expose :books

        def call(params)
          @books = Bookshelf::Repositories[:Book].all
        end
      end
    end
  end
end
