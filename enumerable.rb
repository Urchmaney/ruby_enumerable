module Enumerable
    def my_each     
      i=0
      while i<self.length
        yield(self[i])
        i+=1
      end
    end

    def my_each_with_index      
        i=0
        while i<self.length
          yield(i,self[i])
          i+=1
        end
      end

    def my_select
        result=[]
        self.my_each{ |element| result << element if yield(element)}
    end  
    def my_all
        flag=true
        self.my_each{ |element| flag=flag && yield(element)}
        flag
    end  

    def my_any
      flag=false
      self.my_each{ |element| flag= flag || yield(element)}
      flag
    end  

    def my_none
       flag=false
        self.my_each{ |element| flag=flag || yield(element)}
        !flag
    end  

    def my_count
      count=0   
      self.my_each{ |element| count+=1 if yield(element)}
      count
   end  

    def my_map(proc = nil)
      result=[]
      self.my_each{ |element|
        if proc
          result <<  proc.call(element)         
        else
          result << yield(element)
        end
      }
      result
    end  

  def my_inject(i)
    res=i||0
    self.my_each{ |element| res=yield(res,element)}
    res
  end

  end


  

def multiply_els(arr)
    arr.my_inject(1){|res,ele| res*ele}
end

  puts multiply_els([2,4,5])
  
  proc=Proc.new{
    |element| 
    element.upcase
  }
  puts ["hi","hey"].my_map(proc)