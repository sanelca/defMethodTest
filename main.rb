# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require 'date'

@arrayOfElements = []

fileComma = File.open("docs/comma.txt")
file_data_comma = fileComma.readlines.map(&:chomp)

filePipe = File.open("docs/pipe.txt")
file_data_pipe = filePipe.readlines.map(&:chomp)

fileSpace = File.open("docs/space.txt")
file_data_space = fileSpace.readlines.map(&:chomp)

# returnGenderValue is reusable  method for gender formating
def returnGenderValue genderValue
  gender = "Female"
  if "M" == genderValue
    gender = "Male"
  end 
  return gender
end

# returnDateFormated is reusable  method for date formating
def returnDateFormated date, format
  return Date.strptime(date, format).strftime("%d/%m/%Y")
end

# reorderArray is  method for reordering array elements in specific output order
def reorderArray(surname = "", name = "", gender = "", birthDate = "", color = "")
  @arrayOfElements.push([surname, name, gender, birthDate, color])
end

# splitByComma is  method for refactoring input data with comma delimiter
def splitByComma data
  data.each { | person | 
    element  = person.split(",").map(&:strip)
    date = returnDateFormated(element[4], '%m/%d/%Y')
    reorderArray(element[0], element[1], element[2], date, element[3])    
  }  
end

# splitByPipe is  method for refactoring input data with pipe delimiter
def splitByPipe data
  data.each { | person | 
    element  = person.split("|").map(&:strip)
    gender = returnGenderValue(element[3])
    date = returnDateFormated(element[5], '%d-%m-%Y')
    reorderArray(element[0], element[1], gender, date, element[4])
  }  
end

# splitBySpace is  method for refactoring input data with space delimiter
def splitBySpace data
  data.each { | person | 
    element  = person.split(" ").map(&:strip)
    gender = gender = returnGenderValue(element[3])
    date = returnDateFormated(element[4], '%d-%m-%Y')
    reorderArray(element[0], element[1], gender, date, element[5])
  }  
end

splitByComma(file_data_comma)
splitByPipe(file_data_pipe)
splitBySpace(file_data_space)

# convertFinalArrayToString is reusable method for converting 2 dimensional array to string
def convertFinalArrayToString
  string = ""
  @arrayOfElements.each { |row| 
    rowString = ""
    row.each { |word|
      if "" == rowString
        rowString = rowString + word
      else
        rowString = rowString + " " + word
      end
    }
    if "" == string
      string = rowString
    else
      string = string + "\n" + rowString
    end
  }
  return string
end

def output1 
  @arrayOfElements = @arrayOfElements.sort_by{ |row| [row[2], row[0]] }
  puts "Output 1: \n" + convertFinalArrayToString
end

def output2 
  @arrayOfElements = @arrayOfElements.sort_by{ |row| [Date.strptime(row[3], '%d/%m/%Y'), row[0]] }
  puts "Output 2: \n" + convertFinalArrayToString
end

def output3
  @arrayOfElements = @arrayOfElements.sort_by{ |row| [ row[0]] }.reverse
  puts "Output 3: \n" + convertFinalArrayToString
end

output1
puts "\n"
output2
puts "\n"
output3

