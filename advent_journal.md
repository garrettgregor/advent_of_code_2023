# Day 1

Today, I did my first LeetCode challenge in a long time, and took a while to get through an "easy" problem but managed to solve it in about 12mins. Then, I attempted another "easy" problem and eventually found myself so confused that I turned to the solutions to look for answers. I was happy to find that a lot of other people found the problem to be tricky and poorly worded, and even forwarded it to a previous cohortmate who thought the same. I'm looking forward to getting in the habit of trying these advent challenges and using this as a springboard to get back in the habit of coding daily. Thanks Erin!

Note to self: come back to the [GCD LeetCode Challenge](https://leetcode.com/problems/greatest-common-divisor-of-strings/description/?envType=study-plan-v2&envId=leetcode-75)

# Day 2

I felt really thrown off by the conundrum puzzle at first and am recognizing that my REGEX expertise is not particulary good. I struggle a lot with parsing those strings. I've also noticed that I've struggled with the basic setup for how to intialize files and how to create a runner for the program to try to abstract away some of the data. For example, I'd like for everytime I run a test to not be confronted with the following:

```zsh
garrettgregor ~/coding/advent_of_coding_2023/day_2 [main] $ rspec spec/conundrum_spec.rb:72
Run options: include {:locations=>{"./spec/conundrum_spec.rb"=>[72]}}
F

Failures:

  1) Conundrum sum_powers gives a minimum amount of cubes per color that was required per game
     Failure/Error: expect(conundrum.sum_powers([a, b, c, d, e])).to eq(2286)

     NoMethodError:
       undefined method `sum_powers' for #<Conundrum:0x0000000104d0ff70 @contents=["Game 1: 10 red, 7 green, 3 blue; 5 blue, 3 red, 10 green; 4 blue, 14 green, 7 red; 1 red, 11 green; 6 blue, 17 green, 15 red; 18 green, 7 red, 5 blue", "Game 2: 13 green, 10 red; 11 green, 1 blue, 7 red; 5 red, 12 green, 1 blue; 12 green, 6 red; 8 green, 5 red; 12 green, 1 red", "Game 3: 7 green, 1 blue; 1 blue, 3 green, 1 red; 1 green, 1 blue; 2 green; 1 blue, 7 green, 2 red; 2 green", "Game 4: 7 green, 11 blue; 12 blue, 7 green; 1 green, 7 blue; 5 blue, 2 green; 5 red, 9 green, 14 blue", "Game 5: 2 red, 6 blue, 6 green; 2 red, 6 green; 12 blue, 5 red, 3 green; 12 green, 5 red, 8 blue; 10 blue, 5 green; 2 red, 4 green" ...
```

That being said, as I continued to work through the problem, I noticed myself getting back into the habit of using TDD and abstracting away methods and using DRY principles to ensure that methods had single functions and that I was keeping things much cleaner. I hope that everyone joins!