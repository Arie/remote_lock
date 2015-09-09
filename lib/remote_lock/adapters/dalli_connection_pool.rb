require 'remote_lock/adapters/base'

module RemoteLock::Adapters
  class DalliConnectionPool < Base

    def store(key, expires_in_seconds)
      @connection.with do |conn|
        conn.add(key, uid, expires_in_seconds)
      end
    end

    def delete(key)
      @connection.with do |conn|
        conn.delete(key)
      end
    end

    def has_key?(key)
      @connection.with do |conn|
        conn.get(key) == uid
      end
    end

  end
end
