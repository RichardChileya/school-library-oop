require './person'
require './student'
require './teacher'
require './classroom'
require './book'
require './rental'

class App
  attr_accessor :book, :people, :rentals

  def initialize
    @book = []
    @people = []
    @rentals = []
  end

  def run
    puts hello
  end

  def hello
    puts 'You are welcome to School Library App!'
    puts ''
    puts 'Please, enter a number of your choose:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    option = gets.chomp.to_i
    case option
    when 1..6 then option_func(option)
    when 7 then puts 'Thank you for using this app'
    else puts 'please enter a valid number'
    end
  end

  def option_func(option)
    case option
    when 1
      list_all_books
    when 2
      list_all_people
    when 3
      create_a_person
    when 4
      create_a_book
    when 5
      create_a_rental
    when 6
      list_all_rentals_for_person_id
    end
  end

  def create_a_person
    print 'Do you want to create student (1) or a teacher (2)? [input your choice of number]:'
    person_type = gets.chomp
    case person_type
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Invalid input, please enter valid input'
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Classroom:'
    classroom = gets.chomp
    print 'Student has parent permission? [Y/N]:'
    parent_permission = gets.chomp.downcase
    case parent_permission
    when 'y'
      @people.push(Student.new(classroom, age, name, parent_permission: true))
    when 'n'
      @people.push(Student.new(classroom, age, name, parent_permission: false))
    else
      puts 'Invalid input given'
    end
    puts 'Student created successfully'
    hello
  end

  def create_teacher
    print 'Age'
    age = gets.chomp
    print 'Name'
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    @people << Teacher.new(age, specialization, name, parent_permission: true)
    puts 'Teacher created successfully'
    hello
  end

  def create_a_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @book << Book.new(title, author)
    puts 'Book successfully created'
    hello
  end

  def create_a_rental
    puts 'Select book from the list using number'
    @book.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
    book_index = gets.chomp
    puts 'Select a person from the list by number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = gets.chomp
    print 'Date:'
    date = gets.chomp
    @rentals << Rental.new(date, @book[book_index.to_i], @people[person_index.to_i])
    puts 'Rental successfully created'
    hello
  end

  def list_all_books
    if @book.empty?
      puts 'No books available'
      puts ''
    else
      @book.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    end
    hello
  end

  def list_all_people
    if @people.empty?
      puts 'No person here'
      puts ''
    else
      @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    end
    hello
  end

  def list_all_rentals_for_person_id
    print 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals:'
    @rentals.each do |rental|
      if rental.person.id == id
        puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
      else
        puts 'No rental ID found:'
      end
    end
    hello
  end
end
