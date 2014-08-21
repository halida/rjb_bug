require 'pdf/stamper'

def java_work
  require 'rjb'
  jversion = Rjb.import('java.lang.System').getProperty('java.version')
  puts "java version: #{jversion}"

  point = Rjb::import('java.awt.Point')
  puts "rjb can load java native class"

  Rjb::load(File.dirname(__FILE__) + '/iText-4.2.0.jar', ['-Djava.awt.headless=true'])
  puts "rjb load iText jar"
  java_class = Rjb::import('com.lowagie.text.pdf.PdfReader')
  puts "rjb load iText class"
end

def fork_java_work
  Kernel.fork{java_work}
end

# it cannot load iText class
fork_java_work

# it can load iText class in main process
sleep 2
puts ""
java_work

