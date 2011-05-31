%w(base exceptions location ethnicity housing population race).each do |f|
  require File.join(File.dirname(__FILE__), 'usatoday-census', f)
end


