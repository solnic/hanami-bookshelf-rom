require_relative '../entities'

module Bookshelf
  module Repositories
    class Repository < ROM::Repository::Root
      struct_namespace Bookshelf::Entities

      def self.[](relation)
        Class.new(self) { root(relation) }
      end

      def self.new
        super(Persistence.db)
      end

      def all
        root.to_a
      end

      def first
        root.first
      end

      def last
        root.last
      end

      def create(attrs)
        root.changeset(:create, attrs).map(:add_timestamps).commit
      end

      def update(id, attrs)
        root.by_pk(id).changeset(:update, attrs).map(:touch).commit
      end

      def delete(id)
        root.by_pk(id).delete
      end

      def clear
        root.delete
      end

      def entity_class
        root.mapper.model
      end
    end
  end
end