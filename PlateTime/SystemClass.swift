//
//  SystemClass.swift
//  PlateTime
//
//  Created by Kevin Abram on 1/3/18.
//  Copyright © 2018 Kevin Abram. All rights reserved.
//

import Foundation
/*
struct SystemConfigCart
{
    static var cartsave: [String] = []
    static var cartcount: [Int] = []
}
 */
struct SystemConfigPost
{
    static var arrayname: [String] = ["My first strawberry pancake!", "My awesome Pizza", "A chinese dumpling"]
    static var arraydesc: [String] = ["Its my first strawberry pancake! I bet it will taste good! yum!! :)", "Somehow I have quite of a talent in making pizzas thanks to platetime wkwkw", "Wow, I never thought I could make a beautiful piece of art!"]
    static var numberoflikes: [Int] = [3, 5, 6]
    static var theimage: [String] = ["1", "2", "3"]
}

//The food object

public class foods
{
    var name: String
    var ingredients: [String]
    init(Name: String, Ingredient: [String])
    {
        self.name = Name
        self.ingredients = Ingredient
    }
}
// The foodlibrary is the temporary starting food array before any filters or search
public var foodlibrary = [foods]()
// The foodlibrarytemp is the temporary array to initialize food library
public var foodlibrarytemp = [foods]()
// The foodlibrarycooksave is the array which saves the array that have been filtered
public var foodlibrarycooksave = [foods]()

//The post object
public class posts
{
    var postname: String
    var arraydesc: String
    var numberoflikes: Int
    var theimage: String
    init(PostName: String, ArrayDesc: String, NumberofLikes: Int, TheImage: String)
    {
        self.postname = PostName
        self.arraydesc = ArrayDesc
        self.numberoflikes = NumberofLikes
        self.theimage = TheImage
    }
}

public var postlibrary = [posts]()

public class ingredients
{
    var ingredientname: String
    var ingredientdesc: String
    var cost: Int
    var qty: Int
    init(IngredientName: String, IngredientDesc: String, Cost: Int, Qty: Int)
    {
        self.ingredientname = IngredientName
        self.ingredientdesc = IngredientDesc
        self.cost = Cost
        self.qty = Qty
    }
}
public var ingredientlibrary = [ingredients]()
//Boolean to make sure an object is only initialized once to prevent duplicates

//The functions to initialize to an object by permanent
public func postinitialize()
{
    
}

public var cart = [ingredients]()

public func foodinitialize()
{
    foodlibrary = []
      //  var arrayname: [String] = ["Smoked Salmon", "Tenderloin Steak", "French Fries", "Chinese Fried Rice", "Mashed Potato", "Potato Wedges", "Sunny Side Up", "Fried Chicken", "Cheese Burger", "Fried Noodle", "Chicken Karaage", "Chicken Katsu, "Onion Ring", "Salmon Nigiri", "Tamago Nigiri", "Ebi Tempura", "Fried Shrimp", "Fried Dory", "Fried Banana", "Grilled Banana", "Grilled Corn", "Salmon Sashimi", "Tamago Sashimi", "Crazy Fried Rice", "Mushroom Cream Soup"]
    let smokedsalmon = foods.init(Name: "Smoked Salmon", Ingredient: ["Salmon"])
    let tenderloinsteak = foods.init(Name: "Tenderloin Steak", Ingredient: ["Beef"])
    let frenchfries = foods.init(Name: "French Fries", Ingredient: ["Potato"])
    let friedrice = foods.init(Name: "Fried Rice", Ingredient: ["Rice"])
    let mashedpotato = foods.init(Name: "Mashed Potato", Ingredient: ["Potato"])
    let potatowedges = foods.init(Name: "Potato Wedges", Ingredient: ["Potato"])
    let friedchicken = foods.init(Name: "Fried Chicken", Ingredient: ["Chicken"])
    let sunnysideup = foods.init(Name: "Sunny Side Up", Ingredient: ["Egg"])
    let salmonsashimi = foods.init(Name: "Salmon Sashimi", Ingredient: ["Salmon"])
    let tamagosashimi = foods.init(Name: "Tamago Sashimi", Ingredient: ["Egg"])
        foodlibrary.append(smokedsalmon)
        foodlibrary.append(tenderloinsteak)
        foodlibrary.append(frenchfries)
        foodlibrary.append(friedrice)
        foodlibrary.append(mashedpotato)
        foodlibrary.append(potatowedges)
        foodlibrary.append(friedchicken)
        foodlibrary.append(sunnysideup)
        foodlibrary.append(salmonsashimi)
        foodlibrary.append(tamagosashimi)
}

