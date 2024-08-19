⍝  1 + 1 Genetic Algorithm with a OneMax fitness function.
⍝
⍝  The OneMax fitness function is silly, optimizing something that is known.
⍝  It is helpful for testing purposes.

⎕IO←0                                          ⍝  IMPORTANT

init←{{? ⍵ + 1} ¨ ⍵ ⍴ 1}                       ⍝  initialize the individual

mut←{(1 ÷ ≢ ⍵) {⍺ > ? 0: 2 | (⍵ + 1) ⋄ ⍵} ¨ ⍵} ⍝  mutate the candidate
fit←{+ / ⍵}                                    ⍝  calculate the fitness
sel←{(fit ⍺) > (fit ⍵): ⍺ ⋄ ⍵}                 ⍝  select best candidate

hit←{(≢ ⍵) = (fit ⍵)}                          ⍝  did we hit the optimum?

⍝  GA is the main function 
⍝  left-hand side:   maximum number of cycles
⍝  right-hand side:  length of the individual
⍝
⍝  returns the number of iterations used 
⍝  and the best performing individual (the solution)

GA←{budget←⍺ ⋄ ⍺ {hit ⍵ ∨ ⍺ = 0: (budget - ⍺) ⍵ ⋄ (⍺ - 1) ∇ ⍵ sel mut ⍵} ⍵} 

⍝  Example usage:

30 GA 0 0 0 0 0 0

⍝  Generate a random initial candidate with a genotype of length 100

1000 GA init 100

⍝ or do 6 runs in a row, this is the limit to display on the tryapl.org ;-)

{1000 GA (init 100)} ¨ 6 1 ⍴ 1
