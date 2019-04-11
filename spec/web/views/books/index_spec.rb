RSpec.describe Web::Views::Books::Index do
  let(:exposures) { Hash[books: []] }
  let(:template) { Hanami::View::Template.new("apps/web/templates/books/index.html.erb") }
  let(:view) { described_class.new(template, exposures) }
  let(:rendered) { view.render }

  let(:book_entity) do
    Bookshelf::Repositories::BookRepository.new.entity_class
  end

  it "exposes #books" do
    expect(view.books).to eq(exposures.fetch(:books))
  end

  context "when there are no books" do
    it "shows a placeholder message" do
      expect(rendered).to include('<p class="placeholder">There are no books yet.</p>')
    end
  end

  context "when there are books" do
    let(:book1) do
      book_entity.new(id: 1, title: "Refactoring", author: "Martin Fowler", created_at: Time.now, updated_at: Time.now)
    end

    let(:book2) do
      book_entity.new(id: 1, title: "Domain Driven Design", author: "Eric Evans", created_at: Time.now, updated_at: Time.now)
    end

    let(:exposures) { Hash[books: [book1, book2]] }

    it "lists them all" do
      expect(rendered.scan(/class="book"/).length).to eq(2)
      expect(rendered).to include("Refactoring")
      expect(rendered).to include("Domain Driven Design")
    end

    it "hides the placeholder message" do
      expect(rendered).to_not include('<p class="placeholder">There are no books yet.</p>')
    end
  end
end
