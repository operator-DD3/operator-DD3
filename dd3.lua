function fwrite (fmt, ...) 
   return io.write(string.format(fmt, ...)) 
 end 
 function writeheader() 
   io.write([[ 
     <html> 
     <head><title>Custom CMS in Lua</title></head> 
     <body bgcolor="#00FF00"> 
     Here are descriptions of this project and 
     the milestones reached developing this system. 
     <br> 
   ]]) 
 end 
 function footer()
   fwrite("<center>Powered by DD3</center>")
 end
 function entry1 (o) 
   count = count + 1 
   local title = o.title or '(no title)' 
   fwrite('<li><a href="#%d">%s</a>\n', count, title) 
 end 
 function writetail () 
   fwrite('</body></html>\n') 
 end 
 function entry2 (o) 
   count = count + 1 
   fwrite('<hr>\n<h3>\n') 
   local href = o.url and string.format(' href="%s"', o.url) or '' 
   local title = o.title or o.org or 'org' 
   fwrite('<a name="%d"%s>%s</a>\n', count, href, title) 
   if o.title and o.org then 
     fwrite('<br>\n<small><em>%s</em></small>', o.org) 
   end 
   fwrite('\n</h3>\n') 
   if o.description then 
     fwrite('<p>%s</p>\n', o.description) 
   end 
   if o.email then 
     fwrite('Contact: <a href="mailto:%s">%s</a>\n', o.email, o.contact or o.email) 
   elseif o.contact then 
     fwrite('Contact: %s\n', o.contact) 
   end 
 end 
 
-- MAIN PROGRAM 
 local inputfile = "db.lua"
 dofile(inputfile)
 
 writeheader() 
 count = 0 
 fwrite('<ul>\n') 
 for _,i in pairs(entries)  do
    entry1(i)
    --print("**** " .. i.title)
 end 
 fwrite('</ul>\n') 
 
 count = 0
 for _,i in pairs(entries) do
   entry2(i)
 end

 footer()
 writetail() 
    
