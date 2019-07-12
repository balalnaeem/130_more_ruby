names = <<-HEROES
Nqn Ybirynpr
Tenpr Ubccre
Nqryr Tbyqfgvar
Nyna Ghevat
Puneyrf Onoontr
Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
Wbua Ngnanfbss
Ybvf Unvog
Pynhqr Funaaba
Fgrir Wbof
Ovyy Tngrf
Gvz Orearef-Yrr
Fgrir Jbmavnx
Xbaenq Mhfr
Fve Nagbal Ubner
Zneiva Zvafxl
Lhxvuveb Zngfhzbgb
Unllvz Fybavzfxv
Tregehqr Oynapu
HEROES

LOWER = ('a'..'z').to_a
UPPER = ('A'..'Z').to_a

LOWER_HASH = LOWER.zip(LOWER.rotate(13)).to_h
UPPER_HASH = UPPER.zip(UPPER.rotate(13)).to_h

def decipher(name)
  name.chars.map do |chr|
    if LOWER_HASH.include?(chr)
      LOWER_HASH[chr]
    elsif UPPER_HASH.include?(chr)
      UPPER_HASH[chr]
    else
      chr
    end
  end.join
end

names.split("\n").each { |name| puts decipher(name) }
