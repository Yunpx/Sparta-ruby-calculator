def get_choice output
  $stdout.puts output
  $stdout.flush
  calc_choice = $stdin.gets.chomp
  # puts "You have chosen #{calc_choice}"
  return calc_choice
end

def get_number output
  $stdout.puts output
  $stdout.flush
  calc_choice = $stdin.gets.chomp
  # puts "You have picked number  #{calc_choice}"
  return calc_choice
end

 settings= get_choice("Which calculator do you what to use? Pick a number : 1- Basic, 2- Advanced, 3-BMI calculator and 4-Trip calculator.");

calc_choice=0
result =0
result_2=0
errorcode = "incorrect code input"

if settings== "1"||settings =="2"
  number1 = get_number("please enter the first number. ").to_i
  number2 = get_number("Please enter the second number. ").to_i
end

case settings
  when "1"
    operation = get_choice "What do you want to do with these 2 numbers? Pick a number  1-Addition, 2-Multiplication, 3-Division or 4-Subtraction."
    # Pick a number  1-Addition, 2-Multiplication, 3- Division, 4-Subtraction
    case operation
      when "1"
        operation = "+"
        result =number1+number2
        puts "#{number1} + #{number2} = #{result}"
      when "2"
        operation = "*"
        result =number1*number2
        puts "#{number1} * #{number2} = #{result}"
      when "3"
        operation = "/"
        result =number1/number2
        puts "#{number1} / #{number2} = #{result}"
      when "4"
        operation = "-"
        result =number1-number2
        puts "#{number1} - #{number2} = #{result}"
      else
        puts "Please enter a valid operation listed in the question."
      end

    when "2"
      operation = get_choice "What do you want to do with these 2 numbers? Pick a number  1-Power, 2-square root"
      case operation
        when "1"
          result = number1 ** number2
          puts "#{number1} to the power of #{number2} = #{result}"
        when "2"
          result =Math.sqrt(number1)
          result_2 =Math.sqrt(number2)

          puts "square root of #{number1} is #{result}, and for #{number2} its #{result_2}"
        else
          puts errorcode
        end

    when "3"
      settings= get_choice "Please select the method you wish to calculate your BMI. 1-Imperial, 2-Metric."
      case settings
        when "1"
          number1 = get_choice("Please enter your weight in pounds(lb).").to_i
          number2 = get_choice("Please enter your height in inches(in)").to_i
          result = number1*703
          result_2= number2*number2
          result = result/ result_2
          puts "Your BMI score is  #{result}."

        when "2"
          number1 = get_choice("Please enter your weight in Kilograms(kg).").to_i
          number2 = get_choice("Please enter your height in meters(m)" ).to_i
          result = number1
          result_2= number2 * number2
          result = result/ result_2

          puts "Your BMI score is #{result}."
        else
          puts errorcode
        end

    when "4"
      distance = get_number("Please enter the distance to be travelled(miles).").to_f
      efficiency= get_number("Please enter the fuel efficiency(mpg).").to_f
      cost = get_number("Please enter cost per gallon (£/Gallon).").to_f
      speed = get_number("Please enter the speed you will be travevling at(mph).").to_f
      limit = 60
      totalCost =0
      fuel=0
      wastedFuel=0
      ineffective=0
      time = distance/speed
      puts "Your trip will take #{time} hours, "

      if speed>0 && speed <=limit
        fuel =distance/efficiency
      else
        ineffective = (speed-limit)*2
        wastedFuel = distance/ineffective
        fuel =(distance/efficiency)
        #ineffective
        fuel = fuel + wastedFuel
        #total
        totalCost= cost * fuel
        puts "it will cost you #{totalCost}!"
    end
  else
    puts errorcode
  end
