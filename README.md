# Zero-setup R-Studio with GitHub Codespaces

This is the repository supporting the BD-STEP Biannual Meeting presentation "Data Science Tutorial".

You can recreate the demos in the talk using the steps outlined below.

## Dev Containers in GitHub Codepaces

If you have access to GitHub CodeSpaces, click the green "<> Code" button at the top right on this repository page, and then select "Create codespace on main". (GitHub CodeSpaces is available with [GitHub Enterprise](https://github.com/enterprise) and [GitHub Education](https://education.github.com/).)

To open RStudio Server, click the Forwarded Ports "Radio" icon at the bottom of the VS Code Online window.

![Forwarded Ports](/misc/img/forwarded_ports.png)

In the Ports tab, click the Open in Browser "World" icon that appears when you hover in the "Local Address" column for the Rstudio row.

![Ports](/misc/img/ports.png)

This will launch RStudio Server in a new window. Log in with the username and password `rstudio/rstudio`. 

* NOTE: Sometimes, the RStudio window may fail to open with a timeout error. If this happens, try again, or restart the Codepace.

In RStudio, use the File menu to open the `/workspaces`, folder and then browse to open the file `health_diabetes_classification`

## Expectations of this Presentation
-   This presentation will expand upon the *Good Practices in Reproducible Data Science* presented at the last BD-STEP Roundtable.

-   Using R (and a bit of SQL) this interactive presentation will transform a data exploration exercise into a more easily systematic data pipeline.

-   You (the fellow) will explore data and fill in certain snippets of code within the R Markdown file (EDA/EDA.Rmd) to complete the data pipeline in SQL and R.

-   The data pipeline will consist of .R pipeline files as well as a make/batch file to execute them in chronological order.

-   By the end of this, you should have a completed pipeline that will produce the 'best' producing ML algorithm and metrics for predicting Outcome/Diabetes.

![Flow Chart](/misc/img/flow_diagram.png)

## Contents of the Codespace Directory
- /.devcontainer: holds files such as the Dockerfile and Requirements.R files which help initialize the requiremetns of the codespace (i.e. the versions of R/Python to be installed, the packages to be included as well as dependencies, etc.)
- /EDA: holds the RMarkdown file which will be used both for exploratory analysis of the PIMA dataset but also as a presentation report of the findings. 
- /data: holds the initial PIMA dataset (named diabetes.csv) and will house all populated csv files created throughout the presentation/Rmd run. 
- /report: holds the final confusion matrix created by the pipeline
- /src: holds the .R files which make up the pipeline and can be run in sequential order using the makefile
- makefile: holds the terminal commands to run the pipeline (.R files) and delete all extraneous files built during the run

# Resources and Links

* [GitHub Codespaces](https://github.com/features/codespaces) - Available with GitHub Enterprise and GitHub Education
* [Rocker](https://www.rocker-project.org/) - Containers for R 
* [Dev Containers](https://containers.dev/) - Overview and specification
* [Dev Containers in Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) - Remote-Containers extension 
* [Visual Studio Code](https://code.visualstudio.com/) - Free editor available for Windows, Mac and Linux
* [Pima Indians Diabetes Database](https://www.kaggle.com/datasets/uciml/pima-indians-diabetes-database) - Predict the onset of diabetes based on diagnostic measures
