require_relative "common"

# Dfコマンド
module Df
  include CommonModule
  def df(opt = nil)
    if feasible?(opt)
      console_result = `df #{opt}`
      if console_result_valid?(console_result)
        return main_convert(console_result)
      else
        output_error("Console results do not include 'Filesystem'.")
      end
    else
      output_error("Not a valid option.")
    end
  end
  private
  # オプションコマンドが有効か判定する
  def feasible?(opt)
    case
    when opt.nil?             then true
    when opt.include?("v")    then false
    when opt.include?("help") then false
    else
      return true
    end
  end
  # コンソールから取得した結果に問題ないか簡易的に判定する
  def console_result_valid?(console_result)
    case
    when console_result.include?("Filesystem") then return true
    else
      return false
    end
  end
  # 変換のメイン処理
  def main_convert(console_result)
    # 範囲指定に使う列数の最大値を取得する
    max_number_of_columns = get_max_columns(console_result, 1)
    # コンソールの表データを配列形式に変換する
    array_type_df = convert_text_to_array(console_result, max_number_of_columns)
    # dfコマンドの行名称（overlay tmpfs...）を取得する
    key_lv1 = array_type_df.transpose.last[1..array_type_df.transpose.last.length]
    # dfコマンドの列名称（Filesystem 1K-blocks Used Available Use% Mounted on）を取得する
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