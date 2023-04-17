class App
  attr_accessor :books, :students, :teachers, :rentals

  def initialize
    @books = []
    @students = []
    @teachers = []
    @rentals = []
    @functions = {
      1 => :list_books,
      2 => :list_persons_index,
      3 => :add_person,
      4 => :print_add_book,
      5 => :add_rental,
      6 => :rentals_by_person_id
    }
  end

  def input_getter(msj, is_number: false)
    print msj
    value = is_number ? gets.chomp.to_i : gets.chomp
  end

  def print_add_book
    title = input_getter('Title: ')
    author = input_getter('Author: ')
    add_book(title, author)
  end

  def add_book(title, author)
    new_book = Book.new(title, author)
    puts ['Book created succesfully!', '']
    @books << new_book
  end

  def add_person
    type_person = input_getter('Do you want to create a student (1) or a teacher (2)?: [input the number]: ',
                               is_number: true)
    # if type is not valid
    return if type_person > 2 || type_person < 1

    # gets common data
    age = input_getter('Age: ')
    name = input_getter('Name: ')
    # creates student if type is 1
    return add_student(age, name, input_getter('Has parent permission? [Y/N]: ')) if type_person == 1

    # otherwise it creates a teacher
    add_teacher(age, name, input_getter('Specialization: '))
  end

  def add_student(age, name, permission)
    # if permission is not a valid input, ask again
    return add_person if permission.capitalize != 'Y' && permission.capitalize != 'N'

    has_permission = permission.capitalize == 'Y'
    @students << Student.new(age, name, parent_permission: has_permission)
    puts ['Person created succesfully', '']
  end

  def add_teacher(age, name, specialization)
    @teachers << Teacher.new(specialization, age, name, parent_permission: true)
    puts ['Person created succesfully', '']
  end

  def add_rental
    puts 'Select a book from the following list by number:'
    @books.each_with_index do |book, idx|
      print "#{idx}) Title: '#{book.title}', Author: #{book.author}"
      puts ''
    end
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number (not ID):'
    persons = list_persons_index
    person_index = gets.chomp.to_i
    puts ''
    print 'Date: '
    date = gets.chomp
    new_rental = Rental.new(date, persons[person_index], books[book_index])
    puts 'Rental created succesfully.'
    @rentals << new_rental
  end

  def list_books
    if @books.empty?
      puts 'There are not created books yet'
    else
      @books.each do |book|
        print "Title: '#{book.title}, Author: '#{book.author}'"
        puts ''
      end
    end
  end

  def list_persons_index
    persons = @students + @teachers
    if persons.empty?
      puts 'There is no registered person.'
      return
    end
    persons.each_with_index do |person, idx|
      print idx
      if idx < @students.length
        print ") [Student] Name: #{person.name}, ID: #{person.id} Age: #{person.age}"
      else
        print ") [Teacher] Name: #{person.name}, ID: #{person.id} Age: #{person.age}"
      end
      puts ''
    end
    persons
  end

  def rentals_by_person_id
    print 'Please enter the person ID: '
    person_id = gets.chomp.to_i
    persons = @students + @teachers
    filtered_person = persons.select { |person| person.id == person_id }
    if filtered_person[0].nil?
      puts ['Error, you must choose an existing id', '']
      rentals_by_person_id
    else
      print "#{filtered_person[0].name}'s rentals:"
      puts ''
      filtered_person[0].rentals.each do |rental|
        print "Date:  #{rental.date}, Book: '#{rental.book.title}', by #{rental.book.author}"
        puts ''
      end
    end
  end

  def function(int)
    send(@functions[int])
  end
end
