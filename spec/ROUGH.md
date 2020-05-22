
Type of error whilst running RSpec without method which occurred on line 1:
NameError:
  uninitialized constant Oystercard



File path:
An error occurred while loading ./spec/oystercard_spec.rb.


card.top_up(number)
car.balance == 0 + number

topup(num)
fail "Maximum exceeded" if

subject.deduct(fare)
fare - balance

subject.touch_in
@journey = true

subject.touch_out
@journey = false

subject.in_journey?
@journey

initialize
@journey = false

touch_in

journey class:
starting a journey, finishing a journey, calculating the fare of a journey, and returning whether or not the journey is complete.

PENALTY:90


if injourney is true past midnight
penalty

 => [{:entry_station=>"bank"}]  
 => [{:entry_station=>"bank"}] 


 <!-- Let's extract a JourneyLog class. It should be responsible for starting a journey, ending a journey and returning a list of journeys. -->


 Station -- > JL #begin/end/record

 JL #record  -- > Journey #complete?

 Journey #fare -- > Oystercard #balance


Oystercard -> track balance through #touch_in/ #touch_out

Journey -> #fare based on whether journey #complete?

Journey_Log -> beginning trip / ending trip/ saving trip 

Station -> station and its zone


JL
 method to begin

 method end

 @list