class IceAndFire::Cache
  DEFAULT_CACHE_LIMIT = 10

  def initialize(objects = {})
    @cache = objects
  end

  def [](req_string)
    @cache[req_string.to_sym]
  end

  def []=(req_string, obj)
    @cache[req_string.to_sym] = obj
  end
end
