# Machine learning workflows for competitors

Contains all the information to replicate the machine learning experiment presented by the speaker. However, one may decide to do all this [kaggle](https://www.kaggle.com)
which the speaker will show you how to do it along the way. In other news, kaggle also gives G.P.U support as well. We'll go through some the slides first so check those out first. Followed
by the jupyter notebook and the R code, it's a good idea to have those installed beforehand. Otherwise, anyone with enthusiasm to learn can attend this presentation though knowing how to 
code in python/R would help. Even Julia i may do Julia presentations soon.


Setting up your environment
---
* Download Anaconda for your operating system for Python 3 [anaconda](https://www.anaconda.com/download/)

* Download R studio and get the free one [RStudio](https://www.rstudio.com/products/rstudio/download/)

* Create a conda environment depending on what your Operating system is:

  `conda env create -f environment.yml` for ubuntu users
  `conda env create -f environment_macOS_elcapitan10.11.6.yml` for MacOS users
  
  On the flipside. This is how you create the YAML files of your environments :) 
  
  `conda env export --file environment.yml -n py35` py35 is the name of your conda virtual environment

  This creates an environment called py35. Activate it with this command in your terminal

  `source activate py35`

* In your terminal, in the directory where you cloned this repository. Run this command

  `jupyter notebook ml_workflow_notebook.ipynb`