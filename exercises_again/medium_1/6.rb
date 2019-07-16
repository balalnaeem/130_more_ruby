def convert_to_base_8(n)
  n.to_s(8).to_i
end

base_8_proc = method(:convert_to_base_8).to_proc

p [8, 10, 12, 14, 16, 18, 20, 22].map(&base_8_proc)