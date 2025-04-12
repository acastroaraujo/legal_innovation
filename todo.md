Add third mechanism:

-   newness, as given by the surrounding semantic density.

Do something with new variables

-   rj, chamber

Add new things on precedent.

-   C-370 del 2006, C-455-06, Jaime Araújo Rentería

-   With regards to the creation of a system of precedent, and the co-ocurrence figure in the main text, see Cepeda Espinosa (2017), particularly pages 32-42 on how the Court created this in a civil law country.

More on innovation:

-   The Court explicitly advocates for the usage of "principle-based argumentation" in the resolution of hard cases. They do this self-consciously.

    This is important. Driven by distrust towards the other branches of government, the court has "innovated" in the sense that it has claimed decision-making power (aka discretion) in its creation of structural injunctions and the "substitution of the constitution doctrine." This can be thought of as discretion regarding the "role function" of the Court.

Technical stuff:

-   Clarify ELPD vs AIC

    https://discourse.mc-stan.org/t/understanding-looic/13409/12

**From Claude:**

The Expected Log Pointwise Predictive Density (ELPD) differs from information criteria like AIC and BIC in several important ways:

1.  **Prediction vs. Fit**: ELPD directly measures predictive performance on new data, while AIC and BIC primarily assess model fit to existing data with penalties for complexity.

2.  **Theoretical Foundation**:

    1.  ELPD: Based on out-of-sample prediction accuracy

    2.  AIC: Approximates Kullback-Leibler divergence

    3.  BIC: Approximates Bayesian model evidence

3.  **Complexity Penalties**:

    1.  ELPD: No explicit penalty term, complexity handling occurs naturally through cross-validation

    2.  AIC: Adds 2k penalty (k = number of parameters)

    3.  BIC: Adds log(n)k penalty (n = sample size)

4.  **Sample Size Sensitivity**:

    1.  ELPD: Less affected by sample size

    2.  BIC: Strongly affected by sample size

    3.  AIC: Moderately affected by sample size

5.  **Practical Implementation**: ELPD typically requires cross-validation or approximations like WAIC or LOO-CV, making it more computationally intensive than AIC/BIC, which have simple closed-form calculations.

6.  **Bayesian Context**: ELPD works well with Bayesian models and accounts for the full posterior distribution, while AIC/BIC use point estimates.

For small samples, AIC often performs better, while BIC tends to select simpler models, especially with large samples. ELPD generally provides more reliable estimates of predictive performance across different contexts.