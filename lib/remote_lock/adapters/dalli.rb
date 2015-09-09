require 'remote_lock/adapters/base'

module RemoteLock::Adapters
  class Dalli < Base

    def store(key, expires_in_seconds)
      @connection.add(key, uid, expires_in_seconds)
    end

    def delete(key)
      @connection.delete(key)
    end

    def has_key?(key)
      @connection.get(key) == uid
    end

  end
end
