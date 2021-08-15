# =====================
# 
# @os:Ubuntu 18.04.4 LTS
# @ruby-version: ruby-2.7.1
# 
# =====================

# 
def get_max_length(command)
  max_len = 0
  command.each_line.with_index do |line, index|
    tmp = line.chomp.split(" ").length
    max_len = tmp if max_len < tmp and index > 0
  end
  return max_len
end

def text_to_array(command)
  command_a = Array.new
  max_len = get_max_length(command)
  command.each_line.with_index { |line, index| command_a[index] = line.chomp.split(" ", max_len) }
  return command_a
end

def transpose_2d(data)
  len = 0
  data.each { |d| len = d.length if len < d.length }
  result = Array.new(len) { Array.new(data.length, nil) }
  data.each_with_index do |line, i|
    line.each_with_index do |d, j|
      result[j][i] = data[i][j] if data[i][j].nil? == false
    end
  end
  return result
end

def set_hash(key, value)
  result = Hash.new
  case value
  when /^[0-9]+$/   then result.store(key, value.to_i)
  when /^[0-9]+\%$/ then result.store(key, value.delete("%").to_i)
  else                   result.store(key, value)
  end
  return result
end

def main_routine(key_lv1, key_lv2, target)
  result = Hash.new
  key_lv1.each_with_index do |lv1, i|
    tmp = Hash.new
    key_lv2.each_with_index do |lv2, j|
      lv2 = lv2.chomp(":") if lv2.end_with?(":")
      tmp.update(set_hash(lv2, target[i][j])) if target[i][j].nil? == false
    end
    result.update(set_hash(lv1, tmp))
  end
  return result
end

# freeコマンドのメイン処理
def free(opt = nil)
  # オプションコマンドが有効か判定する
  def feasible?(opt)
    # オプションが無いならTrue
    return true if opt.nil?
    # オプションがあるなら、s c v help が含まれていない場合にTrueを返す
    return !(opt.include?("s") || opt.include?("c") || opt.include?("v") || opt.include?("help"))
  end
  # 変換のメイン処理
  def convert(free_a)
    # freeコマンドの列名称（total、used、free、shared、buffers、cache、available）を取得する
    key_lv1 = free_a[0]
    # freeコマンドの行名称（Mem、Low、Hight、Swap、Total）を取得する
    key_lv2 = free_a.map.with_index { |row| row[0] }[1..free_a.length]
    # 表形式だった各使用量をネストさせた配列形式に変換する
    target  = transpose_2d(free_a.map.with_index { |row, index| row[1..row.length] }[1..free_a.length])
    # 行名称、列名称、使用量をハッシュ形式に変換する
    return main_routine(key_lv1, key_lv2, target)
  end
  # オプションコマンドが有効か判定する
  if feasible?(opt)
    # bashで実行した結果を配列に変換してから、ハッシュ型に変換する
    convert(text_to_array(`free #{opt}`))
  else
    # オプションに無効文字が含まれる場合、エラーメッセージを出して終了する
    puts "error: This options cannot be used."
    puts "       -s N, --seconds N  repeat printing every N seconds"
    puts "       -c N, --count N    repeat printing N times, then exit"
    puts "       --version          output version information and exit"
    puts "       --help"
  end
end

# dfコマンドメイン処理
def df(opt = nil)
  # オプションコマンドが有効か判定する
  def feasible?(opt)
    # オプションが無いならTrue
    return true if opt.nil?
    # オプションがあるなら、v help が含まれていない場合にTrueを返す
    return !(opt.include?("v") || opt.include?("help"))
  end
  # 変換のメイン処理
  def convert(df_a)
    # dfコマンドの行名称（overlay tmpfs...）を取得する
    key_lv1 = df_a.transpose.last[1..df_a.transpose.last.length]
    # dfコマンドの列名称（Filesystem 1K-blocks Used Available Use% Mounted on）を取得する
    key_lv2 = df_a[0]
    # 表形式だった各使用量をネストさせた配列形式に変換する
    target = df_a[1..df_a.length]
    # 行名称、列名称、使用量をハッシュ形式に変換する
    return main_routine(key_lv1, key_lv2, target)
  end
  # オプションコマンドが有効か判定する
  if feasible?(opt)
    # bashで実行した結果を配列に変換してから、ハッシュ型に変換する
    convert(text_to_array(`df #{opt}`))
  else
    # オプションに無効文字が含まれる場合、エラーメッセージを出して終了する
    puts "error: This options cannot be used."
    puts "       --version          output version information and exit"
    puts "       --help"
  end
end


