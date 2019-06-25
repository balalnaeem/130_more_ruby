=begin
 So the name are rotated, 13 places forward.
 I need to rotate them 13 places

 I can I need to user two array that are rotated 13 places (lower and uppercase)
 I need to two more arrays, of letters in natural order (lower and uppercase)

 I can use zip and turn them into hashes(keys:13 places rotated, values: natural order)

Iterate through the characters of the name, and replaces the keys, with values?

In: string
Out: string
=end

LOWER_CASE_LETTERS = ('a'..'z').to_a
UPPER_CASE_LETTERS = ('A'..'Z').to_a

LOWER_CASE_ROT13 = LOWER_CASE_LETTERS.zip(LOWER_CASE_LETTERS.rotate(13)).to_h
UPPER_CASE_ROT13 = UPPER_CASE_LETTERS.zip(UPPER_CASE_LETTERS.rotate(13)).to_h

def decipher name
  name.chars.map do |char|
    if LOWER_CASE_ROT13.include?(char)
      LOWER_CASE_ROT13[char]
    elsif UPPER_CASE_ROT13.include?(char)
      UPPER_CASE_ROT13[char]
    else
      char
    end
  end.join
end


p decipher "Nqn Ybirynpr"
p decipher "Tenpr Ubccre"
p decipher "Nqryr Tbyqfgvar"
p decipher "Nyna Ghevat"
p decipher "Puneyrf Onoontr"
p decipher "Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv"
p decipher "Wbua Ngnanfbss"
p decipher "Ybvf Unvog"
p decipher "Pynhqr Funaaba"
p decipher "Fgrir Wbof"
p decipher "Ovyy Tngrf"
p decipher "Gvz Orearef-Yrr"
p decipher "Fgrir Jbmavnx"
p decipher "Xbaenq Mhfr"
p decipher "Fve Nagbal Ubner"
p decipher "Zneiva Zvafxl"
p decipher "Lhxvuveb Zngfhzbgb"
p decipher "Unllvz Fybavzfxv"
p decipher "Tregehqr Oynapu"