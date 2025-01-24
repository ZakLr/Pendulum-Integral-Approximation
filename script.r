# Fonction pour calculer l'intégrale de l'équation du pendule
f <- function(theta, k) {
  1 / sqrt(1 - k^2 * sin(theta)^2)
}

# Approximation numérique du résultat analytique avec une règle du trapèze de haute précision
numerical_elliptic_integral <- function(k, n = 100000) {
  a <- 0                    
  b <- pi / 2              
  h <- (b - a) / n         
  x <- seq(a, b, length.out = n + 1)
  y <- sapply(x, f, k = k)
  h * (sum(y) - (y[1] + y[n + 1]) / 2)
}

# Implémentation de la règle du trapèze
trapezoidal_rule <- function(f, a, b, n, k) {
  h <- (b - a) / n
  x <- seq(a, b, length.out = n + 1)
  y <- sapply(x, f, k = k)
  h * (sum(y) - (y[1] + y[n + 1]) / 2)
}

# Implémentation de la règle de Simpson
simpsons_rule <- function(f, a, b, n, k) {
  if (n %% 2 != 0) stop("n doit être pair pour la règle de Simpson")
  h <- (b - a) / n
  x <- seq(a, b, length.out = n + 1)
  y <- sapply(x, f, k = k)
  
  # Gestion des termes internes pour n > 2
  somme_interne <- if (n > 2) {
    2 * sum(y[seq(3, n - 1, by = 2)])
  } else {
    0  # Pas de termes supplémentaires si n = 2
  }
  
  h / 3 * (y[1] + y[n + 1] + 
           4 * sum(y[seq(2, n, by = 2)]) + 
           somme_interne)
}

# Paramètres de base
a <- 0           # Limite inférieure
b <- pi / 2      # Limite supérieure
k <- 0.99        # Paramètre de l'équation du pendule
true_result <- numerical_elliptic_integral(k)  # Résultat de haute précision

# Liste des valeurs de n à tester
n_values <- c(2, 4, 8, 16, 32, 64, 128, 256)

# Calcul des résultats pour chaque n
results <- data.frame(
  n = n_values,
  Trapèze = sapply(n_values, function(n) trapezoidal_rule(f, a, b, n, k)),
  Simpson = sapply(n_values, function(n) simpsons_rule(f, a, b, n, k))
)

# Ajout des erreurs dans le tableau
results$Erreur_Trapèze <- abs(results$Trapèze - true_result)
results$Erreur_Simpson <- abs(results$Simpson - true_result)

# Affichage des résultats
cat("Résultats pour différentes valeurs de subdivisions (n) :\n")
print(results)

# Tracer les erreurs
plot(results$n, results$Erreur_Trapèze, type = "l", col = "red", lwd = 2, 
     xlab = "Nombre de subdivisions (n)", ylab = "Erreur",
     main = "Comparaison des erreurs : Règle du Trapèze vs Simpson")
lines(results$n, results$Erreur_Simpson, col = "blue", lwd = 2)
legend("topright", legend = c("Trapèze", "Simpson"), col = c("red", "blue"), lwd = 2)
