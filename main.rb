class Person
    # attr_reader : name
    # attr_writer : name

    def initialize(name)
    @name = name
    end

    def valid_name?()
        if /^[A-Z]+$/i.match(@name)
          return true
        else
          return false  
        end
    end
end

module Contactanle
    def contact_details()
        return @email+" | "+@mobile
    end
end

class User < Person
    include Contactanle

    # attr_reader : email
    # attr_writer : email

    # attr_reader : mobile
    # attr_writer : mobile

    def initialize(name, email, mobile)
        super name
        @email = email
        @mobile = mobile
    end

    def create()
        if self.valid_mobile? and self.valid_email? and self.valid_name?
            open('db.rb', 'a') { |f|
                f.puts @name+' | '+self.contact_details
            }
            puts "data was saved successfully"
        else    
            if self.valid_name? == false
                puts "enter a valid name"
            elsif self.valid_email? == false
                puts "enter a valid email"
            else 
                puts "enter a valid mobile"
            end
        end
    end

    def valid_mobile?()
        if /^0\d{10}$/.match(@mobile)
            return true
        else
            return false  
        end
    end

    def valid_email?()
        if /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i.match(@email)
            return true
        else
            return false  
        end
    end

    def self.list(*args)
        if args.size == 0
            open('db.rb', 'r') do |f|
                while line = f.gets
                 puts line
                end
            end
        else
            open('db.rb', 'r') do |f|
                index=-1
                while line = f.gets and args[0] != index
                index = index+1
                 puts line
                end
            end
        end
    end
end

