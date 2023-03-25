import itertools
from itertools import product
import time

# Set the indexes for data array
# 0 = name, 1 = weight, 2 = value, 3 = fitness
KNAPSACK_WEIGHT_INDEX = 1
KNAPSACK_VALUE_INDEX = 2
KNAPSACK_FITNESS_INDEX = 3

# Small knapsack dataset
knapsack_items = [
    ['Pearls', 3, 4],
    ['Gold', 7, 7],
    ['Crown', 4, 5],
    ['Coin', 1, 1],
    ['Axe', 5, 4],
    ['Sword', 4, 3],
    ['Ring', 2, 5],
    ['Cup', 3, 1],
]

# Get all possible combinations of items. This is exhaustive and computationally expensive!
def get_all_combinations(items):
    combinations = []
    for index in range(0, len(items)):
        combinations.append(items[index])
        possibilities = [list(x) for x in itertools.combinations(items, index)]
        combinations.append(possibilities)
    return combinations


# Calculate the fitness of the items selected given a maximum weight
def calculate_individual_fitness(solution, maximum_weight):
    total_weight = 0
    total_value = 0
    # Get the values and weight for each item marked with a 1
    for item_index in range(0, len(solution)):
        item = solution[item_index]
        if item == 1:
            total_weight += knapsack_items[item_index][KNAPSACK_WEIGHT_INDEX]
            total_value += knapsack_items[item_index][KNAPSACK_VALUE_INDEX]
    # Zero fitness if the weight constraint is violated
    if total_weight > maximum_weight:
        return 0
    return total_value


# Run the brute force algorithm
def run_brute_force():
    bit_string_size = 8
    best_score = 0
    best_individual = []
    knapsack_max_capacity = 10
    print('Number of combinations: ', 2**bit_string_size)
    iteration = 0
    for i in product([0, 1], repeat=bit_string_size):
        current = calculate_individual_fitness(i, knapsack_max_capacity)
        if current > best_score:
            best_score = current
            best_individual = i
            print('Iteration: ', iteration)
            print('Best score: ', best_score)
            print('Best individual: ', best_individual)
        iteration += 1

    print(best_individual)

# Execute the brute force approach and measure it's performance
start_time = time.time()
run_brute_force()
end_time = time.time()
total_time = end_time - start_time
print('Total time: ', total_time)
