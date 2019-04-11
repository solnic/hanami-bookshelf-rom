RSpec.describe Web::Controllers::Books::Destroy, type: :action do
  let(:action) { described_class.new }

  let(:repository) do
    Bookshelf::Repositories[:Book]
  end

  let!(:book) do
    repository.create(title: "Confident Ruby", author: "Avdi Grimm")
  end

  after do
    repository.clear
  end

  context 'with valid id' do
    it 'deletes the book and redirects to index' do
      response = action.call(id: book.id)

      expect(response[0]).to eq(302)
      expect(response[1]["Location"]).to eq("/books")
    end
  end

  context 'with invalid id' do
    it 'returns 422' do
      response = action.call(id: 'oops')

      expect(response[0]).to eq(422)
    end
  end
end
