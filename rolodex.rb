require_relative('contact.rb')

class Rolodex
	@@id = 1000

	def initialize
		@contacts = []
	end

	def add_contact(first_name, last_name, email, note)
		# contact = Contact.new(@@id, first_name, last_name, email, note)

		@contacts << Contact.new(@@id, first_name, last_name, email, note)
		@@id += 1

		# @contacts << contact
	end

	def all
		@contacts
	end

	def find_contact_by_id(id)
		@contacts.each do |contact|
			if contact.id == id 
				return contact
			end	
		end	
		puts "Contact does not exist"
	end

	def modify(field, id, new_value)	
		contact = find_contact_by_id(id)
		if field == "1"
			contact.first_name=(new_value)
		elsif field == "2"
			contact.last_name=(new_value)
		elsif field == "3"
			contact.email=(new_value)
		elsif field == "4"
			contact.note=(new_value)
		else
			puts "That is not a valid command"
		end
	end

	def delete(id)
		contact = find_contact_by_id(id)
		@contacts.delete(contact)
	end
end

rolodex = Rolodex.new

rolodex.add_contact("Mitch", "Bank", "mitch@bank.com", "cool guy")
rolodex.add_contact("Natalie", "Black", "Natalie@Black.com", "Awesome TA")

rolodex.modify("1", 1001, "Nattie")

puts rolodex.inspect