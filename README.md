[![Build Status](https://travis-ci.org/seanhawkridge/checkout-test.svg?branch=master)](https://travis-ci.org/seanhawkridge/checkout-test)

## The Task

Implementing, in Ruby, a checkout system that can scan items, apply promotions, and calculate a total.


## My Approach

I began by doing some simple design and domain modelling with a pencil and paper. Two initial objects emerged - an item and a checkout. I test-drove the development of an Item with some basic properties and a Checkout that could scan items, add them to a collection and calculate a total.

I then test-drove two promotions objects - TenPercentOver60 and LavenderHeartsMultiple - and a PromotionalRules object that iterates through the promotions and applies them to a total.

Next, I extracted a Subtotal object from Checkout to make updating the subtotal easier, and I extracted a PriceFormatter to separate out the pretty-formatting of the checkout total.

Finally, I refactored to ensure that promotions are applied in the correct order (items discounts first, then total discounts), no matter what order they're passed in.


## Assumptions

* Items can be scanned in any order
* Promotions are changeable
* New items/promotions can be added


## Installation

* Fork this repo
* Clone it to your local environment
* On the command line, `cd` into the directory
* Run `bundle`


## Running the program

* To view example results, run `rake examples:all`
* To view test results and coverage, run `rspec`

You can also interact with the program from the command line in IRB/PRY:

````
require './lib/item.rb'

require './lib/checkout.rb'

require './lib/promotional_rules.rb'

lavender_hearts_offer = LavenderHeartsMultiple.new

ten_percent_offer = TenPercentOver60.new

promotional_rules = PromotionalRules.new(lavender_hearts_offer, ten_percent_offer)

co = Checkout.new(promotional_rules)

lavender_heart = Item.new("001", "Lavender Heart", 9.25)

cufflinks = Item.new("002", "Personalised Cufflinks", 45.00)

t_shirt = Item.new("003", "Kids T-shirt", 19.95)

co.scan(lavender_heart)

co.scan(t_shirt)

co.scan(lavender_heart)

co.scan(cufflinks)

co.total
 => "£73.76"
 ````


## Ideas/To Do

* I chose to create separate objects for each promotion, so that new promotions that make reductions in different ways could be processed. Having said this, if all promotions end up performing one of two tasks - either making a reduction to a particular item or making a reduction to the overall total, then these could be refactored into two template-style objects.
* Some error-handling to make sure only promotion-type objects are passed in when instantiating the PromotionalRules class.
* Refactor Checkout#items into a separate Basket object.
