class App
  attr_accessor :books, :students, :teachers, :rentals
  def initialize
    @books = []
    @students = []
    @teachers = []
    @rentals = []
  end

  def add_book
    print ('Title: ')
    title = gets.chomp
    print ('Author: ')
    author = gets.chomp
    new_book = Book.new(title, author)
    puts ['Book created succesfully!', '']
    @books << new_book
  end

  def add_person
    print ('Do you want to create a student (1) or a teacher (2)?: [input the number]: ')
    option = gets.chomp
    case option
    when '1'
      print ('Age: ')
      age = gets.chomp
      print ('Name: ')
      name = gets.chomp
      print ('Has parent permission? [Y/N]: ')
      permission = gets.chomp
      add_student(age, name, permission)
    when '2'
      print ('Age: ')
      age = gets.chomp
      print ('Name: ')
      name = gets.chomp
      print ('Specialization: ')
      specialization = gets.chomp
      add_teacher(age, name, specialization)
    end
  end

  def add_student(age, name, permission)
    if permission.capitalize == 'N'
      n_student = Student.new(age, name, parent_permission: false)
      @students << n_student
      puts ['Person created succesfully', '']
    elsif permission.capitalize == 'Y'
      n_student = Student.new(age, name, parent_permission: true)
      @students << n_student
      puts ['Person created succesfully', '']
    else
      add_person
    end
  end

  def add_teacher(age, name, specialization)
    n_teacher = Teacher.new(specialization, age, name, parent_permission: true)
    @teachers << n_teacher
    puts ['Person created succesfully', '']
  end

  def add_rental
    puts ('Select a book from the following list by number:')
    @books.each_with_index { |book, idx|
      print idx
      print ') Title: "'
      print book.title
      print '", Author: "'
      print book.author
      print '"'
      puts ''
    }
    book_index = gets.chomp.to_i
    puts ('Select a person from the following list by number (not ID):')
    persons = list_persons_index
    person_index = gets.chomp.to_i
    puts ''
    print 'Date: '
    date = gets.chomp
    new_rental = Rental.new(date, persons[person_index], books[book_index])
    puts ('Rental created succesfully.')
    @rentals << new_rental
  end

  def list_books
    @books.each { |book| 
      print 'Title: "'
      print book.title
      print '", Author: "'
      print book.author
      print '"'
      puts ''
    }
  end

  def list_persons_index
    persons = @students + @teachers
    if persons.length === 0 
      puts 'There is no registered person.'
      return
    end
    persons.each_with_index { |person, idx|
      if idx < @students.length
        print idx
        print ') [Student] '
        print 'Name: '
        print person.name
        print ', ID: '
        print person.id
        print ', Age: '
        print person.age
        puts ''
      else
        print idx
        print ') [Teacher] '
        print 'Name: '
        print person.name
        print ', ID: '
        print person.id
        print ', Age: '
        print person.age
        puts ''
      end
    }
    persons
  end

  def rentals_by_person_id
    print 'Please enter the person ID: '
    person_id = gets.chomp.to_i
    persons = @students + @teachers

    filtered_person = persons.select { |person| person.id === person_id}
    if filtered_person[0] == nil
      puts 'Error, you must choose an existing id'
      puts ''
      rentals_by_person_id
    else
      print filtered_person[0].name
      print "'s "
      print 'rentals:'
      puts ''
      filtered_person[0].rentals.each {|rental|
        print 'Date: '
        print rental.date
        print ', Book: "'
        print rental.book.title
        print ', by '
        print rental.book.author
        puts ''
      }
    end
  end
end
