-- Create a table for users
-- Store their name
CREATE TABLE `User` (
  `idUser` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(60) NULL,
  PRIMARY KEY (`idUser`),
  UNIQUE INDEX `idUser_UNIQUE` (`idUser` ASC));

-- Create a table of orders
-- Record the orders date and whether a pick up or delivery has been requested
CREATE TABLE `Order` (
  `idOrder` INT NOT NULL AUTO_INCREMENT,
  `Date` DATETIME NOT NULL,
  `withDelivery` TINYINT(1) NULL,
  `withPickup` TINYINT(1) NULL,
  PRIMARY KEY (`idOrder`));

-- Create a table of the items offered by IKEA
-- Record vital information about the product and if it's refurbished
CREATE TABLE `Item` (
  `idItem` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(35) NULL,
  `Price` DECIMAL(6) NULL,
  `Description` VARCHAR(255) NULL,
  `Picture` VARCHAR(45) NULL,
  `isRefurbished` TINYINT(1) NULL,
  PRIMARY KEY (`idItem`));

-- Create a table for the purchased items that are part of an order
-- Record the quantity of purchased goods
-- Cascade delete and update are disabled as this should not affect the existing orders or items
CREATE TABLE `OrderItem` (
  `Order` INT NOT NULL,
  `Item` INT NOT NULL,
  `Quantity` INT NOT NULL,
  INDEX `OrderItem_Order_idx` (`Order` ASC),
  INDEX `OrderItem_Item_idx` (`Item` ASC),
  CONSTRAINT `OrderItem_Order`
    FOREIGN KEY (`Order`)
    REFERENCES `Order` (`idOrder`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `OrderItem_Item`
    FOREIGN KEY (`Item`)
    REFERENCES `Item` (`idItem`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- Add userId as a foreign key to the Order table so we can know who the order belongs to
ALTER TABLE `Order` 
ADD COLUMN `userId` INT NULL AFTER `withPickup`,
ADD INDEX `order_user_idx` (`userId` ASC);

ALTER TABLE `Order` 
ADD CONSTRAINT `order_user`
  FOREIGN KEY (`userId`)
  REFERENCES `User` (`idUser`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
