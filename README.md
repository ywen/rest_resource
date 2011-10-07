pivotal_to_pdf -- print the stories from pivotal tracker to a PDF file
====================================

[![Build Status](http://travis-ci.org/ywen/pivotal_to_pdf.png)](http://travis-ci.org/ywen/pivotal_to_pdf)

## DESCRIPTION
The gem provides a basic CRUD operation to the resources. It is basically rest-client wrapper. Once you use it, you have find, create, update and delete (Currently I implemented only find and create)

## USAGE
Given you need to fetch user from a web service. You can write:

    class User < RestResource
       class << self
         def url
           "http://www.example.com/users"
         end
       end
    end

To use it, you can just do:
    
    User.find 1

    User.create :name => "Leslie Cheung", :login => "singer"

Both operation assume your web service controller returns a json string which can be initialized into an object.

##Contributors
* Yi Wen
