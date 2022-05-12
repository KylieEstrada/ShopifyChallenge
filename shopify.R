library(readxl)

shopify <- read_excel("~/Documents/R/Shopify Challenge/2019 Winter Data Science Intern Challenge Data Set.xlsx")
view(shopify)

#### Part a ####

# How did they get $3145.15? Pretty straightforward how this number came to be! 
mean(shopify$order_amount)

#### Part b ####

# unit_cost would is the price of a single shoe, I'd like to see its distribution.
shopify$unit_cost <- shopify$order_amount / shopify$total_items

# We have some uh.... outliers here. I feel like it's not unreasonable to assume that $25,725 is insane.
# Unless this is the most inelastic product in the world, which it might be! I'm making this judgement call,
# since I can't really explore whether or not this shoe value is an error.
boxplot(shopify$unit_cost)

# Removing outliers, I feel like a unit price over $10,000 is insane.
no_outliers <- subset(shopify, unit_cost < 10000)

# That looks much better, and I'm alright with the max unit value of $350.
boxplot(no_outliers$unit_cost, ylab = "Unit Cost")

# A log transform on this makes the data look more normal, so I'm going to report on the median order amount!
boxplot(log(no_outliers$order_amount), ylab = "Log of Order Amount")

#### Part c ####

# The median order value is $284!
median(no_outliers$order_amount)
