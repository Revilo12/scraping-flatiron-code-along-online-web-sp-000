require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper

  def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title && course.title != ""
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end

  def get_page
    doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
    binding.pry
  end

  # def get_page(link)
  #   page = open(link)
  #   Nokogiri::HTML(page).doc
  # end
  #
  # def get_courses(html)
  #   doc = html.css(.class1.class2)
  #
  # end
  #
  # def make_courses(course_doc)
  #   course_doc.each do |course_html|
  #     course = Course.new
  #     course.title = course_html
  #     course.schedule = course_html
  #     course.description = course_html
  #   end
  # end
end

Scraper.new.get_page
