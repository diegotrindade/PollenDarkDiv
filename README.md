# PollenDarkDiv

This repository includes the data and R scripts used in the paper: "Observed and dark diversity dynamics over millennial time-scales: fast-life history traits linked to expansion lags of plants in Northern Europe".

**To reproduce this repository, you can either download or clone it as a new project in your RStudio. More information on working with projects can be found [here](https://support.rstudio.com/hc/en-us/articles/200526207-Using-RStudio-Projects).**

Note that, to improve reproducibility, we are using [renv](https://rstudio.github.io/renv/) to manage packages used in this project. Thus, after downloading and initializing this repository in your RStudio you should receive the following message:

"**Use `renv::store()`** **to install packages recorded in the lockfile**".

Run `renv::store()` in your console and type **"y"** to proceed with the download of packages needed to reproduce the analyses and figures. It may take some time, depending on the machine and packages you have.

If you face some error related to package installation or conflict, run `renv::init()` and choose the second option *"Discard the lockfile and re-initialize the project."*. This will take a few more minutes but should tackle any error and all packages will be installed in your local system.

### Main files used in this project:

1.  `"~scripts/pollenScript.Rmd"` - code to reproduce **all analyses and figures** used in the manuscript, except Fig. 1, which was created using the software InkScape (<https://inkscape.org>);

2.  `"~paper/pollen_paper.Rmd"` - manuscript (main text, figures, citations and supplementary material) written in Rmarkdown;

### Additional information

This repository contains the following folders and files:

1.  Folder **"scripts"** includes:

    *`"pollenScript.Rmd"`* - code to generate **all analyses and figures** used in the paper, except Fig. 1, which was created using the software InkScape (<https://inkscape.org>);

    *`"hydeScript.Rmd"`* - code used to generate the population trend used in Fig. 1;

    *`"paleoScript.Rmd"`* - code used to generate the climatic trend used in Fig. 1.

2.  Folder **"paper"** includes:

    *`"pollen_paper.Rmd"`* - Rmarkdown file used to generate the word document of the manuscript (main text, figures, citations and supplementary material);

    *`"figures_SupMat.Rmd"`* - child document used in "pollen_paper.Rmd" to generate the Figures in Supplementary material;

    *`"pollenScripts_SupMat.Rmd"`* - code and figures shown in Supplementary Material;

    *`"pollen.bib"`* - BibText file with references used in the manuscript.

3.  Folder **"data"** includes both sedimentary pollen and trait data used in the study, as well as the data used to generate the climatic trend shown in Fig. 1 (`"~/data/paleoview"`);

4.  Folder **"figures"** includes all figures shown in the manuscript (both in main text and supplementary material).

5.  Folder **"functions"** includes:

    *`"annotations.R"`* - some annotation code used in Fig. 2 and 3;

    *`"decompSpace.R"`* - function used to decompose the functional space of observed and dark diversity;

    *`"GAMoutput.R"`* - function used to generate the GAM tables shown in the Supplementary Material.

6.  Folder **"rds"** includes .RDS files used to speed up the generation of some Rmd chunks or reduce storage space on GitHub.

7.  Folder **"renv"** contains the packages and their current version used in this project. -- all packages' names and version can be seen in "renv.lock" file in the main folder.
