require_relative "common"

# Uptime
module Uptime
  def uptime
    return main_convert(`uptime`)
  end
  private
  # convert
  def main_convert(console_result)
    result = Hash.new
    tmp = Array.new
    tmp[0] = convert_to_now(console_result)
    tmp[1] = convert_to_up(console_result)
    tmp[2] = convert_to_user(console_result)
    tmp[3] = convert_to_load_average(console_result)
    tmp.each do |t|
      result.update(set_to_hash(t[0], t[1]))
    end
    return result
  end
  # now
  def convert_to_now(console_result)
    return "now", console_result.match(/\d{1,2}\:\d{1,2}\:\d{1,2}/)[0]
  end
  # up
  def convert_to_up(console_result)
    case
    when console_result.include?("days")
      return console_result.match(/up  \d{1,2} days,  \d{1,2}\:\d{1,2}/)[0].split(" ", 2) 
    else
      return console_result.match(/up  \d{1,2}\:\d{1,2}/)[0].split(" ", 2) 
    end
  end
  # user
  def convert_to_user(console_result)
    user_number = console_result.match(/\d{1,10} users/)[0].split(" ", 2) 
    return user_number[1], user_number[0]
  end
  # load average
  def convert_to_load_average(console_result)
    result = Hash.new
    load_average_match = console_result.match(/load average: \d{1,2}\.\d{1,2}, \d{1,2}\.\d{1,2}, \d{1,2}\.\d{1,2}/)[0]
    key = load_average_match.split(":", 2)[0]
    val = load_average_match.split(":", 2)[1]
    min = [1, 5, 15]
    val.split(",", 3).each_with_index do |al, index|
      result.update(set_to_hash("#{min[index]}min", al.strip))
    end
    return key, result
  end
end
