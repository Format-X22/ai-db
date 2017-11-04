class Snap

	def initialize
		@db = Sequel.sqlite('db.sqlite')
	end

	def load_ai
		@db[:mind].all do |rec|
			# construct
		end

		@db[:bond].all do |rec|
			# construct and link
		end
	end

	def save_ai
		@db[:mind].delete
		@db[:bond].delete

		# populate
	end

	def backup_ai
		# copy to dir
	end

	def restore_ai
		# restore last

		load_ai
	end

end