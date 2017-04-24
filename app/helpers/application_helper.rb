module ApplicationHelper
  def get_id link
    ind = link.index("pid=")
    ind += 4
    str = ""
    i = ind.to_i
    for i in ind..(ind+15)
      str += link[i]
    end
    str
  end  
end
