# =====================
# 
# @os:Ubuntu 18.04.4 LTS
# @ruby-version: ruby-2.7.1
# 
# =====================

# 最大列数を取得する
def get_max_columns(command)
  max_number_of_columns = 0
  command.each_line.with_index do |line, index|
    tmp = line.chomp.split(" ").length
    max_number_of_columns = tmp if max_number_of_columns < tmp and index > 0
  end
  return max_number_of_columns
end

# コマンドの結果（表形式）をネストした配列（１層目は行別、２層目は列別）に変換する
def convert_text_to_array(command)
  array_type_command = Array.new
  max_number_of_columns = get_max_columns(command)
  command.each_line.with_index do |line, index|
    array_type_command[index] = line.chomp.split(" ", max_number_of_columns) 
  end
  return array_type_command
end

# Freeコマンド用の行列入れ替え
def transpose_for_free(data)
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

# ハッシュにデータを１つずつ入れる
def set_to_hash(key, value)
  result = Hash.new
  case value
  when /^[0-9]+$/   then result.store(key, value.to_i)
  when /^[0-9]+\%$/ then result.store(key, value.delete("%").to_i)
  else                   result.store(key, value)
  end
  return result
end

# メイン変換処理
def convert(key_lv1, key_lv2, target)
  result = Hash.new
  key_lv1.each_with_index do |lv1, i|
    tmp = Hash.new
    key_lv2.each_with_index do |lv2, j|
      lv2 = lv2.chomp(":") if lv2.end_with?(":")
      tmp.update(set_to_hash(lv2, target[i][j])) if target[i][j].nil? == false
    end
    result.update(set_to_hash(lv1, tmp))
  end
  return result
end

# freeコマンドのメイン処理
def free(opt = nil)
  # オプションコマンドが有効か判定する
  def feasible?(opt, console_result)
    # オプションが無いならTrue
    return true if opt.nil?
    # オプションがあるなら、s c v help が含まれていない場合にTrueを返す
    return false if (opt.include?("s") || opt.include?("c") || opt.include?("v") || opt.include?("help"))
    # 実行結果に「Filesystem」が含まれている場合Trueを返す
    return console_result.include?("Mem:")
  end
  # 変換のメイン処理
  def convert_of_free(array_type_free)
    # freeコマンドの列名称（total、used、free、shared、buffers、cache、available）を取得する
    key_lv1 = array_type_free[0]
    # freeコマンドの行名称（Mem、Low、Hight、Swap、Total）を取得する
    key_lv2 = array_type_free.map.with_index { |row| row[0] }[1..array_type_free.length]
    # 表形式だった各使用量をネストさせた配列形式に変換する
    target  = transpose_for_free(array_type_free.map.with_index { |row, index| row[1..row.length] }[1..array_type_free.length])
    # 行名称、列名称、使用量をハッシュ形式に変換する
    return convert(key_lv1, key_lv2, target)
  end
  # コマンドを実行する
  console_result = `free #{opt}`
  # オプションコマンドが有効か判定する
  if feasible?(opt, console_result)
    # bashで実行した結果を配列に変換してから、ハッシュ型に変換する
    convert_of_free(convert_text_to_array(console_result))
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
  def feasible?(opt, console_result)
    # オプションが無いならTrue
    return true if opt.nil?
    # オプションがあるなら、v help が含まれていない場合にTrueを返す
    return false if (opt.include?("v") || opt.include?("help"))
    # 実行結果に「Filesystem」が含まれている場合Trueを返す
    return console_result.include?("Filesystem")
  end
  # 変換のメイン処理
  def convert_of_df(array_type_df)
    # dfコマンドの行名称（overlay tmpfs...）を取得する
    key_lv1 = array_type_df.transpose.last[1..array_type_df.transpose.last.length]
    # dfコマンドの列名称（Filesystem 1K-blocks Used Available Use% Mounted on）を取得する
    key_lv2 = array_type_df[0]
    # 表形式だった各使用量をネストさせた配列形式に変換する
    target = array_type_df[1..array_type_df.length]
    # 行名称、列名称、使用量をハッシュ形式に変換する
    return convert(key_lv1, key_lv2, target)
  end
  # コマンドを実行する
  console_result = `df #{opt}`
  # オプションコマンドが有効か判定する
  if feasible?(opt, console_result)
    # bashで実行した結果を配列に変換してから、ハッシュ型に変換する
    convert_of_df(convert_text_to_array(console_result))
  else
    # オプションに無効文字が含まれる場合、エラーメッセージを出して終了する
    puts "error: This options cannot be used."
    puts "       --version          output version information and exit"
    puts "       --help"
  end
end


