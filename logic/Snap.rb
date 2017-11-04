class Snap

	def initialize(wit)
		@wit = wit
	end

	def load_ai
		@wit.index = Marshal.load(File.read(last_dump_name))
	rescue
		puts '[Snap] No dump file'
	end

	def save_ai
		File.write("dumps/#{Time.now.to_i}", Marshal.dump(@wit.index))
	end

	def restore_ai
		File.delete(last_dump_name)

		load_ai
	end

	def last_dump_name
		get_dumps.last
	end

	def get_dumps
		Dir['dumps/*'].sort{|a, b| b.to_i <=> a.to_i}
	end
end