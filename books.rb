class Book
    
    attr_accessor :title, :author, :isbn
    def initialize(title, author, isbn)
        @title = title
        @author = author
        @isbn = isbn
    end
    def to_s
        "Title: #{@title}, Author: #{@author}, ISBN: #{@isbn}"
    end
end

class Inventory
    attr_accessor :books
    def initialize
        @books = []
        if File.exist?("Books.txt")
            File.foreach("Books.txt") do |line|
                title, author, isbn = line.chomp.split(",")
                @books << Book.new(title, author, isbn)
            end
        end
    end
    def search_by_isbn(isbn) 
        @books.find { |book|  book.isbn == isbn }
        
    end

    def search_by_Author(auth)
        @books.find { |book| book.author == auth }
    end

    def search_by_Title(tit)
        @books.find { |book| book.title == tit }
    end

        def search(type_search,val)
         if @books.empty?
            puts "No books found"
        else   
            if type_search == "isbn"
                if search_by_isbn(val)==nil
                    puts "Book not found"
                else
                    puts "#{search_by_isbn(val).to_s} is exists"
                end
            elsif type_search == "author"
                if search_by_Author(val)==nil
                    puts "Book not found"
                else
                    puts "#{search_by_Author(val).to_s} is exists"
                end
            else
                if search_by_Title(val)==nil
                    puts "Book not found"
                else
                    puts "#{search_by_Title(val).to_s} is exists"
                end
            end
        end
    end
    def sort_by_isbn! 
        if !@books.empty?
            @books.sort_by! { |book| book.isbn }
        end
    end

    def add_book(book)
        isbn = book.isbn
        if search_by_isbn(isbn)==nil
            @books<<book
            puts "Book added"
        else
            puts "Book already exists"
        end
    end
    
    def remove_book(isbn)
        if search_by_isbn(isbn)!=nil
            @books.delete(search_by_isbn(isbn))
            puts "Book removed"
        else
            puts "Book not found"            
        end
    end

    def print_books()
        if @books.empty?
            puts "No books found"
        else  
            @books.each{|book| puts book.to_s}
        end
    end

    def save()
        if !@books.empty?
            sort_by_isbn!
            File.open("Books.txt", "w") do |file|
                @books.each do |book|
                    file.write("#{book.title},#{book.author},#{book.isbn}\n")
                end
            end
        end
    end
end

inventory1 = Inventory.new

END{
   
    inventory1.save
    #qqqq
}



# book1=Book.new("Book1", "kero", "1234")
# book2=Book.new("Book2", "ibrahem", "123456")
# book3=Book.new("Book3", "omar", "123423")

# inventory1.add_book(book1)
# inventory1.add_book(book2)
# inventory1.add_book(book3)

# inventory1.sort_by_isbn!

# puts inventory1.search("isbn","1234").to_s

# puts inventory1.search("author","ibrahem").to_s

# puts inventory1.search("title","Book1").to_s


# inventory1.print_books

def enter_data_book
    puts "Enter book title"
    title = gets.chomp
    puts "Enter book auther"
    author = gets.chomp
    puts "Enter book isbn"
    isbn = gets.chomp
    book = Book.new(title, author, isbn)
    return book
end
x=0
while x!=8 do
    puts "Enter 1 to add a book"
    puts "Enter 2 to remove a book"
    puts "Enter 3 to search for a book by isbn"
    puts "Enter 4 to search for a book by author"
    puts "Enter 5 to search for a book by title"
    puts "Enter 6 to print all books"
    puts "Enter 7 to sort all books"
    puts "Enter 8 to exit or any other key to continue"
    x=gets.chomp.to_i
    if x==1
        book=enter_data_book
        inventory1.add_book(book)
        inventory1.save
    elsif x==2
        book=enter_data_book
        inventory1.remove_book(book.isbn)
        inventory1.save
    elsif x==3
        puts "Enter book isbn"
        isbn=gets.chomp
        inventory1.search("isbn",isbn)
    elsif x==4
        puts "Enter book auther"
        author=gets.chomp
        inventory1.search("author",author)
    elsif x==5
        puts "Enter book title"
        title=gets.chomp
         inventory1.search("title",title)
    elsif x==6
        inventory1.print_books
    elsif x==7
        inventory1.save
    else
        puts "thank you for using our program :)"
        x=8
    end
end


    
    







