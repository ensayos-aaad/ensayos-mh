# Soluciones en python

## Solución a fuerza bruta

La solución se encuentra en el archivo [knapsack_brute_force.py](knapsack_brute_force.py). Este codigo se tomo del siguiente [link](https://github.com/rishal-hurbans/Grokking-Artificial-Intelligence-Algorithms/blob/master/ch04-evolutionary_algorithms/knapsack_brute_force.py)

Cuando se corrió la salida fue:

```
Number of combinations:  256
Iteration:  1
Best score:  1
Best individual:  (0, 0, 0, 0, 0, 0, 0, 1)
Iteration:  2
Best score:  5
Best individual:  (0, 0, 0, 0, 0, 0, 1, 0)
Iteration:  3
Best score:  6
Best individual:  (0, 0, 0, 0, 0, 0, 1, 1)
Iteration:  6
Best score:  8
Best individual:  (0, 0, 0, 0, 0, 1, 1, 0)
Iteration:  7
Best score:  9
Best individual:  (0, 0, 0, 0, 0, 1, 1, 1)
Iteration:  11
Best score:  10
Best individual:  (0, 0, 0, 0, 1, 0, 1, 1)
Iteration:  35
Best score:  11
Best individual:  (0, 0, 1, 0, 0, 0, 1, 1)
Iteration:  38
Best score:  13
Best individual:  (0, 0, 1, 0, 0, 1, 1, 0)
Iteration:  162
Best score:  14
Best individual:  (1, 0, 1, 0, 0, 0, 1, 0)
Iteration:  178
Best score:  15
Best individual:  (1, 0, 1, 1, 0, 0, 1, 0)
(1, 0, 1, 1, 0, 0, 1, 0)
Total time:  0.007005214691162109
```

Segun lo anterior la solución es:

|Item ID|Item Name|Weight (kg)|Value ($)|
|---|---|---|---|
|1|Pearls|3|4|
|3|Crown|4|5|
|4|Coin|1|1|
|7|Ring|2|5|

