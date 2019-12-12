# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require 'date'
class Factorial
  def reorderArray(surname = "", name = "", gender = "", birthDate = "", color = "")
    @arrayOfPersons.push([surname, name, gender, birthDate, color])
  end  

  def returnDateFormated date, format
    return Date.strptime(date, format).strftime("%d/%m/%Y")
  end  

  def returnGenderValue genderValue
    gender = "Female"
    if "M" == genderValue
      gender = "Male"
    end 
    return gender
  end
  
  def splitByComma data
    @arrayOfPersons = []
    data.each { | person | 
      element  = person.split(",").map(&:strip)
      date = returnDateFormated(element[4], '%m/%d/%Y')
      reorderArray(element[0], element[1], element[2], date, element[3])    
    } 
    return @arrayOfPersons
  end
  
  def splitByPipe data
    @arrayOfPersons = []
    data.each { | person | 
      element  = person.split("|").map(&:strip)
      gender = returnGenderValue(element[3])
      date = returnDateFormated(element[5], '%d-%m-%Y')
      reorderArray(element[0], element[1], gender, date, element[4])
    } 
    return @arrayOfPersons
  end  
  
  def splitBySpace data
    @arrayOfPersons = []
    data.each { | person | 
      element  = person.split(" ").map(&:strip)
      gender = gender = returnGenderValue(element[3])
      date = returnDateFormated(element[4], '%d-%m-%Y')
      reorderArray(element[0], element[1], gender, date, element[5])
    }  
    return @arrayOfPersons
  end  
  
  def convertFinalArrayToString finalArray
    string = ""
    finalArray.each { |row| 
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
  
  def output1 finallArray
    finallArray = finallArray.sort_by{ |row| [row[2], row[0]] }
    return "Output 1:\n" + convertFinalArrayToString(finallArray)
  end  
  
  def output2 finallArray
    finallArray = finallArray.sort_by{ |row| [Date.strptime(row[3], '%d/%m/%Y'), row[0]] }
    return "Output 2:\n" + convertFinalArrayToString(finallArray)
  end    
  
  def output3 finallArray
    finallArray = finallArray.sort_by{ |row| [ row[0]] }.reverse
    return "Output 3:\n" + convertFinalArrayToString(finallArray)
  end    
end
