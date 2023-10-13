require_relative 'person'
require_relative 'book'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'

class App
  attr_accessor :people, :books, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  # Method to create a user input for creating a teacher or student
  def create_user_input
    puts 'Do you want to create a teacher (1) or a student (2)? [Input the number]'
    user_input = gets.chomp.to_i
    if user_input == 1
      create_teacher
    elsif user_input == 2
      create_student
    else
      puts 'Invalid input'
    end
  end

  # Method to create a teacher
  def create_teacher
    age, name, specialization = person_details
    teacher = Teacher.new(specialization, age, name)
    add_person(teacher)
  end

  # Method to create a student
  def create_student
    age, name, parent_permission_permission = person_details
    student = Student.new(parent_permission,age, name)
    add_person(student)
  end

  # Method to get common person details (age, name, specialization/parent permission)
  def person_details
    puts 'Age:'
    age = gets.chomp.to_i
    puts 'Name:'
    name = gets.chomp.to_s
    puts 'Specialization or parent permission (if student):'
    specialization_or_permission = gets.chomp.to_s
    [age, name, specialization_or_permission]
  end

  # Method to add a person to the people array
  def add_person(person)
    @people.push(person)
    puts "#{person.class.name} #{person.name} created successfully"
  end

  # Method to create a book
  def create_book
    puts 'Title of book:'
    title = gets.chomp.to_s
    puts 'Author of book:'
    author = gets.chomp.to_s
    book = Book.new(title, author)
    @books.push(book)
    puts "Book #{book.title} created successfully"
  end

  # Method to list books
  def list_books
    @books.each do |book|
      puts "#{book.title} by #{book.author}"
    end
  end

  # Method to list people (teachers and students)
  def list_people
    @people.each_with_index do |person, index|
      puts "#{index + 1}. [#{person.class.name}] Name: \"#{person.name}\", ID: #{person.id}, Age: #{person.age}"
    end
  end

  # Method to create a rental
  def create_rental
    book_index = select_book
    return unless book_index

    person_index = select_person
    return unless person_index

    date = get_rental_date

    book = @books[book_index]
    person = @people[person_index]

    rental = Rental.new(date, book, person)
    @rentals.push(rental)
    puts 'Rental created successfully'
  end

  # Method to select a book for rental
  def select_book
    puts 'Select a book from the following list by number'
    book_list_with_index
    book_index = gets.chomp.to_i
    unless (0...@books.length).include?(book_index)
      puts "Error adding rental, book with index #{book_index} doesn't exist"
      return false
    end
    book_index
  end

  # Method to select a person for rental
  def select_person
    puts 'Select a person from the following list by number'
    list_people_with_index
    person_index = gets.chomp.to_i
    unless (0...@people.length).include?(person_index)
      puts "Error adding rental, person with index #{person_index} doesn't exist"
      return false
    end
    person_index
  end

  # Method to get rental date
  def get_rental_date
    puts 'Date (YYYY-MM-DD):'
    gets.chomp.to_s
  end

  # Method to list books with index
  def book_list_with_index
    @books.each_with_index do |book, index|
      puts "#{index + 1}. #{book.title} by #{book.author}"
    end
  end

  # Method to list people with index
  def list_people_with_index
    @people.each_with_index do |person, index|
      puts "#{index + 1}. [#{person.class.name}] Name: \"#{person.name}\", ID: #{person.id}, Age: #{person.age}"
    end
  end

  # Method to list rentals for a given person ID
  def list_rentals
    puts 'Enter person ID'
    person_id = gets.chomp.to_i
    rentals = @rentals.select { |rental| rental.person.id == person_id }
    puts 'Rentals:'
    rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title}"
    end
    return unless rentals.empty?

    puts "No rentals found for this person with ID #{person_id}"
  end
end
