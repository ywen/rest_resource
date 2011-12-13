rest_resource -- rest-client gem wrapper to provide a simple CRUD interface
====================================

[![Build Status](https://secure.travis-ci.org/ywen/rest_resource.png)](http://travis-ci.org/ywen/rest_resource)


## DESCRIPTION
The gem provides a basic CRUD operation to the resources. It is basically rest-client wrapper. Once you use it, you have find, create, update and delete (Currently I implemented find, create and update)

The goal of this gem is to provide a minimum CRUD client interface for the RESTful web services. It doesn't make the API to be ActiveRecord like. Rather, it lets the users have the full control on the resources, especially on the error handling.

## USAGE
Given that you need to fetch user from a web service. You can write:

    class User < RestResource::Resource
       class << self
         def site
          "http://www.example.com"
         end

         def resource_name
          "users"
         end
       end
    end

To use it, you can just do:
    
    user = User.find 1

    user = User.create :name => "Leslie Cheung", :login => "singer"

    user = User.new :id => 12, :name => "Faye Wang"
    user.save

    users = User.all :active => true

Both operations assume your web service controller returns a json string which can be initialized into an object.

The gem supports nested resources. For example, if user.address is an instance of Address class and needs to be so. You can specify the json (in ruby hash format) as the following:

    class Address << RestResource::Resource
      ...
    end

    {"name" => "Leslie Cheung", ..., "mailing_address" => {"object" => {"address" => {"address_line_1" => "a street"}} }
##Contributors
* Yi Wen
