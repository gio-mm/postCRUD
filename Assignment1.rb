def count_duplicates(str)
  str.downcase!
  str.split('').uniq.select{ |char| str.count(char)>1}.length
end