public func foodtempinitialize()
{
    foodlibrary = []
    //  var arrayname: [String] = ["Smoked Salmon", "Tenderloin Steak", "French Fries", "Chinese Fried Rice", "Mashed Potato", "Potato Wedges", "Sunny Side Up", "Fried Chicken", "Cheese Burger", "Fried Noodle", "Chicken Karaage", "Chicken Katsu, "Onion Ring", "Salmon Nigiri", "Tamago Nigiri", "Ebi Tempura", "Fried Shrimp", "Fried Dory", "Fried Banana", "Grilled Banana", "Grilled Corn", "Salmon Sashimi", "Tamago Sashimi", "Crazy Fried Rice", "Mushroom Cream Soup"]
    let smokedsalmon = foods.init(Name: "Smoked Salmon", Ingredient: ["Salmon"])
    let tenderloinsteak = foods.init(Name: "Tenderloin Steak", Ingredient: ["Beef"])
    let frenchfries = foods.init(Name: "French Fries", Ingredient: ["Potato"])
    let friedrice = foods.init(Name: "Fried Rice", Ingredient: ["Rice"])
    let mashedpotato = foods.init(Name: "Mashed Potato", Ingredient: ["Potato"])
    let potatowedges = foods.init(Name: "Potato Wedges", Ingredient: ["Potato"])
    let friedchicken = foods.init(Name: "Fried Chicken", Ingredient: ["Chicken"])
    let sunnysideup = foods.init(Name: "Sunny Side Up", Ingredient: ["Egg"])
    let salmonsashimi = foods.init(Name: "Salmon Sashimi", Ingredient: ["Salmon"])
    let tamagosashimi = foods.init(Name: "Tamago Sashimi", Ingredient: ["Egg"])
    foodlibrarytemp.append(smokedsalmon)
    foodlibrarytemp.append(tenderloinsteak)
    foodlibrarytemp.append(frenchfries)
    foodlibrarytemp.append(friedrice)
    foodlibrarytemp.append(mashedpotato)
    foodlibrarytemp.append(potatowedges)
    foodlibrarytemp.append(friedchicken)
    foodlibrarytemp.append(sunnysideup)
    foodlibrarytemp.append(salmonsashimi)
    foodlibrarytemp.append(tamagosashimi)
}

public func ingredientinitialize()
{
    ingredientlibrary = []
    let rice = ingredients.init(IngredientName: "Rice", IngredientDesc: "", Cost: 10, Qty: 1)
    let potato = ingredients.init(IngredientName: "Potato", IngredientDesc: "", Cost: 10, Qty: 1)
    let beef = ingredients.init(IngredientName: "Beef Meat", IngredientDesc: "", Cost: 20, Qty: 1)
    let chicken = ingredients.init(IngredientName: "Chicken Meat", IngredientDesc: "", Cost: 15, Qty: 1)
    let egg = ingredients.init(IngredientName: "Egg", IngredientDesc: "", Cost: 5, Qty: 1)
    let bread = ingredients.init(IngredientName: "Bread", IngredientDesc: "", Cost: 3, Qty: 1)
    let lamb = ingredients.init(IngredientName: "Lamb Meat", IngredientDesc: "", Cost: 15, Qty:  1)
    let pork = ingredients.init(IngredientName: "Pork Meat", IngredientDesc: "", Cost: 20, Qty: 1)
    let turkey = ingredients.init(IngredientName: "Turkey Meat", IngredientDesc: "", Cost: 30, Qty: 1)
    let tomato = ingredients.init(IngredientName: "Tomato", IngredientDesc: "", Cost: 2, Qty: 1)
    ingredientlibrary.append(rice)
    ingredientlibrary.append(potato)
    ingredientlibrary.append(beef)
    ingredientlibrary.append(chicken)
    ingredientlibrary.append(egg)
    ingredientlibrary.append(bread)
    ingredientlibrary.append(pork)
    ingredientlibrary.append(turkey)
    ingredientlibrary.append(tomato)
    ingredientlibrary.append(lamb)
}

//Foods
//French Fries
struct frenchfriesstruct
{
    var noarray = ["1. ","2. ", "3. ", "4. ", "5. ", "6. ", "7. ", "8. ", "9. ", "10. ", "11.", "12. ", "13. ", "14. ", "15. ", "16. ", "17. ", "18. ", "19. ", "20. "]
    var stepsarray = ["Get some potatoes.", "Wash, dry, and peel the potatoes of any dirt or grime.", "Fill a dry pan with vegetable oil about 1/3 of the way full.", "Using a sharp, clean knife, chop the potatoes with caution.", "Make sure the vegetable oil is hot before you put the potatoes in.", "Cook the potato slices in the oil until they are golden brown.", "Cool the cooked French fries.", "Finished."]
    var timearray = ["00:00", "00:30", "01:25", "02:00", "02:45", "03:20", "04:00", "05:00", "06:00", "06:30", "07:15", "08:00", "08:20", "09:00", "09:30", "10:00", "10:40", "11:20", "12:20", "13:10"]
}
struct smokedsalmonstruct
{
    var noarray = ["1. ","2. ", "3. ", "4. ", "5. ", "6. ", "7. ", "8. ", "9. ", "10. ", "11.", "12. ", "13. ", "14. ", "15. ", "16. ", "17. ", "18. ", "19. ", "20. "]
    var stepsarray = ["Soak the salmon fillet in a brine solution for at least 4 hours, but preferably overnight.", " submerge the alder wood plank in water, placing a heavy object on top of it to prevent floating.", "Preheat an outdoor smoker for 160 to 180 degrees F (70 to 80 degrees C).", "Remove the salmon from the brine, rinse thoroughly under cold running water, and pat dry with paper towels.", "Remove the wood plank from the water, and lay the fish out on the plank. Season with freshly ground black pepper.", "Smoke the salmon for at least 2 hours, checking after 1 1/2 hours for doneness. The fish is done when it flakes with a fork, but it should also not be too salty.", " Adjust the cooking time and salty flavor to your taste.", "During the last 30 minutes of smoking, mix together the brown sugar and water to form a paste. Brush this liberally onto the salmon."]
        var timearray = ["00:00", "00:30", "01:25", "02:00", "02:45", "03:20", "04:00", "05:00", "06:00", "06:30", "07:15", "08:00", "08:20", "09:00", "09:30", "10:00", "10:40", "11:20", "12:20", "13:10"]
}




