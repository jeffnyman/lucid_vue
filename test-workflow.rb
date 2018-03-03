#!/usr/bin/env ruby

require_relative './framework'

require 'test_workflow'

class AmazonSearch
  def search_for(product)
    puts "AmazonSearch - search_for: #{product}"
  end
end

class AmazonProduct
  def add_to_cart(product)
    puts "AmazonProduct - add_to_cart: #{product}"
  end
end

class AmazonCart
  def checkout
    puts "AmazonCart - checkout"
  end
end

class PurchaseFromAmazon
  include TestWorkflow

  def on(caller)
    caller.new
  end
end

PurchaseFromAmazon.paths = {
  :default => [
          [AmazonSearch, :search_for, "Star Wars"],
          [AmazonProduct, :add_to_cart, "Vector Prime"],
          [AmazonCart, :checkout]
      ],
  :trekking => [
          [AmazonSearch, :search_for, "Star Trek"],
          [AmazonProduct, :add_to_cart, "Engines of Destiny"],
          [AmazonCart, :checkout]
      ]
}

testing = PurchaseFromAmazon.new
testing.path_to(AmazonCart)
testing.path_to(AmazonCart, from: AmazonProduct)
testing.path_to(AmazonCart, from: AmazonProduct, using: :trekking)
testing.path_to(AmazonProduct).add_to_cart('testing')
testing.entire_path
