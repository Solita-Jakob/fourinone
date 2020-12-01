Create a four in one plot in R
==============================

Installing from GitHub:
-----------------------

    # install.packages("devtools")
    devtools::install_github('Solita-Jakob/fourinone')

In case you miss the package devtools, you call install it by removing
the comment (\#) and then run install.packages(“devtools”). This is what
it looks like.

    library(fourinone)
    four_in_one(y=economics$pce,x=economics$psavert)

![Four\_in\_one\_plot](four_in_one.png)
