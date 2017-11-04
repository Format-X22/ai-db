require 'pp'
require 'require_all'

require_all 'logic'
require_all 'ai'

wit = Wit.new
snap = Snap.new(wit)
dictionary = Dictionary.new

Dialog.new(wit, snap, dictionary)