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
     fwrite('%s<p>\n', string.gsub(o.description, '\n\n+', '<p>\n')) 
   end 
   if o.email then 
     fwrite('Contact: <a href="mailto:%s">%s</a>\n', o.email, o.contact or o.email) 
   elseif o.contact then 
     fwrite('Contact: %s\n', o.contact) 
   end 
 end 
 function digest (o) 
   count = 0 
   --f = loadfile(inputfile) 
   --f = loadstring(entry) 
   --entry = entry1 
   entry1(entry) 
   fwrite('<ul>\n') 
   --f() 
   fwrite('</ul>\n') 
   count = 0 
   entry2(entry) 
 end 
 entry = { 
   title = "Initial Commit : 06/17/2014", 
   org = "skvmb", 
   url = "http://skvmb.github.com", 
   email = "operator.dd3@gmail.com", 
   contact = "Jacob Gardner", 
   description = [[ 
     skvCMS is a very simple Content Management System 
     created in Lua. This page will reflect the updates, 
     and revisions throughout the development process.
      
     skvCMS's birthday is today: June 17, 2014]] 
   } 

-- MAIN PROGRAM 
 cls() 
 --local inputfile = 'db.lua' 
 writeheader() 
 count = 0 
 --f = loadfile(inputfile) 
 --f = loadstring(entry) 
 --entry = entry1
 fwrite('<ul>\n') 
 entry1(entry) 
 --f() 
 fwrite('</ul>\n') 
 count = 0 
 entry2(entry) 
 --f() 
 writetail() 
