## Project Title: Marketplace

## Group members:
1. Prajyot Mane (RedID: 824633726)
2. Yash Prakashbhai Shah (RedID: 824645634)

## Description: 

* A Flutter application where users can buy and sell the products.
* In this application we had provided basic authentication for the users using firebase. There are predefined categories of the product which makes it an easy task for the user to buy or sell a particular item.
* If the user wants to buy a product, the user has to select the category which would display items available and the cost associated with it. We had provided two buttons "I am interested" - on clicking, adds your response to that product, and buy it now - on clicking redirects you to card details for purchasing the item. User can view their list of purchased items in the "My Purchase" tab after clicking on the "Cart" icon on the appbar.
* If the user wants to sell the product, the user has to select the Posts tab on the title bar, and all the details like image, cost, and condition of the product is asked. After entering the details and clicking on the submit button will post an ad for their product. User can view their list of posted ads on the "My Ads" tab after clicking on the "Cart" icon on the appbar. 

## Instructions:

* There is no specific account to use our flutter app. Users can register themselves and can log in with the same credentials on the login screen.
* We have used the Sandboxed version of Square payment API to facilitate the payments through the app while completing the item purchase. Please use the following card details while testing the payment feature - 

Card Number: 4111 1111 1111 1111
Exp Date: 11/23
CVV: 123
Zip: 12345

## Known Issue:

* While purchasing the item, after selecting the particular category, if there are no products available for that category, the page correctly shows the message "No items found". However, if previously there were products for the particular category and all of them are sold out now, then the item list is empty and the user should also see the "No items found" message which is not working and the user ends up seeing a white screen instead.

* Input fields don't clear out after successfully posting an ad.

  
