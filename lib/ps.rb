require_relative "common"

# Psコマンド
module Ps
  include CommonModule
  def ps
    def plane(opt = nil)
      # オプションコマンドが有効か判定する
      if feasible?(opt)
        # コマンドを実行する
        console_result = `ps #{opt}`
        # シェルで実行した結果を配列に変換してから、ハッシュ型に変換する
        if console_result_valid?(console_result)
          return main_convert(console_result)
        else
          output_error("Console results do not include 'PID'.")
        end
      else
        output_error("Not a valid option.")
      end
    end
    def head(opt = nil, head)
      # オプションコマンドが有効か判定する
      if feasible?(opt)
        # コマンドを実行する
        if head.integer?
          console_result = `ps #{opt} | head -n #{head.to_i}`
        else
          output_error("Execution failed.")
        end
        # シェルで実行した結果を配列に変換してから、ハッシュ型に変換する
        if console_result_valid?(console_result)
          return main_convert(console_result)
        else
          output_error("Console results do not include 'PID'.")
        end
      else
        output_error("Not a valid option.")
      end
    end
    def grep(opt = nil, word)
      # オプションコマンドが有効か判定する
      if feasible?(opt)
        # コマンドを実行する
        console_result = `ps #{opt} | grep -e "PID" -e "#{word}" | grep -v grep`
        # シェルで実行した結果を配列に変換してから、ハッシュ型に変換する
        if console_result_valid?(console_result)
          return main_convert(console_result)
        else
          output_error("Console results do not include 'PID'.")
        end
      else
        output_error("Not a valid option.")
      end
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
    when opt.include?("h")    then return false
    when opt.include?("f")    then return false
    when opt.include?("help") then return false
    else
      return true
    end
  end
  # コンソールから取得した結果に問題ないか判定する
  def console_result_valid?(console_result)
    case
    when console_result.include?("PID") then return true
    else
      return false
    end
  end
  # 変換のメイン処理
  def main_convert(console_result)
    # 範囲指定に使う列数の最大値を取得する
    max_number_of_columns = get_max_columns(console_result, 0)
    # コンソールの表データを配列形式に変換する
    array_type_df = convert_text_to_array(console_result, max_number_of_columns)
    # psコマンドの行名称（COMMAND列の値）を取得する
    key_lv1 = array_type_df.transpose.last[1..array_type_df.transpose.last.length]
    # psコマンドの列名称（USER PID %CPU %MEM VSZ RSS TT STAT STARTED TIME COMMAND）を取得する
    key_lv2 = array_type_df[0]
    # 表形式だった各使用量をネストさせた配列形式に変換する
    value = array_type_df[1..array_type_df.length]
    # 行名称、列名称、使用量をハッシュ形式に変換する
    return convert(key_lv1, key_lv2, value)
  end
  # オプションに有効ではない場合、エラーメッセージを出して終了する
  def output_error(error_string)
    puts "error: This options cannot be used by linuxcmd-by-ruby."
    puts "       --version          output version information and exit"
    puts "       --help"
    puts "       #{error_string}"
  end
end