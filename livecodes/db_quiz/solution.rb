# DB Quiz!
# What’s the SQL query to get books written before 1985?
<<~SQL
  SELECT * FROM books
  WHERE publishing_year < 1985
SQL

# What’s the SQL query to get the 3 most recent books written by Jules Verne?
<<~SQL
  SELECT * FROM books
  JOIN authors ON books.author_id = authors.id
  WHERE authors.name = 'Jules Verne'
  ORDER BY books.publishing_year DESC
  LIMIT 3
SQL

class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :name

      t.timestamps
    end
  end
end

class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :publishing_year
      t.references :author, foreing_key: true

      t.timestamps
    end
  end
end

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email

      t.timestamps
    end
  end
end

class CreateReadings < ActiveRecord::Migration[7.0]
  def change
    create_table :readings do |t|
      t.references :user, foreing_key: true
      t.references :book, foreing_key: true
      t.date :start_date # 20032024
      t.date :end_date

      t.timestamps
    end
  end
end

class AddCategoryToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :category, :string, default: 'Uncategorized'
  end
end


class Author
  has_many :books
end

class Book
  belongs_to :author
  has_many :readings
  has_many :users, through: :readings
end

class User
  has_many :readings
  has_many :books, thorugh: :readings
end

class Reading
  belongs_to :book
  belongs_to :user
end


#1. Add your favorite author to the DB
jk = Author.new(name: 'JK Rowling')
jk.save

#2. Get all authors
authors = Author.all

#3. Get author with id=8
Author.find(8)

#4. Get author with name="Jules Verne", store it in a variable: jules
jules = Author.find_by(name: 'Jules Verne')

#5. Get Jules Verne's books
jules.books

#6. Create a new book "20000 Leagues under the Seas". Store it in a variable: twenty_thousand
twenty_thousand = Book.new(title: "20000 Leagues under the Seas")
#7. Add Jules Verne as this book's author
twenty_thousand.author = jules

#8. Now save this book in the DB!
twenty_thousand.save!
#=> false
#=> true
class Author
  validates :name, presence: true
  # validates(:name, {presence: true})
end
