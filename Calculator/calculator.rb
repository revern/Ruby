# methods for calculating
def calculate(numbers)
  degreeC numbers
  multiplyC numbers
  sumC numbers
end
def degreeC(numbers)
  (0..numbers.length-1).each { |i|
    if numbers[i]=='^'
      q=numbers[i-1].to_f**numbers[i+1].to_f
      numbers[i-1]=q
      numbers[i]=nil
      numbers[i+1]=nil
      numbers.compact!
      degreeC numbers
      break
    end
  }
end
def multiplyC(numbers)
  (0..numbers.length-1).each { |i|
    if numbers[i]=='*' or numbers[i]=='/'
      if numbers[i]=='*'
        q=numbers[i-1].to_f*numbers[i+1].to_f
      end
      if numbers[i]=='/'
        q=numbers[i-1].to_f/numbers[i+1].to_f
      end
      numbers[i-1]=q
      numbers[i]=nil
      numbers[i+1]=nil
      numbers.compact!
      multiplyC numbers
      break
    end
  }
end
def sumC(numbers)
  (0..numbers.length-1).each { |i|
    if numbers[i]=='+' or numbers[i]=='-'
      if numbers[i]=='+'
        q=numbers[i-1].to_f+numbers[i+1].to_f
      end
      if numbers[i]=='-'
        q=numbers[i-1].to_f-numbers[i+1].to_f
      end
      numbers[i-1]=q
      numbers[i]=nil
      numbers[i+1]=nil
      numbers.compact!
      sumC numbers
      break
    end
  }
end
puts'Enter command for calculating'
calcLine = gets.chomp
numbers=[]
numStart=0
failed=false
doubled=false
# numbers and symbols reading
if calcLine[0]>='0' and calcLine[0]<='9' and calcLine[calcLine.length-1]>='0' and calcLine[calcLine.length-1]<='9'
  (0..calcLine.length-1).each { |i|

    if !((calcLine[i]>='0' and calcLine[i]<='9') or calcLine[i]=='+' or calcLine[i]=='-' or calcLine[i]=='*' or calcLine[i]=='/' or calcLine[i]=='^' or calcLine[i]=='.')
      failed=true
      break
    end
    if calcLine[i]=='.'
      if !doubled
        doubled=true;
      else
        failed=true
        break;
      end

    end
    if calcLine[i]=='+' or calcLine[i]=='-' or calcLine[i]=='*' or calcLine[i]=='/' or calcLine[i]=='^'
      if calcLine[i+1]=='+' or calcLine[i+1]=='-' or calcLine[i+1]=='*' or calcLine[i+1]=='/' or calcLine[i+1]=='^'
        failed=true
        break
      end
      numbers.push(calcLine[numStart, i-numStart])
      numbers.push(calcLine[i])
      numStart=i+1
      doubled=false
    end
  }
  numbers.push(calcLine[numStart,calcLine.length])
else
  failed=true
end
if failed==true
  puts 'Error, entered incorrect command'
else
  #  if we got correct line, calculate it
  calculate numbers
  puts numbers
end