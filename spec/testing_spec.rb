# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require 'testing.rb'
describe Factorial do
  before do
    @factorial = Factorial.new
    
    @sendingArrayComma = ["Abercrombie, Neil, Male, Tan, 2/13/1943", 
                    "Bishop, Timothy, Male, Yellow, 4/23/1967", 
                    "Kelly, Sue, Female, Pink, 7/12/1959"]
                  
    @resultArrayByComma = [["Abercrombie", "Neil", "Male", "13/02/1943", "Tan"], 
                    ["Bishop", "Timothy", "Male", "23/04/1967", "Yellow"], 
                    ["Kelly", "Sue", "Female", "12/07/1959", "Pink"]]
                  
    @corruptedArrayComma = [["Abercrombie", "Neil", "Male", "13/02/1943", "Tan"], 
                    ["Bishop", "Timothy", "Male", "23/04/1967", "Yellow"], 
                    ["Kelly", "Sue", "Female", "22/07/1959", "Pink"]]
    
    @sendingArrayPipe = ["Smith | Steve | D | M | Red | 3-3-1985", 
                    "Bonk | Radek | S | M | Green | 6-3-1975", 
                    "Bouillon | Francis | G | M | Blue | 6-3-1975"]

    @resultArrayByPipe = [["Smith", "Steve", "Male", "03/03/1985", "Red"], 
                    ["Bonk", "Radek", "Male", "06/03/1975", "Green"], 
                    ["Bouillon", "Francis", "Male", "06/03/1975", "Blue"]]
                  
    @corruptedArrayPipe = [["Bonk", "Radek", "Male", "06/03/1975", "Green"],
                    ["Smith", "Steve", "Male", "03/03/1985", "Red"], 
                    ["Bouillon", "Francis", "Male", "06/03/1975", "Blue"]]
                  
    @sendingArrayBySpace = ["Kournikova Anna F F 6-3-1975 Red", 
                    "Hingis Martina M F 4-2-1979 Green", 
                    "Seles Monica H F 12-2-1973 Black"]
                  
    @sesultArrayBySpace = [["Kournikova", "Anna", "Female", "06/03/1975", "Red"], 
                    ["Hingis", "Martina", "Female", "04/02/1979", "Green"], 
                    ["Seles", "Monica", "Female", "12/02/1973", "Black"]]
                  
    @corruptedArraySpace = [["Kournikova", "Anna", "Female", "06/03/1975", "Red"], 
                    ["Hingis", "", "Female", "04/02/1979", "Green"], 
                    ["Seles", "Monica", "", "12/02/1973", "Black"]]
                  
    @finalArray = [["Abercrombie", "Neil", "Male", "13/02/1943", "Tan"], 
                    ["Bishop", "Timothy", "Male", "23/04/1967", "Yellow"], 
                    ["Kelly", "Sue", "Female", "12/07/1959", "Pink"],
                    ["Smith", "Steve", "Male", "03/03/1985", "Red"], 
                    ["Bonk", "Radek", "Male", "06/03/1975", "Green"], 
                    ["Bouillon", "Francis", "Male", "06/03/1975", "Blue"],     
                    ["Kournikova", "Anna", "Female", "06/03/1975", "Red"], 
                    ["Hingis", "Martina", "Female", "04/02/1979", "Green"], 
                    ["Seles", "Monica", "Female", "12/02/1973", "Black"]]
                  
    @output1 = "Output 1:\nHingis Martina Female 04/02/1979 Green\nKelly Sue Female 12/07/1959 Pink\nKournikova Anna Female 06/03/1975 Red\nSeles Monica Female 12/02/1973 Black\nAbercrombie Neil Male 13/02/1943 Tan\nBishop Timothy Male 23/04/1967 Yellow\nBonk Radek Male 06/03/1975 Green\nBouillon Francis Male 06/03/1975 Blue\nSmith Steve Male 03/03/1985 Red"
    @output2 = "Output 2:\nAbercrombie Neil Male 13/02/1943 Tan\nKelly Sue Female 12/07/1959 Pink\nBishop Timothy Male 23/04/1967 Yellow\nSeles Monica Female 12/02/1973 Black\nBonk Radek Male 06/03/1975 Green\nBouillon Francis Male 06/03/1975 Blue\nKournikova Anna Female 06/03/1975 Red\nHingis Martina Female 04/02/1979 Green\nSmith Steve Male 03/03/1985 Red"
    @output3 = "Output 3:\nSmith Steve Male 03/03/1985 Red\nSeles Monica Female 12/02/1973 Black\nKournikova Anna Female 06/03/1975 Red\nKelly Sue Female 12/07/1959 Pink\nHingis Martina Female 04/02/1979 Green\nBouillon Francis Male 06/03/1975 Blue\nBonk Radek Male 06/03/1975 Green\nBishop Timothy Male 23/04/1967 Yellow\nAbercrombie Neil Male 13/02/1943 Tan"
  end  
  
  it "Splited by comma return multidimensional array!" do
    expect(@factorial.splitByComma(@sendingArrayComma)).to eq(@resultArrayByComma)
  end

  it "Fail test if data is corrupted spliting by comma" do
    expect(@factorial.splitByComma(@sendingArrayComma)).not_to  eq(@corruptedArrayComma)
  end

  it "Splited by pipe return multidimensional array!" do
    expect(@factorial.splitByPipe(@sendingArrayPipe)).to eq(@resultArrayByPipe)
  end  

  it "Fail test if data is corrupted spliting by pipe!" do
    expect(@factorial.splitByPipe(@sendingArrayPipe)).not_to eq(@corruptedArrayPipe)
  end

  it "Splited by space return multidimensional array!" do
    expect(@factorial.splitBySpace(@sendingArrayBySpace)).to eq(@sesultArrayBySpace)
  end  

  it "Fail test if data is corrupted spliting by space!" do
    expect(@factorial.splitBySpace(@sendingArrayBySpace)).not_to eq(@corruptedArraySpace)
  end
  
  it "Fail test if gender is not valide!" do
    expect(@factorial.returnGenderValue("M")).not_to eq("Female")
  end 
  
  it "Pass test if gender is valide!" do
    expect(@factorial.returnGenderValue("M")).to eq("Male")
  end
  
  it "Pass if date return corrected output" do
    expect(@factorial.returnDateFormated("24-07-2019", '%d-%m-%Y')).to eq("24/07/2019")
  end
  
  it "Pass if output 1 is sorted in good way" do
    expect(@factorial.output1(@finalArray)).to eq(@output1)
  end 
  
  it "Pass if output 2 is sorted in good way" do
    expect(@factorial.output2(@finalArray)).to eq(@output2)
  end   
  
  it "Pass if output 3 is sorted in good way" do
    expect(@factorial.output3(@finalArray)).to eq(@output3)
  end   
end
