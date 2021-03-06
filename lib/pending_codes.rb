# Keep track of incoming access codes (codes generated on
# other nodes for shares we do not yet have)

require 'permahash'
require 'fileutils'
require 'pending_code'

class PendingCodes
  path = Conf.data_dir "pending_codes.db"
  @db = Permahash.new path
  @db.sync = true

  def self.add code
    @db[code] = true
  end

  def self.delete code
    @db.delete code
  end

  def self.each
    @db.each do |code,val|
      yield code
    end
  end
end
