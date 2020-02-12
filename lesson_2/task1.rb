month = { 
dec: 31,
jan: 31,
feb: 28,
mar: 31,
apr: 30,
may: 31,
jun: 30,
jul: 31,
aug: 31,
sep: 30,
oct: 31,
nov: 31 }
month.each {|month, days| puts month if days == 30}