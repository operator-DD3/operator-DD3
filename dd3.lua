function fwrite (fmt, ...) 
   return io.write(string.format(fmt, ...)) 
 end 
 function writeheader() 
   io.write([[ 
     <html> 
     <head><title>operator-DD3</title></head> 
     <link href='https://fonts.googleapis.com/css?family=Special+Elite' rel='stylesheet' type='text/css'>
     <style>
     legend {
      border: 1px solid #007100;
      background: #007100;
      border-radius: 4px;
     }
     fieldset {
      margin: 8px;
      padding: 8px;
      background: #007100;
      border: 1px solid #00FF00;
      border-radius: 4px;
     }
     body {
      font-family: 'Special Elite', cursive;
     background: #000000;
     color: #FFFFFF;
     }
     h1 {
      font-family: 'Special Elite', cursive;
      font-size: 48px;
      text-shadow: 4px 4px 4px #a00;
      background: linear-gradient(#003100, #00FF00, #003100);
      border: 1px solid #00FF00;
      border-radius: 4px;
        color: #000000;
     }
     h2 {
      font-family: 'Special Elite', cursive;
      font-size: 36px;
      text-shadow: 4px 4px 4px #a00;
      background: linear-gradient(#003100, #00FF00, #003100);
      border: 1px solid #00FF00;
      border-radius: 4px;
        color: #000000;
     }
     h3, h4, h5, h6 {
      font-family: 'Special Elite', cursive;
      text-shadow: 2px 2px 2px #a00;
     background: linear-gradient(#007100, #008100, #007100);
     color: #000000;
     }
     p {
     
      font-family: 'Special Elite', cursive;
     color: #000000;
     }
     a {
      font-family: 'Special Elite', cursive;
      text-shadow: 2px 2px 2px #a00;
      font-family: 'Special Elite', cursive;
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
   fwrite('<hr>\n<fieldset><h3>\n') 
   local href = o.url and string.format(' href="%s"', o.url) or '' 
   local title = o.title or o.org or 'org' 
   fwrite('<a name="%d"%s>%s</a>\n', count, href, title) 
   if o.title and o.org then 
     fwrite('<br>\n<small><em>%s</em></small>', o.org) 
   end 
   fwrite('\n</h3></fieldset>\n') 
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
    
