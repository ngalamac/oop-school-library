require_relative 'app'

def greetings
  puts 'Welcome to School Library App'
  puts ''
end

def options_list
  puts 'Please choose an option by entering a number:'
  puts '1- List all books'
  puts '2- List all people'
  puts '3- Create a person'
  puts '4- Create a book'
  puts '5- Create a rental'
  puts '6- List all rentals for a given person id'
  puts '7- Exit'
end

def list_books_option(app)
  app.list_books
end

def list_people_option(app)
  app.list_people
end

def create_person_option(app)
  app.create_user_input
end

def create_book_option(app)
  app.create_book
end

def create_rental_option(app)
  app.create_rental
end

def list_rentals_option(app)
  app.list_rentals
end

def exit_option
  exit
end

def call_options(option, app)
  option_actions = {
    1 => method(:list_books_option),
    2 => method(:list_people_option),
    3 => method(:create_person_option),
    4 => method(:create_book_option),
    5 => method(:create_rental_option),
    6 => method(:list_rentals_option),
    7 => method(:exit_option)
  }

  option_action = option_actions[option]

  if option_action
    option_action.call(app)
  else
    puts 'Invalid option'
  end
end

def main
  app = App.new
  greetings_displayed = false
  loop do
    unless greetings_displayed
      greetings
      greetings_displayed = true
    end
    options_list
    option = gets.chomp.to_i
    call_options(option, app)
    break if option == 7
  end
end

main
