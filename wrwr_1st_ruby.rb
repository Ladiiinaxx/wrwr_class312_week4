# create a new Class, User, that has the following attributes:
# - name
# - email
# - password
 
class User
    attr_accessor :name, :email, :password
 
    def initialize(name, email, password)
        @name = name
        @email = email
        @password = password
    end
 
# add a method to user so, user can enter to a room
# user.enter_room(room)
 
    def enter_room(room)
        room.users << self unless room.users.include?(self)
    end
 
# add a method to user so, user can send a message to a room
# user.send_message(room, message)
# user.ackowledge_message(room, message)
 
    def send_message(room, content)
        message = Message.new(self, room, content)
        room.broadcast(message)
    end
 
    def acknowledge_message(room, message)
        puts "#{name} ✓ --> #{room.name} '#{message.content}'"
    end
end
 
# create a new Class, Room, that has the following attributes:
# - name
# - description
# - users
 
class Room
    attr_accessor :name, :description, :users
 
    def initialize(name, description)
        @name = name
        @description = description
        @users = []
    end
 
# add a method to a room, so it can broadcast a message to all users
# room.broadcast(message)
 
    def broadcast(message)
        puts "message in #{name}: #{message.user.name}: '#{message.content}'"
        users.each do |user|
            user.acknowledge_message(self, message) unless user == message.user
        end
    end
end
 
# create a new Class, Message, that has the following attributes:
# - user
# - room
# - content
 
class Message
    attr_accessor :user, :room, :content
 
    def initialize(user, room, content)
        @user = user
        @room = room
        @content = content
    end
end
 
user1 = User.new("Un_01", "owow@bumail.net", "1523")
user2 = User.new("Un_02", "bbkry@bumail.net", "8864")
user3 = User.new("Un_03", "dfdfdfd@bumail.net", "148596")
 
room = Room.new("Ca va vas?", "massage")
 
user1.enter_room(room)
user2.enter_room(room)
user3.enter_room(room)
 
user3.send_message(room, "Haloooo 😁")
user1.send_message(room, "Is madamm so ca va va?")
user2.send_message(room, "Y she look like ...kry")
 