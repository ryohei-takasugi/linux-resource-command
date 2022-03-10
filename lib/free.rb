
require_relative "common"

# free
module Free
  include CommonModule
  def free(opt = nil)
    # オプションコマンドが有効か判定する
    if feasible?(opt)
      # コマンドを実行する
      console_result = `free #{opt}`
      # コマンド実行結果が有効なデータか簡易的に確認する
      if console_result_valid?(console_result)
        # シェルで実行した結果を配列に変換してから、ハッシュ型に変換する
        return main_convert(console_result)
      else
        output_error("Console results do not include 'Mem:'")
      end
    else
      output_error("Not a valid option")
    end
  end
  private
  # オプションコマンドが有効か判定する
  def feasible?(opt)
    case
    when opt.nil?             then return true
    when opt.include?("s")    then return false
    when opt.include?("c")    then return false
    when opt.include?("v")    then return false
    when opt.include?("help") then return false
    else
      return true
    end
  end
  # コンソールから取得した結果に問題ないか判定する
  def console_result_valid?(console_result)
    case
    when console_result.include?("Mem:") then return true
    else
      return false
    end
  end
  # Freeコマンド用の行列入れ替え
  def transpose_for_free(datas, max_number_of_columns)
    # ネストした配列（１層目は行別、２層目は列別）に対応したハッシュ型の初期値
    result = Array.new(max_number_of_columns) { Array.new(datas.length, nil) }
    # 配列データの行列を入れ替え（ただし値がnilの場合はデータを入れない）
    datas.each_with_index do |line, i|
      for j in 0..line.length do
        result[j][i] = datas[i][j] unless datas[i][j].nil?
      end
    end
    return result
  end
  # 変換のメイン処理
  def main_convert(console_result)
    # 範囲指定に使う列数の最大値を取得する
    max_number_of_columns = get_max_columns(console_result, 1)
    # コンソールの表データを配列形式に変換する
    array_type_free = convert_text_to_array(console_result, max_number_of_columns)
    # freeコマンドの列名称（total、used、free、shared、buffers、cache、available）を取得する
    key_lv1 = array_type_free[0]
    # freeコマンドの行名称（Mem、Low、Hight、Swap、Total）を取得する
    key_lv2 = array_type_free.map.with_index { |row| row[0] }[1..max_number_of_columns]
    # 表形式だった各使用量をネストさせた配列形式に変換する
    value  = transpose_for_free(
      array_type_free.map.with_index { |row, index| row[1..row.length] }[1..max_number_of_columns],
      max_number_of_columns)
    # 行名称、列名称、使用量をハッシュ形式に変換する
    return convert(key_lv1, key_lv2, value)
  end
  # オプションに有効ではない場合、エラーメッセージを出して終了する
  def output_error(error_string)
    puts "error: This options cannot be used by linuxcmd-by-ruby."
    puts "       -s N, --seconds N  repeat printing every N seconds"
    puts "       -c N, --count N    repeat printing N times, then exit"
    puts "       --version          output version information and exit"
    puts "       --help"
  end
end
