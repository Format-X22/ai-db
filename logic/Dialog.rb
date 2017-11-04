class Dialog

	def initialize
		@dictionary = Dictionary.new
		@snap = Snap.new

		@snap.load_ai

		log 'Ready'

		loop do
			dialog_tick
		end
	end

	def dialog_tick
		print '>> '
		action = gets.strip

		if action[0] == '#'
			run action[1..-1]
		else
			# do ai action
		end
	end

	def run(action)
		command, arg = action.split(' ')

		case command
			when 'clear'   then clear_context
			when 'context' then show_context
			when 'scan'    then scan_word arg
			when 'inspect' then inspect_mind arg
			when 'save'    then save_ai
			when 'backup'  then backup_ai
			when 'restore' then restore_ai
			when 'exit'    then exit
			when 'help'	   then print_help
			else err 'Unknown command'
		end
	end

	def clear_context
		# ai clear context

		log 'Context is clear'
	end

	def show_context
		# current mind context
	end

	def scan_word(word)
		unless word
			err 'No target'
			return
		end

		@dictionary.scan(word)

		log 'Scan is done'
	end

	def inspect_mind(mean)
		unless mean
			err 'No target'
			return
		end

		# pp node
	end

	def save_ai
		@snap.save_ai

		log 'Success ai save'
	end

	def backup_ai
		@snap.backup_ai

		log 'Success backup'
	end

	def restore_ai
		return unless sure? 'Delete all data and restore last backup?'

		@snap.restore_ai

		log 'Success restore'
	end

	def print_help
		puts '==================='
		puts 'clear = Clear current mind context'
		puts 'context = Show current mind context'
		puts 'scan %word% = Scan word from dictionary'
		puts 'inspect %mean% = Inspect mind with mean'
		puts 'save = Save all minds and bonds data to database'
		puts 'backup = Standard backup database'
		puts 'restore = Delete all data, restore and load last database'
		puts 'exit = Soft exit and stop program'
		puts 'help = Print this text'
		puts '==================='
	end

	def	sure?(msg)
		puts "[Sure] #{msg}"

		res = gets.strip.downcase

		if res == 'y' or res == 'yes'
			true
		else
			log 'Cancel'
			false
		end
	end

	def log(msg)
		puts "[Log] #{msg}"
	end

	def err(msg)
		puts "[Err] #{msg}"
	end
end