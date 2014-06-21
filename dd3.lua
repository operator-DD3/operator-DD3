function fwrite (fmt, ...) 
   return io.write(string.format(fmt, ...)) 
 end 
 function writeheader() 
   io.write([[ 
     <html> 
     <head><title>operator-DD3</title></head> 
     <style>
     body {
     background: #000000;
     color: #FFFFFF;
     }
     h1, h2, h3, h4, h5, h6 {
     background: #00FF00;
     color: #000000;
     }
     p {
     background: #313131;
     color: #00FF00;
     }
     </style>
     <h1>operator-DD3</h>
     <h2>Static Site Generator</h2>
     <br> 
   ]]) 
 end 
 function footer()
   fwrite('<center>Powered by <a href="operator-dd3.github.io/operator-DD3">DD3</a></center>')
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
    
