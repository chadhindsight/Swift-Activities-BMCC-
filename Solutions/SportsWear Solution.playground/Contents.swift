
print("🏪 Welcome to the Sportswear Store!")

struct Product {
    var name: String
    var price: Double
    var inStock: Int
}

struct Store {
    var inventory: [Product] = [
        Product(name: "Nike Tech Hoodie", price: 120.0, inStock: 10),
        Product(name: "Adidas Sneakers", price: 90.0, inStock: 5),
        Product(name: "Puma Shorts", price: 35.0, inStock: 0),
        Product(name: "New Balance Socks (3-pack)", price: 12.0, inStock: 20),
        Product(name: "Nike Running Cap", price: 18.0, inStock: 8),
        Product(name: "Adidas Tracksuit Pants", price: 60.0, inStock: 6)
    ]
    
    // Sell a product
    mutating func sellProduct(name: String, quantity: Int) -> String {
        for i in 0..<inventory.count {
            if inventory[i].name == name {
                if inventory[i].inStock >= quantity {
                    inventory[i].inStock -= quantity
                    return "Sold \(quantity) x \(name)"
                } else {
                    return "Not enough stock for \(name)"
                }
            }
        }
        return "\(name) not found in inventory"
    }
    
    // Refund a product
    mutating func refundProduct(name: String, quantity: Int) -> String {
        for i in 0..<inventory.count {
            if inventory[i].name == name {
                inventory[i].inStock += quantity
                
                 return "Refunded \(quantity) x \(name)"
            }
        }
        return "\(name) not found in inventory"
    }
    
    // Add new product
    mutating func addNewProduct(name: String, price: Double, quantity: Int) -> String {
        let newProduct = Product(name: name, price: price, inStock: quantity)
        inventory.append(newProduct)
        return "Added new product: \(name) x \(quantity)"
    }
    
    // Get inventory as a string
    func getInventory() -> String {
        var output = "\nCurrent Inventory:\n"
        
        // Add your loop logic here
        for i in 0..<inventory.count {
            output += "\(inventory[i].name) | $\(inventory[i].price) | Stock: \(inventory[i].inStock)\n"
        }
        
        return output
    }
    
    // Check stock
    func isInStock(name: String) -> Bool {
        for i in 0..<inventory.count {
            if inventory[i].name == name {
                return inventory[i].inStock > 0
            }
        }
        return false
    }
}


// ✅ Use it
var store = Store()

print(store.getInventory())

print(store.sellProduct(name: "Nike Tech Hoodie", quantity: 2))
print(store.getInventory())

print(store.refundProduct(name: "Nike Tech Hoodie", quantity: 1))
print(store.getInventory())

print(store.addNewProduct(name: "Under Armour T-Shirt", price: 25.0, quantity: 15))
print(store.getInventory())

let check = store.isInStock(name: "Puma Shorts") ? "Yes" : "No"
print("Is Puma Shorts in stock? \(check)")
