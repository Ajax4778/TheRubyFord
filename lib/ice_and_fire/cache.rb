class IceAndFire::Cache
  DEFAULT_CACHE_LIMIT = 10

  def initialize(objects = {})
    @cache = objects
  end

  def [](req_string)
    @cache[req_string.to_sym]
  end

  def []=(req_string, obj)
    clear if full?
    @cache[req_string.to_sym] = obj
  end

  private

  def clear
    @cache = {}
  end

  def full?
    @cache.size >= DEFAULT_CACHE_LIMIT
  end
end
